# # ============================================================
#  app.py — KeySpace Real Estate Flask Application
#  CMPG 311 - Group 3 - NWU 2026
#  Updated: Oracle SQL (replaces SQLite)
# ============================================================

from flask import (
    Flask, render_template, request,
    redirect, url_for, session, flash
)
from database import get_db, fetchall_as_dicts, fetchone_as_dict
from datetime import date

app = Flask(__name__)
app.secret_key = 'keyspace_nwu_cmpg311_2026'

# ============================================================
# HOME — Show all available properties
# ============================================================
@app.route('/')
def index():
    conn = get_db()
    cur  = conn.cursor()
    cur.execute('''
        SELECT P.PropertyID, P.Title, P.Street,
               L.City, L.Province,
               PT.TypeName  AS PropertyType,
               P.Price, P.Bedrooms, P.Bathrooms,
               P.Size_sqm, P.ListingDate,
               A.FirstName || ' ' || A.LastName AS AgentName,
               A.ContactNumber
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        JOIN AGENT         A  ON P.AgentID        = A.AgentID
        WHERE P.Status = 'Available'
        ORDER BY P.ListingDate DESC
    ''')
    properties = fetchall_as_dicts(cur)
    conn.close()
    return render_template('index.html', properties=properties)


# ============================================================
# PROPERTY DETAIL
# ============================================================
@app.route('/property/<int:property_id>')
def property_detail(property_id):
    conn = get_db()
    cur  = conn.cursor()

    cur.execute('''
        SELECT P.PropertyID, P.Title, P.Street,
               L.City, L.Province, L.PostalCode,
               PT.TypeName AS PropertyType,
               P.Price, P.Bedrooms, P.Bathrooms,
               P.Size_sqm, P.Status, P.ListingDate,
               A.FirstName || ' ' || A.LastName AS AgentName,
               A.ContactNumber, A.Email, A.AgentID
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        JOIN AGENT         A  ON P.AgentID        = A.AgentID
        WHERE P.PropertyID = :1
    ''', [property_id])
    prop = fetchone_as_dict(cur)

    if not prop:
        flash('Property not found.', 'error')
        conn.close()
        return redirect(url_for('index'))

    cur.execute('''
        SELECT FeatureName FROM PROPERTY_FEATURE
        WHERE PropertyID = :1
    ''', [property_id])
    features = fetchall_as_dicts(cur)

    conn.close()
    return render_template('property_detail.html',
                           prop=prop,
                           features=[f['featurename'] for f in features])


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
               A.FirstName || ' ' || A.LastName AS AgentName
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        JOIN AGENT         A  ON P.AgentID        = A.AgentID
        WHERE P.Status = 'Available'
    '''
    params = []
    param_count = 1

    if city:
        query += f' AND UPPER(L.City) LIKE UPPER(:{param_count})'
        params.append('%' + city + '%')
        param_count += 1
    if ptype:
        query += f' AND PT.TypeName = :{param_count}'
        params.append(ptype)
        param_count += 1
    if max_price:
        query += f' AND P.Price <= :{param_count}'
        params.append(float(max_price))
        param_count += 1
    if bedrooms:
        query += f' AND P.Bedrooms >= :{param_count}'
        params.append(int(bedrooms))
        param_count += 1

    query += ' ORDER BY P.Price ASC'

    conn = get_db()
    cur  = conn.cursor()

    cur.execute(query, params)
    results = fetchall_as_dicts(cur)

    cur.execute('SELECT TypeName FROM PROPERTY_TYPE ORDER BY TypeName')
    types = fetchall_as_dicts(cur)

    conn.close()

    return render_template('search.html',
                           results=results,
                           types=[t['typename'] for t in types],
                           city=city, ptype=ptype,
                           max_price=max_price, bedrooms=bedrooms)


# ============================================================
# CLIENT REGISTRATION
# ============================================================
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        f    = request.form
        conn = get_db()
        cur  = conn.cursor()
        try:
            cur.execute('''
                INSERT INTO CLIENT
                (ClientID, FirstName, LastName, Email, ContactNumber,
                 ClientType, BudgetMin, BudgetMax,
                 PreferredLocation, PreferredPropertyType,
                 RegistrationDate)
                VALUES (SEQ_CLIENT.NEXTVAL, :1, :2, :3, :4, :5, :6, :7, :8, :9,
                        SYSDATE)
            ''', [
                f['first_name'],
                f['last_name'],
                f['email'].lower().strip(),
                f.get('contact') or None,
                f['client_type'],
                float(f['budget_min']) if f.get('budget_min') else None,
                float(f['budget_max']) if f.get('budget_max') else None,
                f.get('pref_location') or None,
                f.get('pref_type')     or None,
            ])
            conn.commit()
            flash('Registration successful! You can now log in.', 'success')
            return redirect(url_for('client_login'))
        except Exception as e:
            conn.rollback()
            error_msg = str(e)
            if 'ORA-00001' in error_msg:
                flash('That email is already registered. Try logging in.', 'error')
            else:
                flash(f'Registration failed: {error_msg}', 'error')
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
        cur   = conn.cursor()
        cur.execute('''
            SELECT ClientID, FirstName, LastName, ClientType
            FROM CLIENT WHERE Email = :1
        ''', [email])
        client = fetchone_as_dict(cur)
        conn.close()

        if client:
            session['client_id']   = client['clientid']
            session['client_name'] = client['firstname'] + ' ' + client['lastname']
            session['client_type'] = client['clienttype']
            session.pop('agent_id', None)
            flash(f"Welcome back, {client['firstname']}!", 'success')
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
    cur  = conn.cursor()

    cur.execute('''
        SELECT P.PropertyID, P.Title, L.City, P.Price,
               P.Status, CSP.SavedDate,
               PT.TypeName AS PropertyType
        FROM CLIENT_SAVED_PROPERTY CSP
        JOIN PROPERTY      P  ON CSP.PropertyID  = P.PropertyID
        JOIN LOCATION_TBL  L  ON P.LocationID    = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        WHERE CSP.ClientID = :1
        ORDER BY CSP.SavedDate DESC
    ''', [cid])
    saved = fetchall_as_dicts(cur)

    cur.execute('''
        SELECT I.InquiryID, P.Title, I.InquiryType,
               I.InquiryDate, I.Status, I.Notes,
               A.FirstName || ' ' || A.LastName AS AgentName,
               A.ContactNumber
        FROM INQUIRY I
        JOIN PROPERTY P ON I.PropertyID = P.PropertyID
        JOIN AGENT    A ON I.AgentID    = A.AgentID
        WHERE I.ClientID = :1
        ORDER BY I.InquiryDate DESC
    ''', [cid])
    inquiries = fetchall_as_dicts(cur)

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
    cur  = conn.cursor()
    try:
        cur.execute('''
            INSERT INTO CLIENT_SAVED_PROPERTY (ClientID, PropertyID, SavedDate)
            VALUES (:1, :2, SYSDATE)
        ''', [session['client_id'], property_id])
        conn.commit()
        flash('Property saved to your dashboard!', 'success')
    except Exception as e:
        conn.rollback()
        if 'ORA-00001' in str(e):
            flash('You have already saved this property.', 'info')
        else:
            flash(f'Could not save property: {str(e)}', 'error')
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
    cur  = conn.cursor()

    if request.method == 'POST':
        cur.execute(
            'SELECT AgentID, Title FROM PROPERTY WHERE PropertyID = :1',
            [property_id]
        )
        prop = fetchone_as_dict(cur)

        if prop:
            cur.execute('''
                INSERT INTO INQUIRY
                (InquiryID, ClientID, PropertyID, AgentID, InquiryType,
                 InquiryDate, Status, Notes)
                VALUES (SEQ_INQUIRY.NEXTVAL, :1, :2, :3, :4, SYSDATE, 'Open', :5)
            ''', [
                session['client_id'],
                property_id,
                prop['agentid'],
                request.form['inquiry_type'],
                request.form.get('notes', '')
            ])
            conn.commit()
            conn.close()
            flash('Inquiry submitted! The agent will contact you soon.', 'success')
            return redirect(url_for('client_dashboard'))

    cur.execute('''
        SELECT P.Title, A.FirstName || ' ' || A.LastName AS AgentName
        FROM PROPERTY P
        JOIN AGENT A ON P.AgentID = A.AgentID
        WHERE P.PropertyID = :1
    ''', [property_id])
    prop = fetchone_as_dict(cur)
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
        cur   = conn.cursor()
        cur.execute('''
            SELECT AgentID, FirstName, LastName, BranchID
            FROM AGENT WHERE LOWER(Email) = :1
        ''', [email])
        agent = fetchone_as_dict(cur)
        conn.close()

        if agent:
            session['agent_id']   = agent['agentid']
            session['agent_name'] = agent['firstname'] + ' ' + agent['lastname']
            session.pop('client_id', None)
            flash(f"Welcome, {agent['firstname']}!", 'success')
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
    cur  = conn.cursor()

    cur.execute('''
        SELECT P.PropertyID, P.Title, L.City,
               PT.TypeName AS PropertyType,
               P.Price, P.Status, P.ListingDate,
               P.Bedrooms, P.Bathrooms
        FROM PROPERTY P
        JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
        JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
        WHERE P.AgentID = :1
        ORDER BY P.ListingDate DESC
    ''', [aid])
    listings = fetchall_as_dicts(cur)

    cur.execute('''
        SELECT I.InquiryID, P.Title, I.InquiryType,
               C.FirstName || ' ' || C.LastName AS ClientName,
               C.ContactNumber, C.Email AS ClientEmail,
               I.InquiryDate, I.Status, I.Notes
        FROM INQUIRY I
        JOIN PROPERTY P ON I.PropertyID = P.PropertyID
        JOIN CLIENT   C ON I.ClientID   = C.ClientID
        WHERE I.AgentID = :1
        ORDER BY I.InquiryDate DESC
    ''', [aid])
    inquiries = fetchall_as_dicts(cur)

    cur.execute('''
        SELECT FN_ACTIVE_LISTINGS(:1) FROM DUAL
    ''', [aid])
    row = cur.fetchone()
    active_count = row[0] if row else 0

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
    cur  = conn.cursor()

    if request.method == 'POST':
        f = request.form
        try:
            cur.execute('''
                INSERT INTO PROPERTY
                (PropertyID, AgentID, PropertyTypeID, LocationID, Street, Title,
                 Price, Size_sqm, Bedrooms, Bathrooms, Status, ListingDate)
                VALUES (SEQ_PROPERTY.NEXTVAL, :1, :2, :3, :4, :5, :6, :7, :8, :9,
                        'Available', SYSDATE)
            ''', [
                session['agent_id'],
                int(f['property_type_id']),
                int(f['location_id']),
                f['street'],
                f['title'],
                float(f['price']),
                float(f['size_sqm']),
                int(f.get('bedrooms', 0)),
                int(f.get('bathrooms', 0))
            ])
            conn.commit()
            flash('Property listing added successfully!', 'success')
            conn.close()
            return redirect(url_for('agent_dashboard'))
        except Exception as e:
            conn.rollback()
            flash(f'Error adding property: {str(e)}', 'error')

    cur.execute('SELECT PropertyTypeID, TypeName FROM PROPERTY_TYPE ORDER BY TypeName')
    prop_types = fetchall_as_dicts(cur)

    cur.execute('SELECT LocationID, City, Province FROM LOCATION_TBL ORDER BY City')
    locations = fetchall_as_dicts(cur)

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
    cur  = conn.cursor()
    cur.execute('''
        UPDATE PROPERTY SET Status = :1
        WHERE PropertyID = :2 AND AgentID = :3
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