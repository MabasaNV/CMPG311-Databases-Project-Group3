KEYSPACE REAL ESTATE - FRONTEND APPLICATION
NWU CMPG 311 - Group 3 Database Systems Project
============================================

CONTENTS:
---------
1. index.html - Main HTML file
2. styles.css - All CSS styles
3. script.js  - JavaScript functionality
4. README.txt - This file

FEATURES:
---------
✅ Property Listings with search and filters
✅ Agent Directory
✅ Branch Locations
✅ Saved Properties (uses localStorage)
✅ Property Details Modal
✅ Inquiry Form
✅ Responsive Design (Mobile + Desktop)
✅ Hero Section with Call-to-Action
✅ Featured Properties
✅ Client Testimonials
✅ Newsletter Subscription
✅ Back-to-Top Button
✅ No external dependencies (except icons CDN)

HOW TO USE:
-----------
METHOD 1: Double-Click (Recommended)
1. Extract all files to a folder
2. Double-click "index.html"
3. It will open in your default browser
4. ✅ DONE! The website is running

METHOD 2: VS Code Live Server
1. Open the folder in VS Code
2. Right-click on "index.html"
3. Select "Open with Live Server"
4. The website will open in your browser

METHOD 3: Any Web Server
1. Place files in your web server directory
2. Access via localhost or your server URL

DATABASE DESIGN:
----------------
This frontend is based on your CMPG_311_Phase_2_Final.pdf:
- BRANCH (Branches across SA)
- AGENT (Real estate agents)
- PROPERTY (Property listings)
- LOCATION (Geographic data)
- PROPERTY_TYPE (Residential, Commercial, etc.)
- CLIENT (via Inquiry Form)
- INQUIRY (Contact forms)
- TRANSACTION (Simulated)
- CLIENT_SAVED_PROPERTY (Favorites feature)

MOCK DATA:
----------
- 8 Properties (Johannesburg, Cape Town, Pretoria)
- 4 Agents
- 3 Branches
- 5 Locations
- 4 Property Types
- All images from Unsplash (online, no download needed)

BROWSER COMPATIBILITY:
---------------------
✅ Chrome (Recommended)
✅ Firefox
✅ Edge
✅ Safari
⚠️  Requires internet connection for:
    - Lucide Icons (CDN)
    - Property Images (Unsplash)

FEATURES IN DETAIL:
-------------------
1. Properties View:
   - Hero banner with stats
   - Featured properties section
   - Why choose us section
   - Stats bar
   - Client testimonials
   - Advanced search filters
   - Grid of all properties
   - Newsletter signup

2. Agents View:
   - All 4 agents with contact info
   - Active listing counts
   - Branch associations

3. Branches View:
   - 3 branches across SA
   - Contact details
   - Agent counts per branch

4. Saved Properties:
   - Click heart icon to save
   - Persists in browser localStorage
   - View all saved in one place

5. Property Details Modal:
   - Large images
   - Full specifications
   - Agent contact card
   - Save/Share buttons
   - Inquiry form
   - Schedule viewing button

6. Mobile Responsive:
   - Hamburger menu on mobile
   - Touch-friendly buttons
   - Responsive grid layouts

CUSTOMIZATION:
--------------
To change colors, edit the :root variables in styles.css:
--primary-color: #2563eb;  (Blue)
--success-color: #10b981;  (Green)
--danger-color: #ef4444;   (Red)
etc.

To add more properties, edit the mockData.properties array in script.js

TROUBLESHOOTING:
----------------
Q: Icons not showing?
A: Check internet connection (icons load from CDN)

Q: Images not loading?
A: Check internet connection (images from Unsplash)

Q: Saved properties disappear?
A: Don't clear browser cache/localStorage

Q: Not working in VS Code?
A: Use Live Server extension or double-click HTML file

SUBMISSION:
-----------
For your NWU CMPG 311 project submission:
1. Include all 3 files (HTML, CSS, JS)
2. Include this README
3. Optionally: Take screenshots
4. Mention it works without installation

CREDITS:
--------
- NWU CMPG 311 - Group 3
- Database Design: Phase 2 Final
- Images: Unsplash
- Icons: Lucide
- Year: 2026

SUPPORT:
--------
If you have issues:
1. Make sure all files are in the same folder
2. Check browser console for errors (F12)
3. Try a different browser
4. Ensure internet connection

© 2026 KEYSPACE Real Estate
All Rights Reserved
