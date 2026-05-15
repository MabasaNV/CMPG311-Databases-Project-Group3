# ============================================================
#  database.py — KeySpace Database Connection
#  CMPG 311 - Group 3 - NWU 2026
# ============================================================

import sqlite3

DB_PATH = 'keyspace.db' 


def get_db():
    """Get a database connection. Rows behave like dictionaries."""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON")
    return conn


def init_db():
    """Create all 10 tables if they do not already exist."""
    conn = get_db()
    cur = conn.cursor()
    cur.executescript('''

        CREATE TABLE IF NOT EXISTS BRANCH (
            BranchID      INTEGER PRIMARY KEY AUTOINCREMENT,
            BranchName    TEXT    NOT NULL,
            City          TEXT    NOT NULL,
            Province      TEXT    NOT NULL,
            ContactNumber TEXT,
            Email         TEXT    UNIQUE
        );

        CREATE TABLE IF NOT EXISTS LOCATION_TBL (
            LocationID  INTEGER PRIMARY KEY AUTOINCREMENT,
            PostalCode  TEXT,
            City        TEXT NOT NULL,
            Province    TEXT NOT NULL
        );

        CREATE TABLE IF NOT EXISTS PROPERTY_TYPE (
            PropertyTypeID INTEGER PRIMARY KEY AUTOINCREMENT,
            TypeName       TEXT NOT NULL UNIQUE,
            Description    TEXT
        );

        CREATE TABLE IF NOT EXISTS AGENT (
            AgentID       INTEGER PRIMARY KEY AUTOINCREMENT,
            BranchID      INTEGER NOT NULL,
            FirstName     TEXT    NOT NULL,
            LastName      TEXT    NOT NULL,
            ContactNumber TEXT,
            Email         TEXT    UNIQUE NOT NULL,
            Region        TEXT,
            FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID)
        );

        CREATE TABLE IF NOT EXISTS PROPERTY (
            PropertyID     INTEGER PRIMARY KEY AUTOINCREMENT,
            AgentID        INTEGER NOT NULL,
            PropertyTypeID INTEGER NOT NULL,
            LocationID     INTEGER NOT NULL,
            Street         TEXT    NOT NULL,
            Title          TEXT    NOT NULL,
            Price          REAL    NOT NULL,
            Size_sqm       REAL    NOT NULL,
            Bedrooms       INTEGER DEFAULT 0,
            Bathrooms      INTEGER DEFAULT 0,
            Status         TEXT    DEFAULT 'Available',
            ListingDate    TEXT    NOT NULL,
            FOREIGN KEY (AgentID)        REFERENCES AGENT(AgentID),
            FOREIGN KEY (PropertyTypeID) REFERENCES PROPERTY_TYPE(PropertyTypeID),
            FOREIGN KEY (LocationID)     REFERENCES LOCATION_TBL(LocationID)
        );

        CREATE TABLE IF NOT EXISTS PROPERTY_FEATURE (
            FeatureID   INTEGER PRIMARY KEY AUTOINCREMENT,
            PropertyID  INTEGER NOT NULL,
            FeatureName TEXT    NOT NULL,
            FOREIGN KEY (PropertyID) REFERENCES PROPERTY(PropertyID)
        );

        CREATE TABLE IF NOT EXISTS CLIENT (
            ClientID              INTEGER PRIMARY KEY AUTOINCREMENT,
            FirstName             TEXT NOT NULL,
            LastName              TEXT NOT NULL,
            Email                 TEXT NOT NULL UNIQUE,
            ContactNumber         TEXT,
            ClientType            TEXT NOT NULL,
            BudgetMin             REAL,
            BudgetMax             REAL,
            PreferredLocation     TEXT,
            PreferredPropertyType TEXT,
            RegistrationDate      TEXT NOT NULL
        );

        CREATE TABLE IF NOT EXISTS CLIENT_SAVED_PROPERTY (
            ClientID   INTEGER NOT NULL,
            PropertyID INTEGER NOT NULL,
            SavedDate  TEXT    NOT NULL,
            PRIMARY KEY (ClientID, PropertyID),
            FOREIGN KEY (ClientID)   REFERENCES CLIENT(ClientID),
            FOREIGN KEY (PropertyID) REFERENCES PROPERTY(PropertyID)
        );

        CREATE TABLE IF NOT EXISTS INQUIRY (
            InquiryID   INTEGER PRIMARY KEY AUTOINCREMENT,
            ClientID    INTEGER NOT NULL,
            PropertyID  INTEGER NOT NULL,
            AgentID     INTEGER NOT NULL,
            InquiryType TEXT    NOT NULL,
            InquiryDate TEXT    NOT NULL,
            Status      TEXT    DEFAULT 'Open',
            Notes       TEXT,
            OutcomeDate TEXT,
            FOREIGN KEY (ClientID)   REFERENCES CLIENT(ClientID),
            FOREIGN KEY (PropertyID) REFERENCES PROPERTY(PropertyID),
            FOREIGN KEY (AgentID)    REFERENCES AGENT(AgentID)
        );

        CREATE TABLE IF NOT EXISTS TRANSACTION_TBL (
            TransactionID   INTEGER PRIMARY KEY AUTOINCREMENT,
            PropertyID      INTEGER NOT NULL UNIQUE,
            ClientID        INTEGER NOT NULL,
            AgentID         INTEGER NOT NULL,
            TransactionType TEXT    NOT NULL,
            TransactionDate TEXT    NOT NULL,
            FinalPrice      REAL    NOT NULL,
            Status          TEXT    DEFAULT 'Pending',
            FOREIGN KEY (PropertyID) REFERENCES PROPERTY(PropertyID),
            FOREIGN KEY (ClientID)   REFERENCES CLIENT(ClientID),
            FOREIGN KEY (AgentID)    REFERENCES AGENT(AgentID)
        );

    ''')
    conn.commit()
    conn.close()