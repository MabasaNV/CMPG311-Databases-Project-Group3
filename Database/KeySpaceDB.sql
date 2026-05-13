--------------------------------------------------------
--  File created - Wednesday-May-13-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type LOGMNR$COL_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$COL_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
MD_COL_NAME VARCHAR2(384),
MD_COL_NUM NUMBER,                 /* col# */
MD_COL_SEGCOL NUMBER,              /* segcol# */
MD_COL_TYPE NUMBER,                /* type# */
MD_COL_LEN NUMBER,
MD_COL_PREC NUMBER,                /* precision */
MD_COL_SCALE NUMBER,
MD_COL_CHARSETID NUMBER,           /* character set id */
MD_COL_CHARSETFORM NUMBER,         /* character set form */
MD_COL_ALT_TYPE VARCHAR2(4000),    /* adt type if any */
MD_COL_ALT_PREC NUMBER,            /* precision of the adt attribute */
MD_COL_ALT_CHAR_USED VARCHAR2(2),  /* charset used by the adt attribute */
MD_COL_ALT_LENGTH NUMBER,          /* length of the adt attribute */
MD_COL_ALT_XML_TYPE NUMBER,        /* 0/1. is xml_type column */
MD_COL_ALT_BINARYXML_TYPE NUMBER,  /* 0/1. is xml_type stored as binary */
MD_COL_ENC_ISENC VARCHAR2(3) ,     /* 'YES'/'NO' */
MD_COL_ENC_NOSALT VARCHAR2(3) ,    /* 'YES'/'NO' */
MD_COL_ENC_ISLOB VARCHAR2(3) ,     /* 'YES'/'NO' */
MD_COL_ALT_OBJECTXML_TYPE NUMBER,  /* 0/1 xml_type stored as object */
MD_COL_HASNOTNULLDEFAULT VARCHAR2(3) ,   /* 'YES'/'NO' */
MD_COL_ALT_TYPE_OWNER VARCHAR2(384),  /* owner of the adt type if any */
PROPERTY NUMBER,
XCOLTYPEFLAGS NUMBER,
XOPQTYPEFLAGS NUMBER,
EAFLAGS NUMBER,
XFQCOLNAME VARCHAR2(4000),
SPARE1  NUMBER,                    /* col_def.nullable, based on col$.null$ */
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000),
/* Following fields added in 12.1.0.2 */
OBJV# NUMBER,
INTCOL# NUMBER,
INTERVAL_LEADING_PRECISION NUMBER,
INTERVAL_TRAILING_PRECISION NUMBER,
TOID RAW(16),
TYPENAME VARCHAR2(384),
NUMINTCOLS NUMBER,
NUMATTRS NUMBER,
ADTORDER NUMBER,
LOGMNR_SPARE1 NUMBER,             /* col$.null$ */
LOGMNR_SPARE2 NUMBER,
LOGMNR_SPARE3 VARCHAR2(1000),
LOGMNR_SPARE4 DATE,
LOGMNR_SPARE5 NUMBER,
LOGMNR_SPARE6 NUMBER,
LOGMNR_SPARE7 NUMBER,
LOGMNR_SPARE8 NUMBER,
LOGMNR_SPARE9 NUMBER,
XTYPENAME VARCHAR2(4000),
XTOPINTCOL NUMBER,
XREFFEDTABLEOBJN NUMBER,
XREFFEDTABLEOBJV NUMBER,
XOPQTYPETYPE NUMBER,
XOPQLOBINTCOL NUMBER,
XOPQOBJINTCOL NUMBER,
XXMLINTCOL    NUMBER,
LOGMNRDERIVEDFLAGS NUMBER,
/* Following fields added in 12.2 */
COLLID      NUMBER,
COLLINTCOL#  NUMBER,
ACDRRESCOL# NUMBER
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$COL_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$COL_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$COL_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$GSBA_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$GSBA_GG_REC" AS OBJECT
(
LOGMNR_UID NUMBER,
NAME           VARCHAR2(384),
VALUE          VARCHAR2(4000),
LOGMNR_SPARE1  NUMBER,
LOGMNR_SPARE2  NUMBER,
LOGMNR_SPARE3  VARCHAR2(4000),
LOGMNR_SPARE4  DATE
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$GSBA_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$GSBA_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$GSBA_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$KEY_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$KEY_GG_REC" as object
(
LOGMNR_UID NUMBER,
KEY# NUMBER,                   /* index obj# or con# */
KEY_FLAGS NUMBER,              /* index or constraint */
KEY_NAME VARCHAR2(384),        /* index name or constraint name */
INDEX_OWNER# NUMBER,
INDEX_OWNERNAME VARCHAR2(384),
COLNAME VARCHAR2(384),
INTCOL# NUMBER,
which number,
KEY_ORDER VARCHAR2(10),              /* asc or desc */
KEYCOL_FLAGS NUMBER,           /* Column properties such as is_null */
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000)
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$KEY_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$KEY_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$KEY_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$SEQ_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$SEQ_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
NAME VARCHAR2(384),
OWNER# NUMBER,
OWNERNAME VARCHAR2(384),
FLAGS NUMBER,
MD_TAB_SEQCACHE NUMBER,
MD_TAB_SEQINCREMENTBY NUMBER,
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000)
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$SEQ_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$SEQ_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$SEQ_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$TAB_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$TAB_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
BASEOBJV# NUMBER,
MD_TAB_USERID NUMBER,                /* owner# */
MD_TAB_COLCOUNT NUMBER,              /* user column count */
MD_TAB_TOTAL_COL_NUM NUMBER,         /* kernal column count */
MD_TAB_LOG_GROUP_EXISTS NUMBER,      /* Any log group exists for this table */
MD_TAB_IOT VARCHAR2(3) ,             /* 'YES'/'NO' IS IOT? */
MD_TAB_IOT_OVERFLOW VARCHAR2(3) ,    /* 'YES'/'NO' IOT with overflow ? */
MD_TAB_PARTITION  VARCHAR2(3) ,      /* 'YES'/'NO' is partitioned ? */
MD_TAB_SUBPARTITION VARCHAR2(3) ,    /* 'YES'/'NO' is sub partitioned? */
MD_TAB_XMLTYPETABLE VARCHAR2(3) ,    /* 'YES'/'NO' is xmltype table? */
MD_TAB_OBJECTID NUMBER,              /* object id if table object */
MD_TAB_OWNER VARCHAR2(384),     /* owner name */
MD_TAB_NAME VARCHAR2(384),      /* table name */
MD_TAB_OBJTYPE VARCHAR2(384),   /* Object type name */
MD_TAB_SCN NUMBER,                   /* COMMIT_SCN of this table version */
TAB_FLAGS NUMBER,
TRIGFLAG NUMBER,
OBJ_FLAGS NUMBER,
PROPERTY NUMBER,
PARTTYPE NUMBER,
SUBPARTTYPE NUMBER,
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000),
/* Following fields added in 12.1.0.2 */
LVLCNT NUMBER,
LVL1OBJ# NUMBER,
LVL2OBJ# NUMBER,
LVL1TYPE# NUMBER,
LVL2TYPE# NUMBER,
LVL1NAME  VARCHAR2(384),
LVL2NAME  VARCHAR2(384),
INTCOLS   NUMBER,
ASSOC#    NUMBER,
XIDUSN    NUMBER,
XIDSLT    NUMBER,
XIDSQN    NUMBER,
DROP_SCN  NUMBER,
FLAGS     NUMBER,
LOGMNR_SPARE1   NUMBER,
LOGMNR_SPARE2   NUMBER,
LOGMNR_SPARE3   VARCHAR2(1000),
LOGMNR_SPARE4   DATE,
LOGMNR_SPARE5   NUMBER,
LOGMNR_SPARE6   NUMBER,
LOGMNR_SPARE7   NUMBER,
LOGMNR_SPARE8   NUMBER,
LOGMNR_SPARE9   NUMBER,
UNSUPPORTEDCOLS  NUMBER,
COMPLEXTYPECOLS  NUMBER,
NTPARENTOBJNUM   NUMBER,
NTPARENTOBJVERSION NUMBER,
NTPARENTINTCOLNUM  NUMBER,
LOGMNRTLOFLAGS    NUMBER,
LOGMNRMCV VARCHAR2(30),
/* Following fields added in 12.2 */
ACDRFLAGS        NUMBER,                                    /* automatic CDR */
ACDRTSOBJ#       NUMBER,                                    /* automatic CDR */
ACDRROWTSINTCOL# NUMBER                                     /* automatic CDR */
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$TAB_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$TAB_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$TAB_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$USER_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$USER_GG_REC" AS OBJECT
(
LOGMNR_UID     NUMBER,
USERNAME       VARCHAR2(384),
USERID         NUMBER,
LOGMNR_SPARE1  NUMBER,
LOGMNR_SPARE2  NUMBER,
LOGMNR_SPARE3  VARCHAR2(4000),
LOGMNR_SPARE4  DATE
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$USER_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "LOGMNR$USER_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$USER_GG_REC;

/
--------------------------------------------------------
--  DDL for Sequence SEQ_AGENT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_AGENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BRANCH
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BRANCH"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CLIENT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CLIENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FEATURE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FEATURE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_INQUIRY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_INQUIRY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_LOCATION
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_LOCATION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PROPERTY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PROPERTY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PROPTYPE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PROPTYPE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_TRANSACTION
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_TRANSACTION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table AGENT
--------------------------------------------------------

  CREATE TABLE "AGENT" 
   (	"AGENTID" NUMBER, 
	"BRANCHID" NUMBER, 
	"FIRSTNAME" VARCHAR2(50 BYTE), 
	"LASTNAME" VARCHAR2(50 BYTE), 
	"CONTACTNUMBER" VARCHAR2(15 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"REGION" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BRANCH
--------------------------------------------------------

  CREATE TABLE "BRANCH" 
   (	"BRANCHID" NUMBER, 
	"BRANCHNAME" VARCHAR2(100 BYTE), 
	"CITY" VARCHAR2(100 BYTE), 
	"PROVINCE" VARCHAR2(100 BYTE), 
	"CONTACTNUMBER" VARCHAR2(15 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table CLIENT
--------------------------------------------------------

  CREATE TABLE "CLIENT" 
   (	"CLIENTID" NUMBER, 
	"FIRSTNAME" VARCHAR2(50 BYTE), 
	"LASTNAME" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"CONTACTNUMBER" VARCHAR2(15 BYTE), 
	"CLIENTTYPE" VARCHAR2(20 BYTE), 
	"BUDGETMIN" NUMBER(12,2), 
	"BUDGETMAX" NUMBER(12,2), 
	"PREFERREDLOCATION" VARCHAR2(100 BYTE), 
	"PREFERREDPROPERTYTYPE" VARCHAR2(50 BYTE), 
	"REGISTRATIONDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table CLIENT_SAVED_PROPERTY
--------------------------------------------------------

  CREATE TABLE "CLIENT_SAVED_PROPERTY" 
   (	"CLIENTID" NUMBER, 
	"PROPERTYID" NUMBER, 
	"SAVEDDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table INQUIRY
--------------------------------------------------------

  CREATE TABLE "INQUIRY" 
   (	"INQUIRYID" NUMBER, 
	"CLIENTID" NUMBER, 
	"PROPERTYID" NUMBER, 
	"AGENTID" NUMBER, 
	"INQUIRYTYPE" VARCHAR2(20 BYTE), 
	"INQUIRYDATE" DATE, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'Open', 
	"NOTES" VARCHAR2(500 BYTE), 
	"OUTCOMEDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOCATION_TBL
--------------------------------------------------------

  CREATE TABLE "LOCATION_TBL" 
   (	"LOCATIONID" NUMBER, 
	"POSTALCODE" VARCHAR2(10 BYTE), 
	"CITY" VARCHAR2(100 BYTE), 
	"PROVINCE" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PROPERTY
--------------------------------------------------------

  CREATE TABLE "PROPERTY" 
   (	"PROPERTYID" NUMBER, 
	"AGENTID" NUMBER, 
	"PROPERTYTYPEID" NUMBER, 
	"LOCATIONID" NUMBER, 
	"STREET" VARCHAR2(150 BYTE), 
	"TITLE" VARCHAR2(150 BYTE), 
	"PRICE" NUMBER(12,2), 
	"SIZE_SQM" NUMBER(8,2), 
	"BEDROOMS" NUMBER(3,0) DEFAULT 0, 
	"BATHROOMS" NUMBER(3,0) DEFAULT 0, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'Available', 
	"LISTINGDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table PROPERTY_FEATURE
--------------------------------------------------------

  CREATE TABLE "PROPERTY_FEATURE" 
   (	"FEATUREID" NUMBER, 
	"PROPERTYID" NUMBER, 
	"FEATURENAME" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PROPERTY_TYPE
--------------------------------------------------------

  CREATE TABLE "PROPERTY_TYPE" 
   (	"PROPERTYTYPEID" NUMBER, 
	"TYPENAME" VARCHAR2(50 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table TRANSACTION_TBL
--------------------------------------------------------

  CREATE TABLE "TRANSACTION_TBL" 
   (	"TRANSACTIONID" NUMBER, 
	"PROPERTYID" NUMBER, 
	"CLIENTID" NUMBER, 
	"AGENTID" NUMBER, 
	"TRANSACTIONTYPE" VARCHAR2(10 BYTE), 
	"TRANSACTIONDATE" DATE, 
	"FINALPRICE" NUMBER(12,2), 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'Pending'
   ) ;
--------------------------------------------------------
--  DDL for View VW_AGENT_PERFORMANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VW_AGENT_PERFORMANCE" ("AGENTID", "AGENTNAME", "BRANCHNAME", "REGION", "TOTALLISTINGS", "ACTIVELISTINGS", "PROPERTIESSOLD", "PROPERTIESRENTED", "TOTALREVENUE") AS 
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
GROUP BY A.AgentID, A.FirstName, A.LastName, B.BranchName, A.Region
;
--------------------------------------------------------
--  DDL for View VW_AVAILABLE_PROPERTIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VW_AVAILABLE_PROPERTIES" ("PROPERTYID", "TITLE", "STREET", "CITY", "PROVINCE", "POSTALCODE", "PROPERTYTYPE", "PRICE", "SIZE_SQM", "BEDROOMS", "BATHROOMS", "LISTINGDATE", "AGENTNAME", "AGENTCONTACT") AS 
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
WHERE P.Status = 'Available'
;
--------------------------------------------------------
--  DDL for View VW_CLIENT_INQUIRIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VW_CLIENT_INQUIRIES" ("CLIENTID", "CLIENTNAME", "CLIENTTYPE", "PROPERTYTITLE", "INQUIRYTYPE", "INQUIRYDATE", "INQUIRYSTATUS", "AGENTNAME", "NOTES", "OUTCOMEDATE") AS 
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
JOIN AGENT    A ON I.AgentID    = A.AgentID
;
--------------------------------------------------------
--  DDL for View VW_TRANSACTION_SUMMARY
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VW_TRANSACTION_SUMMARY" ("TRANSACTIONID", "PROPERTYTITLE", "CITY", "TRANSACTIONTYPE", "TRANSACTIONDATE", "FINALPRICE", "STATUS", "CLIENTNAME", "AGENTNAME", "BRANCHNAME") AS 
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
JOIN BRANCH        B ON A.BranchID   = B.BranchID
;
REM INSERTING into AGENT
SET DEFINE OFF;
Insert into AGENT (AGENTID,BRANCHID,FIRSTNAME,LASTNAME,CONTACTNUMBER,EMAIL,REGION) values (1,1,'Ntshembo','Mabasa','0677527020','ntshembo@keyspace.co.za','Mafikeng Central');
Insert into AGENT (AGENTID,BRANCHID,FIRSTNAME,LASTNAME,CONTACTNUMBER,EMAIL,REGION) values (2,1,'Mmakoma','Boshomane','0797298054','mmakoma@keyspace.co.za','Mafikeng North');
Insert into AGENT (AGENTID,BRANCHID,FIRSTNAME,LASTNAME,CONTACTNUMBER,EMAIL,REGION) values (3,2,'Shaun','Molewa','0728214859','shaun@keyspace.co.za','Johannesburg South');
Insert into AGENT (AGENTID,BRANCHID,FIRSTNAME,LASTNAME,CONTACTNUMBER,EMAIL,REGION) values (4,3,'Khutso','Choshane','0824053762','khutso@keyspace.co.za','Pretoria East');
Insert into AGENT (AGENTID,BRANCHID,FIRSTNAME,LASTNAME,CONTACTNUMBER,EMAIL,REGION) values (5,4,'Lebogang','Motseki','0684773813','lebogang@keyspace.co.za','Cape Town CBD');
REM INSERTING into BRANCH
SET DEFINE OFF;
Insert into BRANCH (BRANCHID,BRANCHNAME,CITY,PROVINCE,CONTACTNUMBER,EMAIL) values (1,'KeySpace Mafikeng','Mafikeng','North West','0183810001','mafikeng@keyspace.co.za');
Insert into BRANCH (BRANCHID,BRANCHNAME,CITY,PROVINCE,CONTACTNUMBER,EMAIL) values (2,'KeySpace Johannesburg','Johannesburg','Gauteng','0112340002','jhb@keyspace.co.za');
Insert into BRANCH (BRANCHID,BRANCHNAME,CITY,PROVINCE,CONTACTNUMBER,EMAIL) values (3,'KeySpace Pretoria','Pretoria','Gauteng','0123450003','pta@keyspace.co.za');
Insert into BRANCH (BRANCHID,BRANCHNAME,CITY,PROVINCE,CONTACTNUMBER,EMAIL) values (4,'KeySpace Cape Town','Cape Town','Western Cape','0214560004','cpt@keyspace.co.za');
Insert into BRANCH (BRANCHID,BRANCHNAME,CITY,PROVINCE,CONTACTNUMBER,EMAIL) values (5,'KeySpace Durban','Durban','KwaZulu-Natal','0315670005','dbn@keyspace.co.za');
REM INSERTING into CLIENT
SET DEFINE OFF;
Insert into CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAIL,CONTACTNUMBER,CLIENTTYPE,BUDGETMIN,BUDGETMAX,PREFERREDLOCATION,PREFERREDPROPERTYTYPE,REGISTRATIONDATE) values (1,'Tebogo','Morake','tebogo@email.com','0789005970','Buyer',700000,1000000,'Mafikeng','Residential House',to_date('05/JAN/26','DD/MON/RR'));
Insert into CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAIL,CONTACTNUMBER,CLIENTTYPE,BUDGETMIN,BUDGETMAX,PREFERREDLOCATION,PREFERREDPROPERTYTYPE,REGISTRATIONDATE) values (2,'Piet','Ribana','piet@email.com','0685554065','Tenant',8000,12000,'Durban','Rental',to_date('08/JAN/26','DD/MON/RR'));
Insert into CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAIL,CONTACTNUMBER,CLIENTTYPE,BUDGETMIN,BUDGETMAX,PREFERREDLOCATION,PREFERREDPROPERTYTYPE,REGISTRATIONDATE) values (3,'Mongale','Kamogelo','mongale@email.com','0780772170','Buyer',1800000,2500000,'Cape Town','Townhouse',to_date('01/FEB/26','DD/MON/RR'));
Insert into CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAIL,CONTACTNUMBER,CLIENTTYPE,BUDGETMIN,BUDGETMAX,PREFERREDLOCATION,PREFERREDPROPERTYTYPE,REGISTRATIONDATE) values (4,'Madonsela','Ronny','madonsela@email.com','0792779959','Seller',null,null,'Pretoria','Commercial',to_date('15/FEB/26','DD/MON/RR'));
Insert into CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAIL,CONTACTNUMBER,CLIENTTYPE,BUDGETMIN,BUDGETMAX,PREFERREDLOCATION,PREFERREDPROPERTYTYPE,REGISTRATIONDATE) values (5,'Kefilwe','Dlamini','kefilwe@email.com','0831124400','Buyer',500000,700000,'Johannesburg','Apartment',to_date('01/MAR/26','DD/MON/RR'));
REM INSERTING into CLIENT_SAVED_PROPERTY
SET DEFINE OFF;
Insert into CLIENT_SAVED_PROPERTY (CLIENTID,PROPERTYID,SAVEDDATE) values (1,1,to_date('12/JAN/26','DD/MON/RR'));
Insert into CLIENT_SAVED_PROPERTY (CLIENTID,PROPERTYID,SAVEDDATE) values (1,2,to_date('14/JAN/26','DD/MON/RR'));
Insert into CLIENT_SAVED_PROPERTY (CLIENTID,PROPERTYID,SAVEDDATE) values (2,5,to_date('02/MAR/26','DD/MON/RR'));
Insert into CLIENT_SAVED_PROPERTY (CLIENTID,PROPERTYID,SAVEDDATE) values (3,4,to_date('12/FEB/26','DD/MON/RR'));
Insert into CLIENT_SAVED_PROPERTY (CLIENTID,PROPERTYID,SAVEDDATE) values (5,2,to_date('05/MAR/26','DD/MON/RR'));
REM INSERTING into INQUIRY
SET DEFINE OFF;
Insert into INQUIRY (INQUIRYID,CLIENTID,PROPERTYID,AGENTID,INQUIRYTYPE,INQUIRYDATE,STATUS,NOTES,OUTCOMEDATE) values (1,1,1,1,'Viewing',to_date('20/JAN/26','DD/MON/RR'),'Closed','Client viewed property. Interested in making an offer.',to_date('22/JAN/26','DD/MON/RR'));
Insert into INQUIRY (INQUIRYID,CLIENTID,PROPERTYID,AGENTID,INQUIRYTYPE,INQUIRYDATE,STATUS,NOTES,OUTCOMEDATE) values (2,2,5,5,'Viewing',to_date('03/MAR/26','DD/MON/RR'),'Closed','Client signed rental agreement after viewing.',to_date('05/MAR/26','DD/MON/RR'));
Insert into INQUIRY (INQUIRYID,CLIENTID,PROPERTYID,AGENTID,INQUIRYTYPE,INQUIRYDATE,STATUS,NOTES,OUTCOMEDATE) values (3,3,4,4,'General',to_date('14/FEB/26','DD/MON/RR'),'Closed','Client inquired about price negotiation.',to_date('16/FEB/26','DD/MON/RR'));
Insert into INQUIRY (INQUIRYID,CLIENTID,PROPERTYID,AGENTID,INQUIRYTYPE,INQUIRYDATE,STATUS,NOTES,OUTCOMEDATE) values (4,5,2,2,'Viewing',to_date('06/MAR/26','DD/MON/RR'),'Open',null,null);
Insert into INQUIRY (INQUIRYID,CLIENTID,PROPERTYID,AGENTID,INQUIRYTYPE,INQUIRYDATE,STATUS,NOTES,OUTCOMEDATE) values (5,1,3,3,'General',to_date('20/FEB/26','DD/MON/RR'),'No Response','Client inquired about commercial space availability.',null);
REM INSERTING into LOCATION_TBL
SET DEFINE OFF;
Insert into LOCATION_TBL (LOCATIONID,POSTALCODE,CITY,PROVINCE) values (1,'2745','Mafikeng','North West');
Insert into LOCATION_TBL (LOCATIONID,POSTALCODE,CITY,PROVINCE) values (2,'2000','Johannesburg','Gauteng');
Insert into LOCATION_TBL (LOCATIONID,POSTALCODE,CITY,PROVINCE) values (3,'0001','Pretoria','Gauteng');
Insert into LOCATION_TBL (LOCATIONID,POSTALCODE,CITY,PROVINCE) values (4,'8001','Cape Town','Western Cape');
Insert into LOCATION_TBL (LOCATIONID,POSTALCODE,CITY,PROVINCE) values (5,'4001','Durban','KwaZulu-Natal');
REM INSERTING into PROPERTY
SET DEFINE OFF;
Insert into PROPERTY (PROPERTYID,AGENTID,PROPERTYTYPEID,LOCATIONID,STREET,TITLE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,STATUS,LISTINGDATE) values (1,1,1,1,'12 Baobab Street','3-Bedroom Family Home in Mafikeng',850000,180,3,2,'Available',to_date('10/JAN/26','DD/MON/RR'));
Insert into PROPERTY (PROPERTYID,AGENTID,PROPERTYTYPEID,LOCATIONID,STREET,TITLE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,STATUS,LISTINGDATE) values (2,2,2,2,'45 Commissioner St','Modern Studio Apartment in Johannesburg',620000,55,1,1,'Available',to_date('15/JAN/26','DD/MON/RR'));
Insert into PROPERTY (PROPERTYID,AGENTID,PROPERTYTYPEID,LOCATIONID,STREET,TITLE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,STATUS,LISTINGDATE) values (3,3,3,3,'8 Church Square Rd','Prime Office Space in Pretoria CBD',1500000,320,0,2,'Available',to_date('01/FEB/26','DD/MON/RR'));
Insert into PROPERTY (PROPERTYID,AGENTID,PROPERTYTYPEID,LOCATIONID,STREET,TITLE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,STATUS,LISTINGDATE) values (4,4,4,4,'22 Blouberg Rise','Luxury Townhouse in Cape Town',2200000,210,4,3,'Sold',to_date('10/FEB/26','DD/MON/RR'));
Insert into PROPERTY (PROPERTYID,AGENTID,PROPERTYTYPEID,LOCATIONID,STREET,TITLE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,STATUS,LISTINGDATE) values (5,5,5,5,'7 Florida Road','2-Bedroom Rental Flat in Durban',9500,90,2,1,'Rented',to_date('01/MAR/26','DD/MON/RR'));
Insert into PROPERTY (PROPERTYID,AGENTID,PROPERTYTYPEID,LOCATIONID,STREET,TITLE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,STATUS,LISTINGDATE) values (6,1,1,1,'99 Leopard Lane','Spacious 4-Bed Home',950000,200,4,2,'Available',to_date('13/MAY/26','DD/MON/RR'));
REM INSERTING into PROPERTY_FEATURE
SET DEFINE OFF;
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (1,1,'Garden');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (2,1,'Garage');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (3,1,'Security Gate');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (4,2,'Balcony');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (5,2,'Pool');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (6,3,'Parking');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (7,3,'Lift Access');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (8,3,'Backup Generator');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (9,4,'Pool');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (10,4,'Double Garage');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (11,4,'Garden');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (12,4,'Solar Panels');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (13,5,'Pet Friendly');
Insert into PROPERTY_FEATURE (FEATUREID,PROPERTYID,FEATURENAME) values (14,5,'Parking');
REM INSERTING into PROPERTY_TYPE
SET DEFINE OFF;
Insert into PROPERTY_TYPE (PROPERTYTYPEID,TYPENAME,DESCRIPTION) values (1,'Residential House','Standalone residential property');
Insert into PROPERTY_TYPE (PROPERTYTYPEID,TYPENAME,DESCRIPTION) values (2,'Apartment','Unit within a multi-storey building');
Insert into PROPERTY_TYPE (PROPERTYTYPEID,TYPENAME,DESCRIPTION) values (3,'Commercial','Office or retail business property');
Insert into PROPERTY_TYPE (PROPERTYTYPEID,TYPENAME,DESCRIPTION) values (4,'Townhouse','Sectional title residential property');
Insert into PROPERTY_TYPE (PROPERTYTYPEID,TYPENAME,DESCRIPTION) values (5,'Rental','Property listed for rental purposes');
REM INSERTING into TRANSACTION_TBL
SET DEFINE OFF;
Insert into TRANSACTION_TBL (TRANSACTIONID,PROPERTYID,CLIENTID,AGENTID,TRANSACTIONTYPE,TRANSACTIONDATE,FINALPRICE,STATUS) values (1,4,3,4,'Sale',to_date('28/FEB/26','DD/MON/RR'),2150000,'Completed');
Insert into TRANSACTION_TBL (TRANSACTIONID,PROPERTYID,CLIENTID,AGENTID,TRANSACTIONTYPE,TRANSACTIONDATE,FINALPRICE,STATUS) values (2,5,2,5,'Rental',to_date('06/MAR/26','DD/MON/RR'),9500,'Completed');
Insert into TRANSACTION_TBL (TRANSACTIONID,PROPERTYID,CLIENTID,AGENTID,TRANSACTIONTYPE,TRANSACTIONDATE,FINALPRICE,STATUS) values (3,1,1,1,'Sale',to_date('10/MAR/26','DD/MON/RR'),840000,'Pending');
REM INSERTING into VW_AGENT_PERFORMANCE
SET DEFINE OFF;
Insert into VW_AGENT_PERFORMANCE (AGENTID,AGENTNAME,BRANCHNAME,REGION,TOTALLISTINGS,ACTIVELISTINGS,PROPERTIESSOLD,PROPERTIESRENTED,TOTALREVENUE) values (1,'Ntshembo Mabasa','KeySpace Mafikeng','Mafikeng Central',2,2,0,0,0);
Insert into VW_AGENT_PERFORMANCE (AGENTID,AGENTNAME,BRANCHNAME,REGION,TOTALLISTINGS,ACTIVELISTINGS,PROPERTIESSOLD,PROPERTIESRENTED,TOTALREVENUE) values (2,'Mmakoma Boshomane','KeySpace Mafikeng','Mafikeng North',1,1,0,0,0);
Insert into VW_AGENT_PERFORMANCE (AGENTID,AGENTNAME,BRANCHNAME,REGION,TOTALLISTINGS,ACTIVELISTINGS,PROPERTIESSOLD,PROPERTIESRENTED,TOTALREVENUE) values (3,'Shaun Molewa','KeySpace Johannesburg','Johannesburg South',1,1,0,0,0);
Insert into VW_AGENT_PERFORMANCE (AGENTID,AGENTNAME,BRANCHNAME,REGION,TOTALLISTINGS,ACTIVELISTINGS,PROPERTIESSOLD,PROPERTIESRENTED,TOTALREVENUE) values (4,'Khutso Choshane','KeySpace Pretoria','Pretoria East',1,0,1,0,2150000);
Insert into VW_AGENT_PERFORMANCE (AGENTID,AGENTNAME,BRANCHNAME,REGION,TOTALLISTINGS,ACTIVELISTINGS,PROPERTIESSOLD,PROPERTIESRENTED,TOTALREVENUE) values (5,'Lebogang Motseki','KeySpace Cape Town','Cape Town CBD',1,0,0,1,9500);
REM INSERTING into VW_AVAILABLE_PROPERTIES
SET DEFINE OFF;
Insert into VW_AVAILABLE_PROPERTIES (PROPERTYID,TITLE,STREET,CITY,PROVINCE,POSTALCODE,PROPERTYTYPE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,LISTINGDATE,AGENTNAME,AGENTCONTACT) values (1,'3-Bedroom Family Home in Mafikeng','12 Baobab Street','Mafikeng','North West','2745','Residential House',850000,180,3,2,to_date('10/JAN/26','DD/MON/RR'),'Ntshembo Mabasa','0677527020');
Insert into VW_AVAILABLE_PROPERTIES (PROPERTYID,TITLE,STREET,CITY,PROVINCE,POSTALCODE,PROPERTYTYPE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,LISTINGDATE,AGENTNAME,AGENTCONTACT) values (6,'Spacious 4-Bed Home','99 Leopard Lane','Mafikeng','North West','2745','Residential House',950000,200,4,2,to_date('13/MAY/26','DD/MON/RR'),'Ntshembo Mabasa','0677527020');
Insert into VW_AVAILABLE_PROPERTIES (PROPERTYID,TITLE,STREET,CITY,PROVINCE,POSTALCODE,PROPERTYTYPE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,LISTINGDATE,AGENTNAME,AGENTCONTACT) values (2,'Modern Studio Apartment in Johannesburg','45 Commissioner St','Johannesburg','Gauteng','2000','Apartment',620000,55,1,1,to_date('15/JAN/26','DD/MON/RR'),'Mmakoma Boshomane','0797298054');
Insert into VW_AVAILABLE_PROPERTIES (PROPERTYID,TITLE,STREET,CITY,PROVINCE,POSTALCODE,PROPERTYTYPE,PRICE,SIZE_SQM,BEDROOMS,BATHROOMS,LISTINGDATE,AGENTNAME,AGENTCONTACT) values (3,'Prime Office Space in Pretoria CBD','8 Church Square Rd','Pretoria','Gauteng','0001','Commercial',1500000,320,0,2,to_date('01/FEB/26','DD/MON/RR'),'Shaun Molewa','0728214859');
REM INSERTING into VW_CLIENT_INQUIRIES
SET DEFINE OFF;
Insert into VW_CLIENT_INQUIRIES (CLIENTID,CLIENTNAME,CLIENTTYPE,PROPERTYTITLE,INQUIRYTYPE,INQUIRYDATE,INQUIRYSTATUS,AGENTNAME,NOTES,OUTCOMEDATE) values (1,'Tebogo Morake','Buyer','3-Bedroom Family Home in Mafikeng','Viewing',to_date('20/JAN/26','DD/MON/RR'),'Closed','Ntshembo Mabasa','Client viewed property. Interested in making an offer.',to_date('22/JAN/26','DD/MON/RR'));
Insert into VW_CLIENT_INQUIRIES (CLIENTID,CLIENTNAME,CLIENTTYPE,PROPERTYTITLE,INQUIRYTYPE,INQUIRYDATE,INQUIRYSTATUS,AGENTNAME,NOTES,OUTCOMEDATE) values (5,'Kefilwe Dlamini','Buyer','Modern Studio Apartment in Johannesburg','Viewing',to_date('06/MAR/26','DD/MON/RR'),'Open','Mmakoma Boshomane',null,null);
Insert into VW_CLIENT_INQUIRIES (CLIENTID,CLIENTNAME,CLIENTTYPE,PROPERTYTITLE,INQUIRYTYPE,INQUIRYDATE,INQUIRYSTATUS,AGENTNAME,NOTES,OUTCOMEDATE) values (1,'Tebogo Morake','Buyer','Prime Office Space in Pretoria CBD','General',to_date('20/FEB/26','DD/MON/RR'),'No Response','Shaun Molewa','Client inquired about commercial space availability.',null);
Insert into VW_CLIENT_INQUIRIES (CLIENTID,CLIENTNAME,CLIENTTYPE,PROPERTYTITLE,INQUIRYTYPE,INQUIRYDATE,INQUIRYSTATUS,AGENTNAME,NOTES,OUTCOMEDATE) values (3,'Mongale Kamogelo','Buyer','Luxury Townhouse in Cape Town','General',to_date('14/FEB/26','DD/MON/RR'),'Closed','Khutso Choshane','Client inquired about price negotiation.',to_date('16/FEB/26','DD/MON/RR'));
Insert into VW_CLIENT_INQUIRIES (CLIENTID,CLIENTNAME,CLIENTTYPE,PROPERTYTITLE,INQUIRYTYPE,INQUIRYDATE,INQUIRYSTATUS,AGENTNAME,NOTES,OUTCOMEDATE) values (2,'Piet Ribana','Tenant','2-Bedroom Rental Flat in Durban','Viewing',to_date('03/MAR/26','DD/MON/RR'),'Closed','Lebogang Motseki','Client signed rental agreement after viewing.',to_date('05/MAR/26','DD/MON/RR'));
REM INSERTING into VW_TRANSACTION_SUMMARY
SET DEFINE OFF;
Insert into VW_TRANSACTION_SUMMARY (TRANSACTIONID,PROPERTYTITLE,CITY,TRANSACTIONTYPE,TRANSACTIONDATE,FINALPRICE,STATUS,CLIENTNAME,AGENTNAME,BRANCHNAME) values (3,'3-Bedroom Family Home in Mafikeng','Mafikeng','Sale',to_date('10/MAR/26','DD/MON/RR'),840000,'Pending','Tebogo Morake','Ntshembo Mabasa','KeySpace Mafikeng');
Insert into VW_TRANSACTION_SUMMARY (TRANSACTIONID,PROPERTYTITLE,CITY,TRANSACTIONTYPE,TRANSACTIONDATE,FINALPRICE,STATUS,CLIENTNAME,AGENTNAME,BRANCHNAME) values (1,'Luxury Townhouse in Cape Town','Cape Town','Sale',to_date('28/FEB/26','DD/MON/RR'),2150000,'Completed','Mongale Kamogelo','Khutso Choshane','KeySpace Pretoria');
Insert into VW_TRANSACTION_SUMMARY (TRANSACTIONID,PROPERTYTITLE,CITY,TRANSACTIONTYPE,TRANSACTIONDATE,FINALPRICE,STATUS,CLIENTNAME,AGENTNAME,BRANCHNAME) values (2,'2-Bedroom Rental Flat in Durban','Durban','Rental',to_date('06/MAR/26','DD/MON/RR'),9500,'Completed','Piet Ribana','Lebogang Motseki','KeySpace Cape Town');
--------------------------------------------------------
--  DDL for Index PK_AGENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AGENT" ON "AGENT" ("AGENTID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BRANCH
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BRANCH" ON "BRANCH" ("BRANCHID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CLIENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CLIENT" ON "CLIENT" ("CLIENTID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CLIENTSAVED
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CLIENTSAVED" ON "CLIENT_SAVED_PROPERTY" ("CLIENTID", "PROPERTYID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FEATURE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FEATURE" ON "PROPERTY_FEATURE" ("FEATUREID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INQUIRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INQUIRY" ON "INQUIRY" ("INQUIRYID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LOCATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LOCATION" ON "LOCATION_TBL" ("LOCATIONID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PROPERTY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROPERTY" ON "PROPERTY" ("PROPERTYID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PROPERTYTYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROPERTYTYPE" ON "PROPERTY_TYPE" ("PROPERTYTYPEID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TRANSACTION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TRANSACTION" ON "TRANSACTION_TBL" ("TRANSACTIONID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_AGENT_BRANCH
--------------------------------------------------------

  CREATE INDEX "IDX_AGENT_BRANCH" ON "AGENT" ("BRANCHID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_AGENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AGENT" ON "AGENT" ("AGENTID") 
  ;
--------------------------------------------------------
--  DDL for Index UQ_AGENT_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "UQ_AGENT_EMAIL" ON "AGENT" ("EMAIL") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BRANCH
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BRANCH" ON "BRANCH" ("BRANCHID") 
  ;
--------------------------------------------------------
--  DDL for Index UQ_BRANCH_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "UQ_BRANCH_EMAIL" ON "BRANCH" ("EMAIL") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CLIENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CLIENT" ON "CLIENT" ("CLIENTID") 
  ;
--------------------------------------------------------
--  DDL for Index UQ_CLIENT_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "UQ_CLIENT_EMAIL" ON "CLIENT" ("EMAIL") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CLIENTSAVED
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CLIENTSAVED" ON "CLIENT_SAVED_PROPERTY" ("CLIENTID", "PROPERTYID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_INQUIRY_STATUS
--------------------------------------------------------

  CREATE INDEX "IDX_INQUIRY_STATUS" ON "INQUIRY" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INQUIRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INQUIRY" ON "INQUIRY" ("INQUIRYID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LOCATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LOCATION" ON "LOCATION_TBL" ("LOCATIONID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_PROPERTY_STATUS
--------------------------------------------------------

  CREATE INDEX "IDX_PROPERTY_STATUS" ON "PROPERTY" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_PROPERTY_PRICE
--------------------------------------------------------

  CREATE INDEX "IDX_PROPERTY_PRICE" ON "PROPERTY" ("PRICE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PROPERTY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROPERTY" ON "PROPERTY" ("PROPERTYID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FEATURE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FEATURE" ON "PROPERTY_FEATURE" ("FEATUREID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PROPERTYTYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROPERTYTYPE" ON "PROPERTY_TYPE" ("PROPERTYTYPEID") 
  ;
--------------------------------------------------------
--  DDL for Index UQ_PROPERTYTYPE_NAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "UQ_PROPERTYTYPE_NAME" ON "PROPERTY_TYPE" ("TYPENAME") 
  ;
--------------------------------------------------------
--  DDL for Index UQ_TRANSACTION_PROPERTY
--------------------------------------------------------

  CREATE UNIQUE INDEX "UQ_TRANSACTION_PROPERTY" ON "TRANSACTION_TBL" ("PROPERTYID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_TRANS_TYPE
--------------------------------------------------------

  CREATE INDEX "IDX_TRANS_TYPE" ON "TRANSACTION_TBL" ("TRANSACTIONTYPE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TRANSACTION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TRANSACTION" ON "TRANSACTION_TBL" ("TRANSACTIONID") 
  ;
--------------------------------------------------------
--  DDL for Trigger TRG_PREVENT_PROPERTY_DELETE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PREVENT_PROPERTY_DELETE" 
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
ALTER TRIGGER "TRG_PREVENT_PROPERTY_DELETE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROPERTY_LISTING_DATE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PROPERTY_LISTING_DATE" 
BEFORE INSERT ON PROPERTY
FOR EACH ROW
BEGIN
    IF :NEW.ListingDate IS NULL THEN
        :NEW.ListingDate := SYSDATE;
    END IF;
END;

/
ALTER TRIGGER "TRG_PROPERTY_LISTING_DATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROPERTY_LISTING_DATE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PROPERTY_LISTING_DATE" 
BEFORE INSERT ON PROPERTY
FOR EACH ROW
BEGIN
    IF :NEW.ListingDate IS NULL THEN
        :NEW.ListingDate := SYSDATE;
    END IF;
END;

/
ALTER TRIGGER "TRG_PROPERTY_LISTING_DATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PREVENT_PROPERTY_DELETE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PREVENT_PROPERTY_DELETE" 
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
ALTER TRIGGER "TRG_PREVENT_PROPERTY_DELETE" ENABLE;
--------------------------------------------------------
--  DDL for Procedure SP_ADD_PROPERTY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_ADD_PROPERTY" (
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
--------------------------------------------------------
--  DDL for Procedure SP_UPDATE_PROPERTY_STATUS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_UPDATE_PROPERTY_STATUS" (
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
--------------------------------------------------------
--  DDL for Function FN_ACTIVE_LISTINGS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_ACTIVE_LISTINGS" (p_AgentID IN NUMBER)
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
--------------------------------------------------------
--  DDL for Function LOGMNR$COL_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "LOGMNR$COL_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
237 185
nkvJV1w6wH1y7mRApzf9mGuebNUwgxDILkhGfHQCmP8+Vi4fyqh3SG1Fyq+pCts1OlgnK761
YuzKBA4JE5DNwZzBIF/Y4ZM5eUlquVyTkOg+AodK3vQJt9NLvPITXbP42O37gO+zKr4BQEJk
ypwrP1U/Pf6MLZONN8LUaVqHCN87T14HqHs5taX7LhLXQ2lCVBE1Ll8dyB9CDOlbyvQS/lrb
+0n1pQi9IJAWySL85ChAqnTaqFJm0YeToD4lZ8UUPQqIZNoX0x73WK9OzsmdBrvEC97iduxe
PEXVkxF6xklPod6yOGBvW7DAFMBgf+LajDLVKOAwB2EAiKCXYMuTUTtMYYkCFFf4sj1rCpsj
TLth6TSru530aM2HP6bEbm3m

/
--------------------------------------------------------
--  DDL for Function LOGMNR$GSBA_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "LOGMNR$GSBA_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
206 171
6gxi/CQwK1I5Rfwuw/SXrOGpVRYwgwLI1yfbfHRGEjNe54OE4QwRZCoA20oG536tzgcBrj+1
xE3tE8jIhAoTlUdUmkdYMmZycO1SdiJZwwt/6BrM1wHXl/E5+3Ip2NXzC9j8v4+KjkD9d5AT
p05eEsEWjU1CBTMSpjZZrXzbgFl9QNnQ+zJGjSug21f76ajs78m6anxz7vFcTcem6XpAgKjc
EXzd/ijP8qiOqwblTfnXcRslJn3MljD02u+5fh9NBctOmnaw/tOjRCFPUhY8I9gCoMptjG7U
rHEIFzHOFyxBEdulRGq4ngSgcm7l2yOdSHgNM8rO2vUH4gozvJoLE1S8GBBzG/wrvHPhACQ/
2w==

/
--------------------------------------------------------
--  DDL for Function LOGMNR$KEY_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "LOGMNR$KEY_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2a0 1a1
3O4I5hDO715d8A2tqbxMCflFW0owg/D319xqfC9Grfg+K6yE71zMvtNS45AyRXBk77WpI5v4
nUSfE2lbvUYgk3JHySIe28XxC3xIYYpPGQjxwa3GzPw0FN5aN6kerQQTHUBp29Dd+vLSgBaC
2pAFrq059ZvN0ZPN11XG/2RuDY7HaTQu/QffhnY8rVlNxpFmbkVidwtZQahx5qIFu9Uww/tv
o1AvhjaORi898/KiPtOqv7LpsPFbyNuMnZEG48cxtZuesMBJFP/bKtgU2DN69xiT8Pxf+N2n
g0D2ximYzZqwY/4dBQj9dyQDuXRFo40hdqtWw0L96zV6723aQ8Xp0cqBaZj2wWTI4+6Ikry9
zY0Mdm3bV8TYqsOa+zT4fnikGO0eYbTFHEiW9QUbl/UwzuERwk8p

/
--------------------------------------------------------
--  DDL for Function LOGMNR$SEQ_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "LOGMNR$SEQ_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
249 181
++dDv/cHZatK7/vHG9lvR8DQCpYwg/D3AEhqfHQC2h6ONoOvOeHvTNX1S5GDyajM4j8vkSVz
IMw+LbYS3goujprvmrB/LUpdBF8TVvjEqZpC7MCKPXWcGnTeL7ja8C2tcOdjOpRXkwL5NmPJ
B0KqMvwepdiQDY7HUDQrBddQC1lBqHGEogWkwRJ3+2+jUC+Gpo5GTazIWS0V551NkSl3+h0W
BhkPglLbvQDPzxWTnmu4ZuJIlTiNwTf1R0WxghyyKFjES9CJsCrGT8Fn7prlF4Mr5kx1YBGf
5xaODtRnmVJgb65RlKbAN9+Xxf2QnQjKQL99RZAgsEwGVKNfx9lFKwHLGUwzjOxmIAXXYd/Z
+L9osPQJjZYkNrD0pQ==

/
--------------------------------------------------------
--  DDL for Function LOGMNR$TAB_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "LOGMNR$TAB_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
22e 181
PRVt0FiLRPgjIhZlCZcQhnOHXQ4wgzJp2UhGfHSKrQ843hKm3gKD9swoFAS4jVcW0CsSl7W1
6banVWdjktOVM18XyRjY4ZM5eRdquSp0ZdfHl3KJPBYqPi9LXIwum30Qh7ymgO+zTKj+R1N2
nSs/TPnknfYLwcUdAfBryDQGEIMisMuE9XT5ix3sudhHa5tLJRjsBIDKlqL7zk2CH0C1NRAZ
XrP7WgavVdNS3Yikz88VupZG21hTuAGspJBgCagmNWIwi9pgCIWP3rxF4p+uMps/ABEg+MBP
6Iykm62kO6hWhVHJXkfKF/jrQFjYBTTzatr1VTcOXt/AFuagDR7isNtb//lnXh8TXyAFWyCT
ubv6GXL0aM0PP/t+DfSl

/
--------------------------------------------------------
--  DDL for Function LOGMNR$USER_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "LOGMNR$USER_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
272 191
Vc+i+Mga8m7/BSlvXl0J+GmParYwg/D319wCfC8CTE6Ot30G8QRR0WzR8ohw8Z/y6DuL4pL5
IDjZApnCaZgeKa1OTjLj2B2tOYZg2ZuOAPKrxo7DeBqtn0Ahw0tubS36jP4xc+d2eQebdJMD
c/U0JxdiAl0qIPzsltBjeoGAEsxUk0aubCMJmysgc2d8ojil6ixQ37D7RA0HWMkh27QdOuXF
vSwuufDunMMT8Hue9dvy4vRXj+PhuyylJSukStsxyIb234EahCXyrjDlnzbC91eoU7v5sb4D
OvtDmggQCEViyhFXwspP9P0dOObin8JENsDJeFZYr/oVAgSHa97LRKvNZgd+f//XHlpEAOP4
rNm5mF0wTCABbb7tc5c7uo09M+79i7en8g==

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "CATALOG" FOR "CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "COL" FOR "COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "PRODUCT_USER_PROFILE" FOR "SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "PUBLICSYN" FOR "PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSCATALOG" FOR "SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSFILES" FOR "SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "TAB" FOR "TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "TABQUOTAS" FOR "TABQUOTAS";
--------------------------------------------------------
--  Constraints for Table AGENT
--------------------------------------------------------

  ALTER TABLE "AGENT" MODIFY ("AGENTID" NOT NULL ENABLE);
  ALTER TABLE "AGENT" MODIFY ("BRANCHID" NOT NULL ENABLE);
  ALTER TABLE "AGENT" MODIFY ("FIRSTNAME" NOT NULL ENABLE);
  ALTER TABLE "AGENT" MODIFY ("LASTNAME" NOT NULL ENABLE);
  ALTER TABLE "AGENT" MODIFY ("CONTACTNUMBER" NOT NULL ENABLE);
  ALTER TABLE "AGENT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "AGENT" MODIFY ("REGION" NOT NULL ENABLE);
  ALTER TABLE "AGENT" ADD CONSTRAINT "PK_AGENT" PRIMARY KEY ("AGENTID")
  USING INDEX  ENABLE;
  ALTER TABLE "AGENT" ADD CONSTRAINT "UQ_AGENT_EMAIL" UNIQUE ("EMAIL")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BRANCH
--------------------------------------------------------

  ALTER TABLE "BRANCH" MODIFY ("BRANCHID" NOT NULL ENABLE);
  ALTER TABLE "BRANCH" MODIFY ("BRANCHNAME" NOT NULL ENABLE);
  ALTER TABLE "BRANCH" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "BRANCH" MODIFY ("PROVINCE" NOT NULL ENABLE);
  ALTER TABLE "BRANCH" MODIFY ("CONTACTNUMBER" NOT NULL ENABLE);
  ALTER TABLE "BRANCH" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "BRANCH" ADD CONSTRAINT "PK_BRANCH" PRIMARY KEY ("BRANCHID")
  USING INDEX  ENABLE;
  ALTER TABLE "BRANCH" ADD CONSTRAINT "UQ_BRANCH_EMAIL" UNIQUE ("EMAIL")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENT
--------------------------------------------------------

  ALTER TABLE "CLIENT" MODIFY ("CLIENTID" NOT NULL ENABLE);
  ALTER TABLE "CLIENT" MODIFY ("FIRSTNAME" NOT NULL ENABLE);
  ALTER TABLE "CLIENT" MODIFY ("LASTNAME" NOT NULL ENABLE);
  ALTER TABLE "CLIENT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "CLIENT" MODIFY ("CONTACTNUMBER" NOT NULL ENABLE);
  ALTER TABLE "CLIENT" MODIFY ("CLIENTTYPE" NOT NULL ENABLE);
  ALTER TABLE "CLIENT" MODIFY ("REGISTRATIONDATE" NOT NULL ENABLE);
  ALTER TABLE "CLIENT" ADD CONSTRAINT "CHK_CLIENTTYPE" CHECK (ClientType IN ('Buyer','Seller','Tenant','Landlord')) ENABLE;
  ALTER TABLE "CLIENT" ADD CONSTRAINT "CHK_BUDGETMIN" CHECK (BudgetMin >= 0) ENABLE;
  ALTER TABLE "CLIENT" ADD CONSTRAINT "CHK_BUDGETMAX" CHECK (BudgetMax >= 0) ENABLE;
  ALTER TABLE "CLIENT" ADD CONSTRAINT "PK_CLIENT" PRIMARY KEY ("CLIENTID")
  USING INDEX  ENABLE;
  ALTER TABLE "CLIENT" ADD CONSTRAINT "UQ_CLIENT_EMAIL" UNIQUE ("EMAIL")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENT_SAVED_PROPERTY
--------------------------------------------------------

  ALTER TABLE "CLIENT_SAVED_PROPERTY" MODIFY ("CLIENTID" NOT NULL ENABLE);
  ALTER TABLE "CLIENT_SAVED_PROPERTY" MODIFY ("PROPERTYID" NOT NULL ENABLE);
  ALTER TABLE "CLIENT_SAVED_PROPERTY" MODIFY ("SAVEDDATE" NOT NULL ENABLE);
  ALTER TABLE "CLIENT_SAVED_PROPERTY" ADD CONSTRAINT "PK_CLIENTSAVED" PRIMARY KEY ("CLIENTID", "PROPERTYID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table INQUIRY
--------------------------------------------------------

  ALTER TABLE "INQUIRY" MODIFY ("INQUIRYID" NOT NULL ENABLE);
  ALTER TABLE "INQUIRY" MODIFY ("CLIENTID" NOT NULL ENABLE);
  ALTER TABLE "INQUIRY" MODIFY ("PROPERTYID" NOT NULL ENABLE);
  ALTER TABLE "INQUIRY" MODIFY ("AGENTID" NOT NULL ENABLE);
  ALTER TABLE "INQUIRY" MODIFY ("INQUIRYTYPE" NOT NULL ENABLE);
  ALTER TABLE "INQUIRY" MODIFY ("INQUIRYDATE" NOT NULL ENABLE);
  ALTER TABLE "INQUIRY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "INQUIRY" ADD CONSTRAINT "CHK_INQUIRYTYPE" CHECK (InquiryType IN ('Viewing','General')) ENABLE;
  ALTER TABLE "INQUIRY" ADD CONSTRAINT "CHK_INQUIRYSTATUS" CHECK (Status IN ('Open','Closed','No Response')) ENABLE;
  ALTER TABLE "INQUIRY" ADD CONSTRAINT "PK_INQUIRY" PRIMARY KEY ("INQUIRYID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCATION_TBL
--------------------------------------------------------

  ALTER TABLE "LOCATION_TBL" MODIFY ("LOCATIONID" NOT NULL ENABLE);
  ALTER TABLE "LOCATION_TBL" MODIFY ("POSTALCODE" NOT NULL ENABLE);
  ALTER TABLE "LOCATION_TBL" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "LOCATION_TBL" MODIFY ("PROVINCE" NOT NULL ENABLE);
  ALTER TABLE "LOCATION_TBL" ADD CONSTRAINT "PK_LOCATION" PRIMARY KEY ("LOCATIONID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROPERTY
--------------------------------------------------------

  ALTER TABLE "PROPERTY" MODIFY ("PROPERTYID" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("AGENTID" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("PROPERTYTYPEID" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("LOCATIONID" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("STREET" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("SIZE_SQM" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("BEDROOMS" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("BATHROOMS" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" MODIFY ("LISTINGDATE" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "CHK_PROPERTY_PRICE" CHECK (Price > 0) ENABLE;
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "CHK_PROPERTY_SIZE" CHECK (Size_sqm > 0) ENABLE;
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "CHK_PROPERTY_BEDS" CHECK (Bedrooms >= 0) ENABLE;
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "CHK_PROPERTY_BATHS" CHECK (Bathrooms >= 0) ENABLE;
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "CHK_PROPERTY_STATUS" CHECK (Status IN ('Available','Sold','Rented','Withdrawn')) ENABLE;
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "PK_PROPERTY" PRIMARY KEY ("PROPERTYID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROPERTY_FEATURE
--------------------------------------------------------

  ALTER TABLE "PROPERTY_FEATURE" MODIFY ("FEATUREID" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY_FEATURE" MODIFY ("PROPERTYID" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY_FEATURE" MODIFY ("FEATURENAME" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY_FEATURE" ADD CONSTRAINT "PK_FEATURE" PRIMARY KEY ("FEATUREID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROPERTY_TYPE
--------------------------------------------------------

  ALTER TABLE "PROPERTY_TYPE" MODIFY ("PROPERTYTYPEID" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY_TYPE" MODIFY ("TYPENAME" NOT NULL ENABLE);
  ALTER TABLE "PROPERTY_TYPE" ADD CONSTRAINT "PK_PROPERTYTYPE" PRIMARY KEY ("PROPERTYTYPEID")
  USING INDEX  ENABLE;
  ALTER TABLE "PROPERTY_TYPE" ADD CONSTRAINT "UQ_PROPERTYTYPE_NAME" UNIQUE ("TYPENAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANSACTION_TBL
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_TBL" MODIFY ("TRANSACTIONID" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" MODIFY ("PROPERTYID" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" MODIFY ("CLIENTID" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" MODIFY ("AGENTID" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" MODIFY ("TRANSACTIONTYPE" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" MODIFY ("TRANSACTIONDATE" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" MODIFY ("FINALPRICE" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "CHK_TRANSTYPE" CHECK (TransactionType IN ('Sale','Rental')) ENABLE;
  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "CHK_TRANSSTATUS" CHECK (Status IN ('Pending','Completed','Cancelled')) ENABLE;
  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "CHK_FINALPRICE" CHECK (FinalPrice > 0) ENABLE;
  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "PK_TRANSACTION" PRIMARY KEY ("TRANSACTIONID")
  USING INDEX  ENABLE;
  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "UQ_TRANSACTION_PROPERTY" UNIQUE ("PROPERTYID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AGENT
--------------------------------------------------------

  ALTER TABLE "AGENT" ADD CONSTRAINT "FK_AGENT_BRANCH" FOREIGN KEY ("BRANCHID")
	  REFERENCES "BRANCH" ("BRANCHID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLIENT_SAVED_PROPERTY
--------------------------------------------------------

  ALTER TABLE "CLIENT_SAVED_PROPERTY" ADD CONSTRAINT "FK_SAVED_CLIENT" FOREIGN KEY ("CLIENTID")
	  REFERENCES "CLIENT" ("CLIENTID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CLIENT_SAVED_PROPERTY" ADD CONSTRAINT "FK_SAVED_PROPERTY" FOREIGN KEY ("PROPERTYID")
	  REFERENCES "PROPERTY" ("PROPERTYID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INQUIRY
--------------------------------------------------------

  ALTER TABLE "INQUIRY" ADD CONSTRAINT "FK_INQUIRY_CLIENT" FOREIGN KEY ("CLIENTID")
	  REFERENCES "CLIENT" ("CLIENTID") ENABLE;
  ALTER TABLE "INQUIRY" ADD CONSTRAINT "FK_INQUIRY_PROPERTY" FOREIGN KEY ("PROPERTYID")
	  REFERENCES "PROPERTY" ("PROPERTYID") ENABLE;
  ALTER TABLE "INQUIRY" ADD CONSTRAINT "FK_INQUIRY_AGENT" FOREIGN KEY ("AGENTID")
	  REFERENCES "AGENT" ("AGENTID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROPERTY
--------------------------------------------------------

  ALTER TABLE "PROPERTY" ADD CONSTRAINT "FK_PROPERTY_AGENT" FOREIGN KEY ("AGENTID")
	  REFERENCES "AGENT" ("AGENTID") ENABLE;
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "FK_PROPERTY_TYPE" FOREIGN KEY ("PROPERTYTYPEID")
	  REFERENCES "PROPERTY_TYPE" ("PROPERTYTYPEID") ENABLE;
  ALTER TABLE "PROPERTY" ADD CONSTRAINT "FK_PROPERTY_LOCATION" FOREIGN KEY ("LOCATIONID")
	  REFERENCES "LOCATION_TBL" ("LOCATIONID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROPERTY_FEATURE
--------------------------------------------------------

  ALTER TABLE "PROPERTY_FEATURE" ADD CONSTRAINT "FK_FEATURE_PROPERTY" FOREIGN KEY ("PROPERTYID")
	  REFERENCES "PROPERTY" ("PROPERTYID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRANSACTION_TBL
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "FK_TRANSACTION_PROPERTY" FOREIGN KEY ("PROPERTYID")
	  REFERENCES "PROPERTY" ("PROPERTYID") ENABLE;
  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "FK_TRANSACTION_CLIENT" FOREIGN KEY ("CLIENTID")
	  REFERENCES "CLIENT" ("CLIENTID") ENABLE;
  ALTER TABLE "TRANSACTION_TBL" ADD CONSTRAINT "FK_TRANSACTION_AGENT" FOREIGN KEY ("AGENTID")
	  REFERENCES "AGENT" ("AGENTID") ENABLE;
