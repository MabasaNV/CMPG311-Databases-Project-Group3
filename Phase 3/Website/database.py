# ============================================================
#  database.py — KeySpace Database Connection
#  CMPG 311 - Group 3 - NWU 2026
# ============================================================

import oracledb

# ============================================================
#  YOUR ORACLE LOGIN DETAILS 
# ============================================================
ORACLE_USER     = "SYSTEM"       
ORACLE_PASSWORD = "Vukonsi17@gm"       
ORACLE_DSN      = "localhost/XE"        
# ============================================================


def get_db():
   
    conn = oracledb.connect(
        user=ORACLE_USER,
        password=ORACLE_PASSWORD,
        dsn=ORACLE_DSN
    )
    return conn


class CaseInsensitiveDict(dict):
   
    def __getitem__(self, key):
        try:
            return super().__getitem__(key)
        except KeyError:
            try:
                return super().__getitem__(key.lower())
            except KeyError:
                return super().__getitem__(key.upper())

    def __contains__(self, key):
        return (super().__contains__(key) or
                super().__contains__(key.lower()) or
                super().__contains__(key.upper()))

    def get(self, key, default=None):
        try:
            return self[key]
        except KeyError:
            return default


def fetchall_as_dicts(cursor):
    rows = cursor.fetchall()
    if not rows:
        return []
    cols = [col[0].lower() for col in cursor.description]
    return [CaseInsensitiveDict(zip(cols, row)) for row in rows]


def fetchone_as_dict(cursor):
   
    row = cursor.fetchone()
    if row is None:
        return None
    cols = [col[0].lower() for col in cursor.description]
    return CaseInsensitiveDict(zip(cols, row))


