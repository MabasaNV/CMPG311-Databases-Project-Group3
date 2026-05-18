# KeySpace Real Estate Property Listing System

**CMPG 311 — Database Systems | Group 3 | North-West University | 2026**

---

## About

KeySpace is a South African real estate agency. This project delivers a relational database system and web application that centralises property listings, manages client and agent interactions, and tracks transactions from listing to sale or rental.

---

## Group Members

| Name | Role |
|------|------|
| Ntshembo Mabasa  | Group Leader — Frontend & Database |
| Mmakoma Boshomane | Frontend |
| Khutso Choshane | Backend |
| Shaun Molewa | Frontend |
| Piet Ribana | Backend |
| Lebogang Motseki | Frontend |
| Madonsela Ronny | Frontend & Database |
| Mongale Kamogelo | Backend & Database |
| Tebogo Morake | Backend & Database |

---

## Tech Stack

| | Technology |
|-|-----------|
| Database | Oracle Database 21c XE |
| Query Tool | Oracle SQL Developer |
| Backend | Python — Flask |
| Templates | HTML5 + Jinja2 |
| Styling | CSS3 |
| Version Control | Git + GitHub |
| IDE | Visual Studio Code |

---

## Repository Structure

```
CMPG311-Databases-Project-Group3/
│
├── Phase 1/
│   └── CMPG311_Phase1 final(updated).pdf
│
├── Phase 2/
│   ├── CMPG 311_Phase 2 Final(1).pdf
│   
│
├── Phase 3/
│   ├── keyspace_oracle_complete.sql
│   ├── keyspace_export.sql
    ├── Database/
    |    ├── Screenshots/
    |    └── Database/
    |         ├── keyspace_oracle_complete.sql
    |         ├── keyspaceDB.sql
    |
│   └── Website/
│       ├── app.py
│       ├── database.py
│       ├── seed.py
│       ├── templates/
│       └── static/
│           └── css/style.css
│       
│
└── Final Report/
    └── CMPG311_Group3_Phase3Final.docx
```

---

## Running the Website Locally

> Requires Python 3.x — download from [python.org](https://python.org) if not installed.

```bash
# 1. Navigate to Website folder
cd "Phase 3/Website"

# 2. Install Flask
pip install flask

# 3. Seed the database — run once only
python seed.py

# 4. Start the app
python app.py
```

Open **http://127.0.0.1:5000** in your browser.

Keep the terminal open while using the website. Press `Ctrl + C` to stop.

---

## Running the Oracle Database

> Requires Oracle Database 21c XE and Oracle SQL Developer installed.

1. Open Oracle SQL Developer
2. Create a connection: `localhost:1521 | SID: xe | user: system`
3. Open `Phase 3/keyspace_oracle_complete.sql`
4. Press **F5** to run the full script
5. Verify with:

```sql
SELECT 'BRANCH' AS T, COUNT(*) FROM BRANCH UNION ALL
SELECT 'AGENT',        COUNT(*) FROM AGENT UNION ALL
SELECT 'PROPERTY',     COUNT(*) FROM PROPERTY UNION ALL
SELECT 'CLIENT',       COUNT(*) FROM CLIENT UNION ALL
SELECT 'INQUIRY',      COUNT(*) FROM INQUIRY UNION ALL
SELECT 'TRANSACTION_TBL', COUNT(*) FROM TRANSACTION_TBL;
```

---

## Test Logins

**Client login** — `/client/login`

| Email | Type |
|-------|------|
| tebogo@email.com | Buyer |
| piet@email.com | Tenant |
| mongale@email.com | Buyer |
| kefilwe@email.com | Buyer |

**Agent login** — `/agent/login`

| Email |
|-------|
| ntshembo@keyspace.co.za |
| mmakoma@keyspace.co.za |
| shaun@keyspace.co.za |
| khutso@keyspace.co.za |
| lebogang@keyspace.co.za |

---

## Git Workflow

### Clone the repo (first time only)

```bash
cd Desktop
git clone https://github.com/YourUsername/CMPG311-Group3-KeySpace.git
cd CMPG311-Group3-KeySpace
code .
```

### Every session

```bash
# Always pull first
git pull origin main

# After your work
git add .
git commit -m "What you did - YourName"
git push origin main
```

### If push is rejected

```bash
git pull origin main --no-rebase
git add .
git commit -m "Merge - YourName"
git push origin main
```

---

## Team Rules

- Always `git pull` before starting work
- Work only in your assigned folder
- Write clear commit messages and include your name
- Message the group after every push
- Never push broken or untested code

---

*North-West University — CMPG 311 — 2026*
