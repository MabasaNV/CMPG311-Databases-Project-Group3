# ============================================================
#  seed.py — Populate KeySpace database with sample data
#  Run ONCE: python seed.py
#  CMPG 311 - Group 3 - NWU 2026
# ============================================================

from database import get_db, init_db

init_db()
conn = get_db()
cur  = conn.cursor()

# ── BRANCH ──────────────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO BRANCH VALUES (1,'KeySpace Mafikeng','Mafikeng','North West','0183810001','mafikeng@keyspace.co.za')")
cur.execute("INSERT OR IGNORE INTO BRANCH VALUES (2,'KeySpace Johannesburg','Johannesburg','Gauteng','0112340002','jhb@keyspace.co.za')")
cur.execute("INSERT OR IGNORE INTO BRANCH VALUES (3,'KeySpace Pretoria','Pretoria','Gauteng','0123450003','pta@keyspace.co.za')")
cur.execute("INSERT OR IGNORE INTO BRANCH VALUES (4,'KeySpace Cape Town','Cape Town','Western Cape','0214560004','cpt@keyspace.co.za')")
cur.execute("INSERT OR IGNORE INTO BRANCH VALUES (5,'KeySpace Durban','Durban','KwaZulu-Natal','0315670005','dbn@keyspace.co.za')")

# ── LOCATION ────────────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO LOCATION_TBL VALUES (1,'2745','Mafikeng','North West')")
cur.execute("INSERT OR IGNORE INTO LOCATION_TBL VALUES (2,'2000','Johannesburg','Gauteng')")
cur.execute("INSERT OR IGNORE INTO LOCATION_TBL VALUES (3,'0001','Pretoria','Gauteng')")
cur.execute("INSERT OR IGNORE INTO LOCATION_TBL VALUES (4,'8001','Cape Town','Western Cape')")
cur.execute("INSERT OR IGNORE INTO LOCATION_TBL VALUES (5,'4001','Durban','KwaZulu-Natal')")

# ── PROPERTY TYPE ───────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO PROPERTY_TYPE VALUES (1,'Residential House','Standalone residential property')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_TYPE VALUES (2,'Apartment','Unit within a multi-storey building')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_TYPE VALUES (3,'Commercial','Office or retail business property')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_TYPE VALUES (4,'Townhouse','Sectional title residential property')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_TYPE VALUES (5,'Rental','Property listed for rental purposes')")

# ── AGENT ───────────────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO AGENT VALUES (1,1,'Ntshembo','Mabasa','0677527020','ntshembo@keyspace.co.za','Mafikeng Central')")
cur.execute("INSERT OR IGNORE INTO AGENT VALUES (2,1,'Mmakoma','Boshomane','0797298054','mmakoma@keyspace.co.za','Mafikeng North')")
cur.execute("INSERT OR IGNORE INTO AGENT VALUES (3,2,'Shaun','Molewa','0728214859','shaun@keyspace.co.za','Johannesburg South')")
cur.execute("INSERT OR IGNORE INTO AGENT VALUES (4,3,'Khutso','Choshane','0824053762','khutso@keyspace.co.za','Pretoria East')")
cur.execute("INSERT OR IGNORE INTO AGENT VALUES (5,4,'Lebogang','Motseki','0684773813','lebogang@keyspace.co.za','Cape Town CBD')")

# ── PROPERTY ────────────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO PROPERTY VALUES (1,1,1,1,'12 Baobab Street','3-Bedroom Family Home in Mafikeng',850000,180,3,2,'Available','2026-01-10')")
cur.execute("INSERT OR IGNORE INTO PROPERTY VALUES (2,2,2,2,'45 Commissioner St','Modern Studio Apartment in Johannesburg',620000,55,1,1,'Available','2026-01-15')")
cur.execute("INSERT OR IGNORE INTO PROPERTY VALUES (3,3,3,3,'8 Church Square Rd','Prime Office Space in Pretoria CBD',1500000,320,0,2,'Available','2026-02-01')")
cur.execute("INSERT OR IGNORE INTO PROPERTY VALUES (4,4,4,4,'22 Blouberg Rise','Luxury Townhouse in Cape Town',2200000,210,4,3,'Sold','2026-02-10')")
cur.execute("INSERT OR IGNORE INTO PROPERTY VALUES (5,5,5,5,'7 Florida Road','2-Bedroom Rental Flat in Durban',9500,90,2,1,'Rented','2026-03-01')")

# ── PROPERTY FEATURE ────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (1,1,'Garden')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (2,1,'Garage')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (3,1,'Security Gate')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (4,2,'Balcony')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (5,2,'Pool')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (6,3,'Parking')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (7,3,'Lift Access')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (8,3,'Backup Generator')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (9,4,'Pool')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (10,4,'Double Garage')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (11,4,'Solar Panels')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (12,5,'Pet Friendly')")
cur.execute("INSERT OR IGNORE INTO PROPERTY_FEATURE VALUES (13,5,'Parking')")

# ── CLIENT ──────────────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO CLIENT VALUES (1,'Tebogo','Morake','tebogo@email.com','0789005970','Buyer',700000,1000000,'Mafikeng','Residential House','2026-01-05')")
cur.execute("INSERT OR IGNORE INTO CLIENT VALUES (2,'Piet','Ribana','piet@email.com','0685554065','Tenant',8000,12000,'Durban','Rental','2026-01-08')")
cur.execute("INSERT OR IGNORE INTO CLIENT VALUES (3,'Mongale','Kamogelo','mongale@email.com','0780772170','Buyer',1800000,2500000,'Cape Town','Townhouse','2026-02-01')")
cur.execute("INSERT OR IGNORE INTO CLIENT VALUES (4,'Madonsela','Ronny','madonsela@email.com','0792779959','Seller',NULL,NULL,'Pretoria','Commercial','2026-02-15')")
cur.execute("INSERT OR IGNORE INTO CLIENT VALUES (5,'Kefilwe','Dlamini','kefilwe@email.com','0831124400','Buyer',500000,700000,'Johannesburg','Apartment','2026-03-01')")

# ── CLIENT SAVED PROPERTY ───────────────────────────────────
cur.execute("INSERT OR IGNORE INTO CLIENT_SAVED_PROPERTY VALUES (1,1,'2026-01-12')")
cur.execute("INSERT OR IGNORE INTO CLIENT_SAVED_PROPERTY VALUES (1,2,'2026-01-14')")
cur.execute("INSERT OR IGNORE INTO CLIENT_SAVED_PROPERTY VALUES (2,5,'2026-03-02')")
cur.execute("INSERT OR IGNORE INTO CLIENT_SAVED_PROPERTY VALUES (3,4,'2026-02-12')")
cur.execute("INSERT OR IGNORE INTO CLIENT_SAVED_PROPERTY VALUES (5,2,'2026-03-05')")

# ── INQUIRY ─────────────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO INQUIRY VALUES (1,1,1,1,'Viewing','2026-01-20','Closed','Client viewed property. Interested in making an offer.','2026-01-22')")
cur.execute("INSERT OR IGNORE INTO INQUIRY VALUES (2,2,5,5,'Viewing','2026-03-03','Closed','Client signed rental agreement after viewing.','2026-03-05')")
cur.execute("INSERT OR IGNORE INTO INQUIRY VALUES (3,3,4,4,'General','2026-02-14','Closed','Client inquired about price negotiation.','2026-02-16')")
cur.execute("INSERT OR IGNORE INTO INQUIRY VALUES (4,5,2,2,'Viewing','2026-03-06','Open',NULL,NULL)")
cur.execute("INSERT OR IGNORE INTO INQUIRY VALUES (5,1,3,3,'General','2026-02-20','No Response','Client inquired about commercial space availability.',NULL)")

# ── TRANSACTION ─────────────────────────────────────────────
cur.execute("INSERT OR IGNORE INTO TRANSACTION_TBL VALUES (1,4,3,4,'Sale','2026-02-28',2150000,'Completed')")
cur.execute("INSERT OR IGNORE INTO TRANSACTION_TBL VALUES (2,5,2,5,'Rental','2026-03-06',9500,'Completed')")
cur.execute("INSERT OR IGNORE INTO TRANSACTION_TBL VALUES (3,1,1,1,'Sale','2026-03-10',840000,'Pending')")

conn.commit()
conn.close()
print(" KeySpace database seeded successfully!")
print("   Tables populated: BRANCH, LOCATION_TBL, PROPERTY_TYPE, AGENT,")
print("   PROPERTY, PROPERTY_FEATURE, CLIENT, CLIENT_SAVED_PROPERTY,")
print("   INQUIRY, TRANSACTION_TBL")