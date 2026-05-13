-- ============================================================
--  KEYSPACE REAL ESTATE PROPERTY LISTING SYSTEM
--  CMPG 311 - Group 3 - NWU 2026
--  Oracle SQL Developer Script - COMPLETE PHASE 3
--  Run in Oracle SQL Developer: F5 to run full script
-- ============================================================

-- ============================================================
-- SECTION 0: CLEANUP (drop tables if they exist)
-- ============================================================
BEGIN
  FOR t IN (
    SELECT table_name FROM user_tables
    WHERE table_name IN (
      'TRANSACTION_TBL','INQUIRY','CLIENT_SAVED_PROPERTY',
      'CLIENT','PROPERTY_FEATURE','PROPERTY',
      'PROPERTY_TYPE','LOCATION_TBL','AGENT','BRANCH'
    )
  ) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
  END LOOP;
END;
/

BEGIN
  FOR v IN (
    SELECT view_name FROM user_views
    WHERE view_name IN (
      'VW_AVAILABLE_PROPERTIES','VW_AGENT_PERFORMANCE',
      'VW_CLIENT_INQUIRIES','VW_TRANSACTION_SUMMARY'
    )
  ) LOOP
    EXECUTE IMMEDIATE 'DROP VIEW ' || v.view_name;
  END LOOP;
END;
/

BEGIN
  FOR s IN (
    SELECT sequence_name FROM user_sequences
    WHERE sequence_name IN (
      'SEQ_BRANCH','SEQ_AGENT','SEQ_LOCATION','SEQ_PROPTYPE',
      'SEQ_PROPERTY','SEQ_FEATURE','SEQ_CLIENT',
      'SEQ_INQUIRY','SEQ_TRANSACTION'
    )
  ) LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
  END LOOP;
END;
/

-- ============================================================
-- SECTION 1: SEQUENCES (Oracle uses sequences instead of AUTO_INCREMENT)
-- ============================================================
CREATE SEQUENCE SEQ_BRANCH     START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_AGENT      START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_LOCATION   START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_PROPTYPE   START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_PROPERTY   START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_FEATURE    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_CLIENT     START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_INQUIRY    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_TRANSACTION START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- ============================================================
-- SECTION 2: TABLE CREATION
-- ============================================================

-- TABLE 1: BRANCH
CREATE TABLE BRANCH (
    BranchID      NUMBER        NOT NULL,
    BranchName    VARCHAR2(100) NOT NULL,
    City          VARCHAR2(100) NOT NULL,
    Province      VARCHAR2(100) NOT NULL,
    ContactNumber VARCHAR2(15)  NOT NULL,
    Email         VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_Branch  PRIMARY KEY (BranchID),
    CONSTRAINT UQ_Branch_Email UNIQUE (Email)
);

-- TABLE 2: AGENT
CREATE TABLE AGENT (
    AgentID       NUMBER        NOT NULL,
    BranchID      NUMBER        NOT NULL,
    FirstName     VARCHAR2(50)  NOT NULL,
    LastName      VARCHAR2(50)  NOT NULL,
    ContactNumber VARCHAR2(15)  NOT NULL,
    Email         VARCHAR2(100) NOT NULL,
    Region        VARCHAR2(100) NOT NULL,
    -- ActiveListingCount is DERIVED: COUNT(*) FROM PROPERTY WHERE AgentID=? AND Status='Available'
    CONSTRAINT PK_Agent       PRIMARY KEY (AgentID),
    CONSTRAINT UQ_Agent_Email UNIQUE (Email),
    CONSTRAINT FK_Agent_Branch FOREIGN KEY (BranchID)
        REFERENCES BRANCH(BranchID)
        ON DELETE RESTRICT
);

-- TABLE 3: LOCATION_TBL (LOCATION is reserved in Oracle)
CREATE TABLE LOCATION_TBL (
    LocationID  NUMBER        NOT NULL,
    PostalCode  VARCHAR2(10)  NOT NULL,
    City        VARCHAR2(100) NOT NULL,
    Province    VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_Location PRIMARY KEY (LocationID)
);

-- TABLE 4: PROPERTY_TYPE
CREATE TABLE PROPERTY_TYPE (
    PropertyTypeID NUMBER        NOT NULL,
    TypeName       VARCHAR2(50)  NOT NULL,
    Description    VARCHAR2(255),
    CONSTRAINT PK_PropertyType    PRIMARY KEY (PropertyTypeID),
    CONSTRAINT UQ_PropertyType_Name UNIQUE (TypeName)
);

-- TABLE 5: PROPERTY
CREATE TABLE PROPERTY (
    PropertyID     NUMBER         NOT NULL,
    AgentID        NUMBER         NOT NULL,
    PropertyTypeID NUMBER         NOT NULL,
    LocationID     NUMBER         NOT NULL,
    Street         VARCHAR2(150)  NOT NULL,
    Title          VARCHAR2(150)  NOT NULL,
    Price          NUMBER(12,2)   NOT NULL,
    Size_sqm       NUMBER(8,2)    NOT NULL,
    Bedrooms       NUMBER(3)      DEFAULT 0 NOT NULL,
    Bathrooms      NUMBER(3)      DEFAULT 0 NOT NULL,
    Status         VARCHAR2(20)   DEFAULT 'Available' NOT NULL,
    ListingDate    DATE           NOT NULL,
    CONSTRAINT PK_Property          PRIMARY KEY (PropertyID),
    CONSTRAINT FK_Property_Agent    FOREIGN KEY (AgentID)
        REFERENCES AGENT(AgentID),
    CONSTRAINT FK_Property_Type     FOREIGN KEY (PropertyTypeID)
        REFERENCES PROPERTY_TYPE(PropertyTypeID),
    CONSTRAINT FK_Property_Location FOREIGN KEY (LocationID)
        REFERENCES LOCATION_TBL(LocationID),
    CONSTRAINT CHK_Property_Price   CHECK (Price > 0),
    CONSTRAINT CHK_Property_Size    CHECK (Size_sqm > 0),
    CONSTRAINT CHK_Property_Beds    CHECK (Bedrooms >= 0),
    CONSTRAINT CHK_Property_Baths   CHECK (Bathrooms >= 0),
    CONSTRAINT CHK_Property_Status  CHECK (Status IN ('Available','Sold','Rented','Withdrawn'))
);

-- TABLE 6: PROPERTY_FEATURE (Weak entity)
CREATE TABLE PROPERTY_FEATURE (
    FeatureID   NUMBER        NOT NULL,
    PropertyID  NUMBER        NOT NULL,
    FeatureName VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_Feature          PRIMARY KEY (FeatureID),
    CONSTRAINT FK_Feature_Property FOREIGN KEY (PropertyID)
        REFERENCES PROPERTY(PropertyID)
        ON DELETE CASCADE
);

-- TABLE 7: CLIENT
CREATE TABLE CLIENT (
    ClientID              NUMBER        NOT NULL,
    FirstName             VARCHAR2(50)  NOT NULL,
    LastName              VARCHAR2(50)  NOT NULL,
    Email                 VARCHAR2(100) NOT NULL,
    ContactNumber         VARCHAR2(15)  NOT NULL,
    ClientType            VARCHAR2(20)  NOT NULL,
    BudgetMin             NUMBER(12,2),
    BudgetMax             NUMBER(12,2),
    PreferredLocation     VARCHAR2(100),
    PreferredPropertyType VARCHAR2(50),
    RegistrationDate      DATE          NOT NULL,
    CONSTRAINT PK_Client       PRIMARY KEY (ClientID),
    CONSTRAINT UQ_Client_Email UNIQUE (Email),
    CONSTRAINT CHK_ClientType  CHECK (ClientType IN ('Buyer','Seller','Tenant','Landlord')),
    CONSTRAINT CHK_BudgetMin   CHECK (BudgetMin >= 0),
    CONSTRAINT CHK_BudgetMax   CHECK (BudgetMax >= 0)
);

-- TABLE 8: CLIENT_SAVED_PROPERTY (Bridge entity - M:M)
CREATE TABLE CLIENT_SAVED_PROPERTY (
    ClientID    NUMBER NOT NULL,
    PropertyID  NUMBER NOT NULL,
    SavedDate   DATE   NOT NULL,
    CONSTRAINT PK_ClientSaved    PRIMARY KEY (ClientID, PropertyID),
    CONSTRAINT FK_Saved_Client   FOREIGN KEY (ClientID)
        REFERENCES CLIENT(ClientID)
        ON DELETE CASCADE,
    CONSTRAINT FK_Saved_Property FOREIGN KEY (PropertyID)
        REFERENCES PROPERTY(PropertyID)
        ON DELETE CASCADE
);

-- TABLE 9: INQUIRY (Weak entity)
CREATE TABLE INQUIRY (
    InquiryID   NUMBER        NOT NULL,
    ClientID    NUMBER        NOT NULL,
    PropertyID  NUMBER        NOT NULL,
    AgentID     NUMBER        NOT NULL,
    InquiryType VARCHAR2(20)  NOT NULL,
    InquiryDate DATE          NOT NULL,
    Status      VARCHAR2(20)  DEFAULT 'Open' NOT NULL,
    Notes       VARCHAR2(500),
    OutcomeDate DATE,
    CONSTRAINT PK_Inquiry          PRIMARY KEY (InquiryID),
    CONSTRAINT FK_Inquiry_Client   FOREIGN KEY (ClientID)
        REFERENCES CLIENT(ClientID),
    CONSTRAINT FK_Inquiry_Property FOREIGN KEY (PropertyID)
        REFERENCES PROPERTY(PropertyID),
    CONSTRAINT FK_Inquiry_Agent    FOREIGN KEY (AgentID)
        REFERENCES AGENT(AgentID),
    CONSTRAINT CHK_InquiryType     CHECK (InquiryType IN ('Viewing','General')),
    CONSTRAINT CHK_InquiryStatus   CHECK (Status IN ('Open','Closed','No Response'))
);

-- TABLE 10: TRANSACTION_TBL ()
CREATE TABLE TRANSACTION_TBL (
    TransactionID   NUMBER       NOT NULL,
    PropertyID      NUMBER       NOT NULL,
    ClientID        NUMBER       NOT NULL,
    AgentID         NUMBER       NOT NULL,
    TransactionType VARCHAR2(10) NOT NULL,
    TransactionDate DATE         NOT NULL,
    FinalPrice      NUMBER(12,2) NOT NULL,
    Status          VARCHAR2(20) DEFAULT 'Pending' NOT NULL,
    CONSTRAINT PK_Transaction          PRIMARY KEY (TransactionID),
    CONSTRAINT UQ_Transaction_Property UNIQUE (PropertyID),
    CONSTRAINT FK_Transaction_Property FOREIGN KEY (PropertyID)
        REFERENCES PROPERTY(PropertyID),
    CONSTRAINT FK_Transaction_Client   FOREIGN KEY (ClientID)
        REFERENCES CLIENT(ClientID),
    CONSTRAINT FK_Transaction_Agent    FOREIGN KEY (AgentID)
        REFERENCES AGENT(AgentID),
    CONSTRAINT CHK_TransType    CHECK (TransactionType IN ('Sale','Rental')),
    CONSTRAINT CHK_TransStatus  CHECK (Status IN ('Pending','Completed','Cancelled')),
    CONSTRAINT CHK_FinalPrice   CHECK (FinalPrice > 0)
);

-- ============================================================
-- SECTION 3: INDEXES
-- ============================================================
CREATE INDEX IDX_Property_Status  ON PROPERTY(Status);
CREATE INDEX IDX_Property_Price   ON PROPERTY(Price);
CREATE INDEX IDX_Agent_Branch     ON AGENT(BranchID);
CREATE INDEX IDX_Inquiry_Status   ON INQUIRY(Status);
CREATE INDEX IDX_Trans_Type       ON TRANSACTION_TBL(TransactionType);

-- ============================================================
-- SECTION 4: SAMPLE DATA
-- ============================================================

-- BRANCH
INSERT INTO BRANCH VALUES (SEQ_BRANCH.NEXTVAL, 'KeySpace Mafikeng',     'Mafikeng',     'North West',    '0183810001', 'mafikeng@keyspace.co.za');
INSERT INTO BRANCH VALUES (SEQ_BRANCH.NEXTVAL, 'KeySpace Johannesburg', 'Johannesburg', 'Gauteng',       '0112340002', 'jhb@keyspace.co.za');
INSERT INTO BRANCH VALUES (SEQ_BRANCH.NEXTVAL, 'KeySpace Pretoria',     'Pretoria',     'Gauteng',       '0123450003', 'pta@keyspace.co.za');
INSERT INTO BRANCH VALUES (SEQ_BRANCH.NEXTVAL, 'KeySpace Cape Town',    'Cape Town',    'Western Cape',  '0214560004', 'cpt@keyspace.co.za');
INSERT INTO BRANCH VALUES (SEQ_BRANCH.NEXTVAL, 'KeySpace Durban',       'Durban',       'KwaZulu-Natal', '0315670005', 'dbn@keyspace.co.za');

-- AGENT
INSERT INTO AGENT VALUES (SEQ_AGENT.NEXTVAL, 1, 'Ntshembo', 'Mabasa',    '0677527020', 'ntshembo@keyspace.co.za', 'Mafikeng Central');
INSERT INTO AGENT VALUES (SEQ_AGENT.NEXTVAL, 1, 'Mmakoma',  'Boshomane', '0797298054', 'mmakoma@keyspace.co.za',  'Mafikeng North');
INSERT INTO AGENT VALUES (SEQ_AGENT.NEXTVAL, 2, 'Shaun',    'Molewa',    '0728214859', 'shaun@keyspace.co.za',    'Johannesburg South');
INSERT INTO AGENT VALUES (SEQ_AGENT.NEXTVAL, 3, 'Khutso',   'Choshane',  '0824053762', 'khutso@keyspace.co.za',   'Pretoria East');
INSERT INTO AGENT VALUES (SEQ_AGENT.NEXTVAL, 4, 'Lebogang', 'Motseki',   '0684773813', 'lebogang@keyspace.co.za', 'Cape Town CBD');

-- LOCATION_TBL
INSERT INTO LOCATION_TBL VALUES (SEQ_LOCATION.NEXTVAL, '2745', 'Mafikeng',     'North West');
INSERT INTO LOCATION_TBL VALUES (SEQ_LOCATION.NEXTVAL, '2000', 'Johannesburg', 'Gauteng');
INSERT INTO LOCATION_TBL VALUES (SEQ_LOCATION.NEXTVAL, '0001', 'Pretoria',     'Gauteng');
INSERT INTO LOCATION_TBL VALUES (SEQ_LOCATION.NEXTVAL, '8001', 'Cape Town',    'Western Cape');
INSERT INTO LOCATION_TBL VALUES (SEQ_LOCATION.NEXTVAL, '4001', 'Durban',       'KwaZulu-Natal');

-- PROPERTY_TYPE
INSERT INTO PROPERTY_TYPE VALUES (SEQ_PROPTYPE.NEXTVAL, 'Residential House', 'Standalone residential property');
INSERT INTO PROPERTY_TYPE VALUES (SEQ_PROPTYPE.NEXTVAL, 'Apartment',         'Unit within a multi-storey building');
INSERT INTO PROPERTY_TYPE VALUES (SEQ_PROPTYPE.NEXTVAL, 'Commercial',        'Office or retail business property');
INSERT INTO PROPERTY_TYPE VALUES (SEQ_PROPTYPE.NEXTVAL, 'Townhouse',         'Sectional title residential property');
INSERT INTO PROPERTY_TYPE VALUES (SEQ_PROPTYPE.NEXTVAL, 'Rental',            'Property listed for rental purposes');

-- PROPERTY
INSERT INTO PROPERTY VALUES (SEQ_PROPERTY.NEXTVAL, 1, 1, 1, '12 Baobab Street',   '3-Bedroom Family Home in Mafikeng',       850000.00, 180.00, 3, 2, 'Available', TO_DATE('2026-01-10','YYYY-MM-DD'));
INSERT INTO PROPERTY VALUES (SEQ_PROPERTY.NEXTVAL, 2, 2, 2, '45 Commissioner St', 'Modern Studio Apartment in Johannesburg', 620000.00,  55.00, 1, 1, 'Available', TO_DATE('2026-01-15','YYYY-MM-DD'));
INSERT INTO PROPERTY VALUES (SEQ_PROPERTY.NEXTVAL, 3, 3, 3, '8 Church Square Rd', 'Prime Office Space in Pretoria CBD',     1500000.00, 320.00, 0, 2, 'Available', TO_DATE('2026-02-01','YYYY-MM-DD'));
INSERT INTO PROPERTY VALUES (SEQ_PROPERTY.NEXTVAL, 4, 4, 4, '22 Blouberg Rise',   'Luxury Townhouse in Cape Town',          2200000.00, 210.00, 4, 3, 'Sold',      TO_DATE('2026-02-10','YYYY-MM-DD'));
INSERT INTO PROPERTY VALUES (SEQ_PROPERTY.NEXTVAL, 5, 5, 5, '7 Florida Road',     '2-Bedroom Rental Flat in Durban',           9500.00,  90.00, 2, 1, 'Rented',    TO_DATE('2026-03-01','YYYY-MM-DD'));

-- PROPERTY_FEATURE
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 1, 'Garden');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 1, 'Garage');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 1, 'Security Gate');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 2, 'Balcony');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 2, 'Pool');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 3, 'Parking');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 3, 'Lift Access');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 3, 'Backup Generator');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 4, 'Pool');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 4, 'Double Garage');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 4, 'Garden');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 4, 'Solar Panels');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 5, 'Pet Friendly');
INSERT INTO PROPERTY_FEATURE VALUES (SEQ_FEATURE.NEXTVAL, 5, 'Parking');

-- CLIENT
INSERT INTO CLIENT VALUES (SEQ_CLIENT.NEXTVAL, 'Tebogo',    'Morake',   'tebogo@email.com',    '0789005970', 'Buyer',    700000.00,  1000000.00, 'Mafikeng',     'Residential House', TO_DATE('2026-01-05','YYYY-MM-DD'));
INSERT INTO CLIENT VALUES (SEQ_CLIENT.NEXTVAL, 'Piet',      'Ribana',   'piet@email.com',      '0685554065', 'Tenant',     8000.00,    12000.00, 'Durban',       'Rental',            TO_DATE('2026-01-08','YYYY-MM-DD'));
INSERT INTO CLIENT VALUES (SEQ_CLIENT.NEXTVAL, 'Mongale',   'Kamogelo', 'mongale@email.com',   '0780772170', 'Buyer',   1800000.00,  2500000.00, 'Cape Town',    'Townhouse',         TO_DATE('2026-02-01','YYYY-MM-DD'));
INSERT INTO CLIENT VALUES (SEQ_CLIENT.NEXTVAL, 'Madonsela', 'Ronny',    'madonsela@email.com', '0792779959', 'Seller',        NULL,        NULL, 'Pretoria',     'Commercial',        TO_DATE('2026-02-15','YYYY-MM-DD'));
INSERT INTO CLIENT VALUES (SEQ_CLIENT.NEXTVAL, 'Kefilwe',   'Dlamini',  'kefilwe@email.com',   '0831124400', 'Buyer',    500000.00,   700000.00, 'Johannesburg', 'Apartment',         TO_DATE('2026-03-01','YYYY-MM-DD'));

-- CLIENT_SAVED_PROPERTY
INSERT INTO CLIENT_SAVED_PROPERTY VALUES (1, 1, TO_DATE('2026-01-12','YYYY-MM-DD'));
INSERT INTO CLIENT_SAVED_PROPERTY VALUES (1, 2, TO_DATE('2026-01-14','YYYY-MM-DD'));
INSERT INTO CLIENT_SAVED_PROPERTY VALUES (2, 5, TO_DATE('2026-03-02','YYYY-MM-DD'));
INSERT INTO CLIENT_SAVED_PROPERTY VALUES (3, 4, TO_DATE('2026-02-12','YYYY-MM-DD'));
INSERT INTO CLIENT_SAVED_PROPERTY VALUES (5, 2, TO_DATE('2026-03-05','YYYY-MM-DD'));

-- INQUIRY
INSERT INTO INQUIRY VALUES (SEQ_INQUIRY.NEXTVAL, 1, 1, 1, 'Viewing', TO_DATE('2026-01-20','YYYY-MM-DD'), 'Closed',      'Client viewed property. Interested in making an offer.', TO_DATE('2026-01-22','YYYY-MM-DD'));
INSERT INTO INQUIRY VALUES (SEQ_INQUIRY.NEXTVAL, 2, 5, 5, 'Viewing', TO_DATE('2026-03-03','YYYY-MM-DD'), 'Closed',      'Client signed rental agreement after viewing.',          TO_DATE('2026-03-05','YYYY-MM-DD'));
INSERT INTO INQUIRY VALUES (SEQ_INQUIRY.NEXTVAL, 3, 4, 4, 'General', TO_DATE('2026-02-14','YYYY-MM-DD'), 'Closed',      'Client inquired about price negotiation.',               TO_DATE('2026-02-16','YYYY-MM-DD'));
INSERT INTO INQUIRY VALUES (SEQ_INQUIRY.NEXTVAL, 5, 2, 2, 'Viewing', TO_DATE('2026-03-06','YYYY-MM-DD'), 'Open',        NULL,                                                     NULL);
INSERT INTO INQUIRY VALUES (SEQ_INQUIRY.NEXTVAL, 1, 3, 3, 'General', TO_DATE('2026-02-20','YYYY-MM-DD'), 'No Response', 'Client inquired about commercial space availability.',    NULL);

-- TRANSACTION_TBL
INSERT INTO TRANSACTION_TBL VALUES (SEQ_TRANSACTION.NEXTVAL, 4, 3, 4, 'Sale',   TO_DATE('2026-02-28','YYYY-MM-DD'), 2150000.00, 'Completed');
INSERT INTO TRANSACTION_TBL VALUES (SEQ_TRANSACTION.NEXTVAL, 5, 2, 5, 'Rental', TO_DATE('2026-03-06','YYYY-MM-DD'),    9500.00, 'Completed');
INSERT INTO TRANSACTION_TBL VALUES (SEQ_TRANSACTION.NEXTVAL, 1, 1, 1, 'Sale',   TO_DATE('2026-03-10','YYYY-MM-DD'),  840000.00, 'Pending');

COMMIT;

-- ============================================================
-- SECTION 5: VIEWS
-- ============================================================

-- VIEW 1: Available properties with full details
CREATE OR REPLACE VIEW VW_AVAILABLE_PROPERTIES AS
SELECT
    P.PropertyID,
    P.Title,
    P.Street,
    L.City,
    L.Province,
    L.PostalCode,
    PT.TypeName        AS PropertyType,
    P.Price,
    P.Size_sqm,
    P.Bedrooms,
    P.Bathrooms,
    P.ListingDate,
    A.FirstName || ' ' || A.LastName AS AgentName,
    A.ContactNumber    AS AgentContact
FROM PROPERTY P
JOIN LOCATION_TBL L  ON P.LocationID     = L.LocationID
JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
JOIN AGENT A          ON P.AgentID        = A.AgentID
WHERE P.Status = 'Available';

-- VIEW 2: Agent performance summary
CREATE OR REPLACE VIEW VW_AGENT_PERFORMANCE AS
SELECT
    A.AgentID,
    A.FirstName || ' ' || A.LastName       AS AgentName,
    B.BranchName,
    A.Region,
    COUNT(P.PropertyID)                    AS TotalListings,
    SUM(CASE WHEN P.Status = 'Available'
             THEN 1 ELSE 0 END)            AS ActiveListings,
    SUM(CASE WHEN P.Status = 'Sold'
             THEN 1 ELSE 0 END)            AS PropertiesSold,
    SUM(CASE WHEN P.Status = 'Rented'
             THEN 1 ELSE 0 END)            AS PropertiesRented,
    NVL(SUM(T.FinalPrice), 0)              AS TotalRevenue
FROM AGENT A
JOIN BRANCH B ON A.BranchID = B.BranchID
LEFT JOIN PROPERTY P ON A.AgentID = P.AgentID
LEFT JOIN TRANSACTION_TBL T ON A.AgentID = T.AgentID
    AND T.Status = 'Completed'
GROUP BY A.AgentID, A.FirstName, A.LastName, B.BranchName, A.Region;

-- VIEW 3: Client inquiry history
CREATE OR REPLACE VIEW VW_CLIENT_INQUIRIES AS
SELECT
    C.ClientID,
    C.FirstName || ' ' || C.LastName  AS ClientName,
    C.ClientType,
    P.Title                            AS PropertyTitle,
    I.InquiryType,
    I.InquiryDate,
    I.Status                           AS InquiryStatus,
    A.FirstName || ' ' || A.LastName  AS AgentName,
    I.Notes,
    I.OutcomeDate
FROM INQUIRY I
JOIN CLIENT   C ON I.ClientID   = C.ClientID
JOIN PROPERTY P ON I.PropertyID = P.PropertyID
JOIN AGENT    A ON I.AgentID    = A.AgentID;

-- VIEW 4: Transaction summary
CREATE OR REPLACE VIEW VW_TRANSACTION_SUMMARY AS
SELECT
    T.TransactionID,
    P.Title                            AS PropertyTitle,
    L.City,
    T.TransactionType,
    T.TransactionDate,
    T.FinalPrice,
    T.Status,
    C.FirstName || ' ' || C.LastName  AS ClientName,
    A.FirstName || ' ' || A.LastName  AS AgentName,
    B.BranchName
FROM TRANSACTION_TBL T
JOIN PROPERTY      P ON T.PropertyID = P.PropertyID
JOIN LOCATION_TBL  L ON P.LocationID = L.LocationID
JOIN CLIENT        C ON T.ClientID   = C.ClientID
JOIN AGENT         A ON T.AgentID    = A.AgentID
JOIN BRANCH        B ON A.BranchID   = B.BranchID;

-- ============================================================
-- SECTION 6: QUERIES
-- ============================================================

-- ── Q1: COMPANY INFORMATION REQUIREMENTS ──────────────────
-- Q1a: All available properties with location and agent
SELECT
    P.Title,
    P.Street,
    L.City,
    L.Province,
    PT.TypeName    AS PropertyType,
    P.Price,
    P.Bedrooms,
    P.Bathrooms,
    P.Size_sqm,
    A.FirstName || ' ' || A.LastName AS AgentName,
    A.ContactNumber
FROM PROPERTY P
JOIN LOCATION_TBL  L  ON P.LocationID     = L.LocationID
JOIN PROPERTY_TYPE PT ON P.PropertyTypeID = PT.PropertyTypeID
JOIN AGENT         A  ON P.AgentID        = A.AgentID
WHERE P.Status = 'Available';

-- Q1b: All clients and their preferences
SELECT
    C.FirstName || ' ' || C.LastName AS ClientName,
    C.ClientType,
    C.PreferredLocation,
    C.PreferredPropertyType,
    C.BudgetMin,
    C.BudgetMax,
    C.ContactNumber,
    C.RegistrationDate
FROM CLIENT C
ORDER BY C.RegistrationDate DESC;

-- Q1c: All agents and their branch
SELECT
    A.FirstName || ' ' || A.LastName AS AgentName,
    A.Region,
    A.ContactNumber,
    A.Email,
    B.BranchName,
    B.City AS BranchCity
FROM AGENT A
JOIN BRANCH B ON A.BranchID = B.BranchID;

-- ── Q2: QUERY LIMITATIONS (rows & columns) ────────────────
-- Q2a: Show only Title and Price, limit to 3 rows (FETCH FIRST = Oracle standard)
SELECT Title, Price
FROM PROPERTY
WHERE ROWNUM <= 3;

-- Q2b: Show only agent names and emails (specific columns only)
SELECT FirstName, LastName, Email
FROM AGENT
FETCH FIRST 3 ROWS ONLY;

-- ── Q3: SORTING OPERATIONS ────────────────────────────────
-- Q3a: Properties sorted by Price descending (most expensive first)
SELECT Title, Price, Status
FROM PROPERTY
ORDER BY Price DESC;

-- Q3b: Clients sorted alphabetically by LastName
SELECT FirstName, LastName, ClientType, RegistrationDate
FROM CLIENT
ORDER BY LastName ASC;

-- Q3c: Inquiries sorted by InquiryDate most recent first
SELECT InquiryID, InquiryType, InquiryDate, Status
FROM INQUIRY
ORDER BY InquiryDate DESC;

-- ── Q4: LIKE, AND, OR OPERATORS ───────────────────────────
-- Q4a: Properties in cities starting with 'M' (LIKE)
SELECT P.Title, L.City, P.Price
FROM PROPERTY P
JOIN LOCATION_TBL L ON P.LocationID = L.LocationID
WHERE L.City LIKE 'M%';

-- Q4b: Available properties with 3 or more bedrooms AND price under 1 million (AND)
SELECT Title, Price, Bedrooms, Status
FROM PROPERTY
WHERE Status = 'Available'
  AND Bedrooms >= 3
  AND Price < 1000000;

-- Q4c: Clients who are Buyers OR Tenants (OR)
SELECT FirstName, LastName, ClientType, PreferredLocation
FROM CLIENT
WHERE ClientType = 'Buyer'
   OR ClientType = 'Tenant';

-- Q4d: Properties that are Sold OR Rented (OR + LIKE)
SELECT Title, Status, Price
FROM PROPERTY
WHERE Status = 'Sold'
   OR Status = 'Rented';

-- ── Q5: VARIABLES & CHARACTER FUNCTIONS ───────────────────
-- Q5a: Full name using CONCAT, email in UPPER case
SELECT
    FirstName || ' ' || LastName          AS FullName,
    UPPER(Email)                           AS EmailUpperCase,
    LENGTH(FirstName || ' ' || LastName)   AS NameLength
FROM AGENT;

-- Q5b: Property title in UPPER, city in LOWER, SUBSTR of postal code
SELECT
    UPPER(P.Title)           AS PropertyTitleUpper,
    LOWER(L.City)            AS CityLower,
    SUBSTR(L.PostalCode,1,2) AS PostalPrefix,
    P.Price
FROM PROPERTY P
JOIN LOCATION_TBL L ON P.LocationID = L.LocationID;

-- Q5c: Using a variable to filter by city
-- In Oracle SQL Developer use substitution variable:
DEFINE v_city = 'Mafikeng';
SELECT Title, Price, Status
FROM PROPERTY P
JOIN LOCATION_TBL L ON P.LocationID = L.LocationID
WHERE L.City = '&v_city';

-- ── Q6: ROUNDING / TRUNCATION ─────────────────────────────
-- Q6a: Monthly bond instalment estimate (price / 240 months = 20 year bond)
SELECT
    Title,
    Price,
    ROUND(Price / 240, 2)    AS MonthlyInstalment,
    TRUNC(Price / 240)       AS MonthlyInstalmentTrunc
FROM PROPERTY
WHERE Status = 'Available';

-- Q6b: Price per square metre rounded to 2 decimal places
SELECT
    Title,
    Price,
    Size_sqm,
    ROUND(Price / Size_sqm, 2)  AS PricePerSqm
FROM PROPERTY
ORDER BY PricePerSqm DESC;

-- Q6c: Round average property price to nearest thousand
SELECT
    ROUND(AVG(Price), -3)  AS AvgPriceRoundedToThousand,
    ROUND(AVG(Price), 2)   AS AvgPriceExact
FROM PROPERTY;

-- ── Q7: DATE FUNCTIONS ────────────────────────────────────
-- Q7a: How many days each property has been listed
SELECT
    Title,
    ListingDate,
    SYSDATE                              AS Today,
    TRUNC(SYSDATE - ListingDate)         AS DaysListed
FROM PROPERTY
ORDER BY DaysListed DESC;

-- Q7b: Listings from a specific year and month
SELECT Title, ListingDate, Status
FROM PROPERTY
WHERE EXTRACT(YEAR  FROM ListingDate) = 2026
  AND EXTRACT(MONTH FROM ListingDate) = 1;

-- Q7c: Clients registered in the last 90 days
SELECT
    FirstName || ' ' || LastName AS ClientName,
    RegistrationDate,
    TRUNC(SYSDATE - RegistrationDate) AS DaysSinceRegistration
FROM CLIENT
WHERE RegistrationDate >= SYSDATE - 90
ORDER BY RegistrationDate DESC;

-- Q7d: Transactions with formatted date
SELECT
    TransactionID,
    TransactionType,
    TO_CHAR(TransactionDate, 'DD Month YYYY') AS FormattedDate,
    FinalPrice,
    Status
FROM TRANSACTION_TBL;

-- ── Q8: AGGREGATE FUNCTIONS ───────────────────────────────
-- Q8a: Average, min, max, and total property prices
SELECT
    COUNT(*)            AS TotalProperties,
    AVG(Price)          AS AveragePrice,
    MIN(Price)          AS CheapestProperty,
    MAX(Price)          AS MostExpensiveProperty,
    SUM(Price)          AS TotalPortfolioValue
FROM PROPERTY;

-- Q8b: Total completed transaction revenue
SELECT
    COUNT(*)        AS TotalTransactions,
    SUM(FinalPrice) AS TotalRevenue,
    AVG(FinalPrice) AS AverageTransactionValue
FROM TRANSACTION_TBL
WHERE Status = 'Completed';

-- Q8c: Count of inquiries per status
SELECT
    Status,
    COUNT(*) AS InquiryCount
FROM INQUIRY
GROUP BY Status;

-- ── Q9: GROUP BY & HAVING ─────────────────────────────────
-- Q9a: Number of listings per agent (only agents with more than 0 listings)
SELECT
    A.FirstName || ' ' || A.LastName AS AgentName,
    COUNT(P.PropertyID)              AS TotalListings
FROM AGENT A
LEFT JOIN PROPERTY P ON A.AgentID = P.AgentID
GROUP BY A.AgentID, A.FirstName, A.LastName
HAVING COUNT(P.PropertyID) > 0
ORDER BY TotalListings DESC;

-- Q9b: Average price per property type (only types with avg price above 500000)
SELECT
    PT.TypeName,
    COUNT(P.PropertyID)     AS NumberOfProperties,
    ROUND(AVG(P.Price), 2)  AS AveragePrice
FROM PROPERTY_TYPE PT
JOIN PROPERTY P ON PT.PropertyTypeID = P.PropertyTypeID
GROUP BY PT.TypeName
HAVING AVG(P.Price) > 500000
ORDER BY AveragePrice DESC;

-- Q9c: Properties saved per client (only clients who saved more than 1)
SELECT
    C.FirstName || ' ' || C.LastName AS ClientName,
    COUNT(CSP.PropertyID)            AS SavedCount
FROM CLIENT C
JOIN CLIENT_SAVED_PROPERTY CSP ON C.ClientID = CSP.ClientID
GROUP BY C.ClientID, C.FirstName, C.LastName
HAVING COUNT(CSP.PropertyID) > 1;

-- ── Q10: JOINS ────────────────────────────────────────────
-- Q10a: INNER JOIN — Properties with their agent and location details
SELECT
    P.Title,
    P.Price,
    P.Status,
    L.City,
    L.Province,
    A.FirstName || ' ' || A.LastName AS AgentName,
    B.BranchName
FROM PROPERTY P
INNER JOIN LOCATION_TBL L  ON P.LocationID     = L.LocationID
INNER JOIN AGENT         A  ON P.AgentID        = A.AgentID
INNER JOIN BRANCH        B  ON A.BranchID       = B.BranchID
ORDER BY P.Price DESC;

-- Q10b: LEFT JOIN — All agents including those with no listings
SELECT
    A.FirstName || ' ' || A.LastName AS AgentName,
    A.Region,
    P.Title                          AS PropertyTitle,
    P.Status
FROM AGENT A
LEFT JOIN PROPERTY P ON A.AgentID = P.AgentID
ORDER BY A.LastName;

-- Q10c: JOIN three tables — Inquiry with client and property details
SELECT
    I.InquiryID,
    C.FirstName || ' ' || C.LastName AS ClientName,
    P.Title                           AS PropertyTitle,
    I.InquiryType,
    I.InquiryDate,
    I.Status
FROM INQUIRY I
JOIN CLIENT   C ON I.ClientID   = C.ClientID
JOIN PROPERTY P ON I.PropertyID = P.PropertyID
ORDER BY I.InquiryDate DESC;

-- ── Q11: SUB-QUERIES ──────────────────────────────────────
-- Q11a: Properties priced above the average price
SELECT Title, Price, Status
FROM PROPERTY
WHERE Price > (SELECT AVG(Price) FROM PROPERTY)
ORDER BY Price DESC;

-- Q11b: Agents who have at least one completed transaction
SELECT FirstName || ' ' || LastName AS AgentName, Email
FROM AGENT
WHERE AgentID IN (
    SELECT AgentID
    FROM TRANSACTION_TBL
    WHERE Status = 'Completed'
);

-- Q11c: Clients who have saved at least one property
SELECT FirstName || ' ' || LastName AS ClientName, ClientType
FROM CLIENT
WHERE ClientID IN (
    SELECT DISTINCT ClientID
    FROM CLIENT_SAVED_PROPERTY
);

-- Q11d: Most expensive property in each city
SELECT P.Title, L.City, P.Price
FROM PROPERTY P
JOIN LOCATION_TBL L ON P.LocationID = L.LocationID
WHERE P.Price = (
    SELECT MAX(P2.Price)
    FROM PROPERTY P2
    JOIN LOCATION_TBL L2 ON P2.LocationID = L2.LocationID
    WHERE L2.City = L.City
)
ORDER BY P.Price DESC;

-- ============================================================
-- SECTION 7: EXTRA FUNCTIONALITY
-- ============================================================

-- EXTRA 1: STORED PROCEDURE — Add a new property listing
CREATE OR REPLACE PROCEDURE SP_ADD_PROPERTY (
    p_AgentID        IN NUMBER,
    p_PropertyTypeID IN NUMBER,
    p_LocationID     IN NUMBER,
    p_Street         IN VARCHAR2,
    p_Title          IN VARCHAR2,
    p_Price          IN NUMBER,
    p_Size_sqm       IN NUMBER,
    p_Bedrooms       IN NUMBER,
    p_Bathrooms      IN NUMBER,
    p_ListingDate    IN DATE
) AS
BEGIN
    INSERT INTO PROPERTY (
        PropertyID, AgentID, PropertyTypeID, LocationID,
        Street, Title, Price, Size_sqm,
        Bedrooms, Bathrooms, Status, ListingDate
    ) VALUES (
        SEQ_PROPERTY.NEXTVAL, p_AgentID, p_PropertyTypeID, p_LocationID,
        p_Street, p_Title, p_Price, p_Size_sqm,
        p_Bedrooms, p_Bathrooms, 'Available', p_ListingDate
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Property added successfully: ' || p_Title);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error adding property: ' || SQLERRM);
END SP_ADD_PROPERTY;
/

-- Test the stored procedure
EXEC SP_ADD_PROPERTY(1, 1, 1, '99 Leopard Lane', 'Spacious 4-Bed Home', 950000, 200, 4, 2, SYSDATE);

-- EXTRA 2: STORED PROCEDURE — Update property status
CREATE OR REPLACE PROCEDURE SP_UPDATE_PROPERTY_STATUS (
    p_PropertyID IN NUMBER,
    p_NewStatus  IN VARCHAR2
) AS
BEGIN
    UPDATE PROPERTY
    SET Status = p_NewStatus
    WHERE PropertyID = p_PropertyID;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No property found with ID: ' || p_PropertyID);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Property ' || p_PropertyID || ' status updated to: ' || p_NewStatus);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END SP_UPDATE_PROPERTY_STATUS;
/

-- EXTRA 3: TRIGGER — Automatically set ListingDate to today if not provided
CREATE OR REPLACE TRIGGER TRG_PROPERTY_LISTING_DATE
BEFORE INSERT ON PROPERTY
FOR EACH ROW
BEGIN
    IF :NEW.ListingDate IS NULL THEN
        :NEW.ListingDate := SYSDATE;
    END IF;
END;
/

-- EXTRA 4: TRIGGER — Prevent deletion of a property that has a completed transaction
CREATE OR REPLACE TRIGGER TRG_PREVENT_PROPERTY_DELETE
BEFORE DELETE ON PROPERTY
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM TRANSACTION_TBL
    WHERE PropertyID = :OLD.PropertyID
      AND Status = 'Completed';

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Cannot delete property ' || :OLD.PropertyID ||
            ' — it has a completed transaction on record.');
    END IF;
END;
/

-- EXTRA 5: FUNCTION — Calculate derived ActiveListingCount for an agent
CREATE OR REPLACE FUNCTION FN_ACTIVE_LISTINGS (p_AgentID IN NUMBER)
RETURN NUMBER AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM PROPERTY
    WHERE AgentID = p_AgentID
      AND Status  = 'Available';
    RETURN v_count;
END FN_ACTIVE_LISTINGS;
/

-- Test the function
SELECT
    FirstName || ' ' || LastName   AS AgentName,
    FN_ACTIVE_LISTINGS(AgentID)    AS ActiveListingCount
FROM AGENT;


-- ============================================================
-- SECTION 8: VERIFICATION — Check all tables loaded correctly
-- ============================================================

SELECT 'BRANCH' AS TableName, COUNT(*) AS RowCount
FROM BRANCH

UNION ALL
SELECT 'AGENT', COUNT(*)
FROM AGENT

UNION ALL
SELECT 'LOCATION_TBL', COUNT(*)
FROM LOCATION_TBL

UNION ALL
SELECT 'PROPERTY_TYPE', COUNT(*)
FROM PROPERTY_TYPE

UNION ALL
SELECT 'PROPERTY', COUNT(*)
FROM PROPERTY

UNION ALL
SELECT 'PROPERTY_FEATURE', COUNT(*)
FROM PROPERTY_FEATURE

UNION ALL
SELECT 'CLIENT', COUNT(*)
FROM CLIENT

UNION ALL
SELECT 'CLIENT_SAVED_PROPERTY', COUNT(*)
FROM CLIENT_SAVED_PROPERTY

UNION ALL
SELECT 'INQUIRY', COUNT(*)
FROM INQUIRY

UNION ALL
SELECT 'TRANSACTION_TBL', COUNT(*)
FROM TRANSACTION_TBL;



-- ============================================================
-- END OF SCRIPT
-- ============================================================
