# test_connection.py
from database import get_db
conn = get_db()
cur = conn.cursor()
cur.execute("SELECT COUNT(*) FROM PROPERTY")
print("Properties:", cur.fetchone()[0])
conn.close()