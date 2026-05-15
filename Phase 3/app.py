# ============================================================
#  app.py — KeySpace Real Estate Flask Application
#  CMPG 311 - Group 3 - NWU 2026
# ============================================================



from flask import (
    Flask, render_template, request,
    redirect, url_for, session, flash
)
from database import get_db, init_db
from datetime import date

app = Flask(__name__)
app.secret_key = 'keyspace_nwu_cmpg311_2026'

# Create tables when app starts
with app.app_context():
    init_db()


# ============================================================
# HOME — Show all available properties
# ============================================================
@app.route('/')
def index():
    conn = get_db()
    properties = conn.execute('''
        SELECT P.PropertyID, P.Title, P.Street,
               L.City, L.Province,
               PT.TypeName  AS PropertyType,
               P.Price, P.Bedrooms, P.Bathrooms,
               P.Size_sqm, P.ListingDate,
               A.FirstName || " " || A.LastName AS AgentName,
               A.ContactNumber
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        JOIN AGENT         A  ON P.AgentID        = A.AgentID
        WHERE P.Status = "Available"
        ORDER BY P.ListingDate DESC
    ''').fetchall()
    conn.close()
    return render_template('index.html', properties=properties)


# ============================================================
# PROPERTY DETAIL
# ============================================================
@app.route('/property/<int:property_id>')
def property_detail(property_id):
    conn = get_db()

    prop = conn.execute('''
        SELECT P.PropertyID, P.Title, P.Street,
               L.City, L.Province, L.PostalCode,
               PT.TypeName AS PropertyType,
               P.Price, P.Bedrooms, P.Bathrooms,
               P.Size_sqm, P.Status, P.ListingDate,
               A.FirstName || " " || A.LastName AS AgentName,
               A.ContactNumber, A.Email, A.AgentID
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        JOIN AGENT         A  ON P.AgentID        = A.AgentID
        WHERE P.PropertyID = ?
    ''', [property_id]).fetchone()

    if not prop:
        flash('Property not found.', 'error')
        return redirect(url_for('index'))

    features = conn.execute('''
        SELECT FeatureName FROM PROPERTY_FEATURE
        WHERE PropertyID = ?
    ''', [property_id]).fetchall()

    conn.close()
    return render_template('property_detail.html',
                           prop=prop,
                           features=[f['FeatureName'] for f in features])


# ============================================================
# SEARCH & FILTER
# ============================================================
@app.route('/search')
def search():
    city      = request.args.get('city', '').strip()
    ptype     = request.args.get('type', '').strip()
    max_price = request.args.get('max_price', '').strip()
    bedrooms  = request.args.get('bedrooms', '').strip()

    query  = '''
        SELECT P.PropertyID, P.Title, P.Street,
               L.City, L.Province,
               PT.TypeName AS PropertyType,
               P.Price, P.Bedrooms, P.Bathrooms, P.Size_sqm,
               A.FirstName || " " || A.LastName AS AgentName
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        JOIN AGENT         A  ON P.AgentID        = A.AgentID
        WHERE P.Status = "Available"
    '''
    params = []

    if city:
        query += ' AND UPPER(L.City) LIKE UPPER(?)'
        params.append('%' + city + '%')
    if ptype:
        query += ' AND PT.TypeName = ?'
        params.append(ptype)
    if max_price:
        query += ' AND P.Price <= ?'
        params.append(float(max_price))
    if bedrooms:
        query += ' AND P.Bedrooms >= ?'
        params.append(int(bedrooms))

    query += ' ORDER BY P.Price ASC'

    conn    = get_db()
    results = conn.execute(query, params).fetchall()
    types   = conn.execute(
        'SELECT TypeName FROM PROPERTY_TYPE ORDER BY TypeName'
    ).fetchall()
    conn.close()

    return render_template('search.html',
                           results=results,
                           types=[t['TypeName'] for t in types],
                           city=city, ptype=ptype,
                           max_price=max_price, bedrooms=bedrooms)


# ============================================================
# CLIENT REGISTRATION
# ============================================================
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        f = request.form
        conn = get_db()
        try:
            conn.execute('''
                INSERT INTO CLIENT
                (FirstName, LastName, Email, ContactNumber,
                 ClientType, BudgetMin, BudgetMax,
                 PreferredLocation, PreferredPropertyType,
                 RegistrationDate)
                VALUES (?,?,?,?,?,?,?,?,?,?)
            ''', [
                f['first_name'], f['last_name'],
                f['email'].lower().strip(), f['contact'],
                f['client_type'],
                f.get('budget_min') or None,
                f.get('budget_max') or None,
                f.get('pref_location') or None,
                f.get('pref_type') or None,
                date.today().isoformat()
            ])
            conn.commit()
            flash('Registration successful! You can now log in.', 'success')
            return redirect(url_for('client_login'))
        except Exception:
            flash('That email is already registered. Try logging in.', 'error')
        finally:
            conn.close()

    return render_template('register.html')


# ============================================================
# CLIENT LOGIN
# ============================================================
@app.route('/client/login', methods=['GET', 'POST'])
def client_login():
    if request.method == 'POST':
        email = request.form['email'].lower().strip()
        conn  = get_db()
        client = conn.execute('''
            SELECT ClientID, FirstName, LastName, ClientType
            FROM CLIENT WHERE Email = ?
        ''', [email]).fetchone()
        conn.close()

        if client:
            session['client_id']   = client['ClientID']
            session['client_name'] = client['FirstName'] + ' ' + client['LastName']
            session['client_type'] = client['ClientType']
            session.pop('agent_id', None)
            flash(f"Welcome back, {client['FirstName']}!", 'success')
            return redirect(url_for('client_dashboard'))
        else:
            flash('Email not found. Please register first.', 'error')

    return render_template('client_login.html')


# ============================================================
# CLIENT DASHBOARD
# ============================================================
@app.route('/client/dashboard')
def client_dashboard():
    if 'client_id' not in session:
        flash('Please log in to view your dashboard.', 'error')
        return redirect(url_for('client_login'))

    cid  = session['client_id']
    conn = get_db()

    saved = conn.execute('''
        SELECT P.PropertyID, P.Title, L.City, P.Price,
               P.Status, CSP.SavedDate,
               PT.TypeName AS PropertyType
        FROM CLIENT_SAVED_PROPERTY CSP
        JOIN PROPERTY     P  ON CSP.PropertyID = P.PropertyID
        JOIN LOCATION_TBL L  ON P.LocationID   = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        WHERE CSP.ClientID = ?
        ORDER BY CSP.SavedDate DESC
    ''', [cid]).fetchall()

    inquiries = conn.execute('''
        SELECT I.InquiryID, P.Title, I.InquiryType,
               I.InquiryDate, I.Status, I.Notes,
               A.FirstName || " " || A.LastName AS AgentName,
               A.ContactNumber
        FROM INQUIRY I
        JOIN PROPERTY P ON I.PropertyID = P.PropertyID
        JOIN AGENT    A ON I.AgentID    = A.AgentID
        WHERE I.ClientID = ?
        ORDER BY I.InquiryDate DESC
    ''', [cid]).fetchall()

    conn.close()
    return render_template('client_dashboard.html',
                           saved=saved, inquiries=inquiries)


# ============================================================
# SAVE A PROPERTY
# ============================================================
@app.route('/save/<int:property_id>')
def save_property(property_id):
    if 'client_id' not in session:
        flash('Please log in to save properties.', 'error')
        return redirect(url_for('client_login'))

    conn = get_db()
    try:
        conn.execute('''
            INSERT INTO CLIENT_SAVED_PROPERTY (ClientID, PropertyID, SavedDate)
            VALUES (?,?,?)
        ''', [session['client_id'], property_id, date.today().isoformat()])
        conn.commit()
        flash('Property saved to your dashboard!', 'success')
    except Exception:
        flash('You have already saved this property.', 'info')
    finally:
        conn.close()

    return redirect(url_for('property_detail', property_id=property_id))


# ============================================================
# SUBMIT AN INQUIRY
# ============================================================
@app.route('/inquiry/<int:property_id>', methods=['GET', 'POST'])
def submit_inquiry(property_id):
    if 'client_id' not in session:
        flash('Please log in to submit an inquiry.', 'error')
        return redirect(url_for('client_login'))

    conn = get_db()

    if request.method == 'POST':
       
        prop = conn.execute(
            'SELECT AgentID, Title FROM PROPERTY WHERE PropertyID = ?',
            [property_id]
        ).fetchone()

        if prop:
            conn.execute('''
                INSERT INTO INQUIRY
                (ClientID, PropertyID, AgentID, InquiryType,
                 InquiryDate, Status, Notes)
                VALUES (?,?,?,?,?,?,?)
            ''', [
                session['client_id'],
                property_id,
                prop['AgentID'],
                request.form['inquiry_type'],
                date.today().isoformat(),
                'Open',
                request.form.get('notes', '')
            ])
            conn.commit()
            conn.close()
            flash('Inquiry submitted! The agent will contact you soon.', 'success')
            return redirect(url_for('client_dashboard'))

    
    prop = conn.execute('''
        SELECT P.Title, A.FirstName || " " || A.LastName AS AgentName
        FROM PROPERTY P
        JOIN AGENT A ON P.AgentID = A.AgentID
        WHERE P.PropertyID = ?
    ''', [property_id]).fetchone()
    conn.close()

    return render_template('inquiry_form.html',
                           property_id=property_id, prop=prop)


# ============================================================
# AGENT LOGIN
# ============================================================
@app.route('/agent/login', methods=['GET', 'POST'])
def agent_login():
    if request.method == 'POST':
        email = request.form['email'].lower().strip()
        conn  = get_db()
        agent = conn.execute('''
            SELECT AgentID, FirstName, LastName, BranchID
            FROM AGENT WHERE Email = ?
        ''', [email]).fetchone()
        conn.close()

        if agent:
            session['agent_id']   = agent['AgentID']
            session['agent_name'] = agent['FirstName'] + ' ' + agent['LastName']
            session.pop('client_id', None)
            flash(f"Welcome, {agent['FirstName']}!", 'success')
            return redirect(url_for('agent_dashboard'))
        else:
            flash('Agent email not found.', 'error')

    return render_template('agent_login.html')


# ============================================================
# AGENT DASHBOARD
# ============================================================
@app.route('/agent/dashboard')
def agent_dashboard():
    if 'agent_id' not in session:
        flash('Please log in as an agent.', 'error')
        return redirect(url_for('agent_login'))

    aid  = session['agent_id']
    conn = get_db()

    listings = conn.execute('''
        SELECT P.PropertyID, P.Title, L.City,
               PT.TypeName AS PropertyType,
               P.Price, P.Status, P.ListingDate,
               P.Bedrooms, P.Bathrooms
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        WHERE P.AgentID = ?
        ORDER BY P.ListingDate DESC
    ''', [aid]).fetchall()

    inquiries = conn.execute('''
        SELECT I.InquiryID, P.Title, I.InquiryType,
               C.FirstName || " " || C.LastName AS ClientName,
               C.ContactNumber, C.Email AS ClientEmail,
               I.InquiryDate, I.Status, I.Notes
        FROM INQUIRY I
        JOIN PROPERTY P ON I.PropertyID = P.PropertyID
        JOIN CLIENT   C ON I.ClientID   = C.ClientID
        WHERE I.AgentID = ?
        ORDER BY I.InquiryDate DESC
    ''', [aid]).fetchall()

    
    active_count = conn.execute('''
        SELECT COUNT(*) AS cnt FROM PROPERTY
        WHERE AgentID = ? AND Status = "Available"
    ''', [aid]).fetchone()['cnt']

    conn.close()
    return render_template('agent_dashboard.html',
                           listings=listings,
                           inquiries=inquiries,
                           active_count=active_count)


# ============================================================
# AGENT — ADD PROPERTY
# ============================================================
@app.route('/agent/add_property', methods=['GET', 'POST'])
def add_property():
    if 'agent_id' not in session:
        return redirect(url_for('agent_login'))

    conn = get_db()

    if request.method == 'POST':
        f = request.form
        try:
            conn.execute('''
                INSERT INTO PROPERTY
                (AgentID, PropertyTypeID, LocationID, Street, Title,
                 Price, Size_sqm, Bedrooms, Bathrooms, Status, ListingDate)
                VALUES (?,?,?,?,?,?,?,?,?,"Available",?)
            ''', [
                session['agent_id'],
                int(f['property_type_id']),
                int(f['location_id']),
                f['street'],
                f['title'],
                float(f['price']),
                float(f['size_sqm']),
                int(f.get('bedrooms', 0)),
                int(f.get('bathrooms', 0)),
                date.today().isoformat()
            ])
            conn.commit()
            flash('Property listing added successfully!', 'success')
            conn.close()
            return redirect(url_for('agent_dashboard'))
        except Exception as e:
            flash(f'Error adding property: {str(e)}', 'error')

    prop_types = conn.execute(
        'SELECT PropertyTypeID, TypeName FROM PROPERTY_TYPE ORDER BY TypeName'
    ).fetchall()
    locations = conn.execute(
        'SELECT LocationID, City, Province FROM LOCATION_TBL ORDER BY City'
    ).fetchall()
    conn.close()

    return render_template('add_property.html',
                           prop_types=prop_types,
                           locations=locations)


# ============================================================
# AGENT — UPDATE PROPERTY STATUS
# ============================================================
@app.route('/agent/update_status/<int:property_id>', methods=['POST'])
def update_status(property_id):
    if 'agent_id' not in session:
        return redirect(url_for('agent_login'))

    new_status = request.form['status']
    conn = get_db()
    conn.execute('''
        UPDATE PROPERTY SET Status = ?
        WHERE PropertyID = ? AND AgentID = ?
    ''', [new_status, property_id, session['agent_id']])
    conn.commit()
    conn.close()
    flash('Property status updated successfully.', 'success')
    return redirect(url_for('agent_dashboard'))


# ============================================================
# LOGOUT
# ============================================================
@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out.', 'info')
    return redirect(url_for('index'))


# ============================================================
# RUN
# ============================================================
if __name__ == '__main__':
    app.run(debug=True)