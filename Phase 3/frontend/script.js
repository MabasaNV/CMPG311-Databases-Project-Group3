// KEYSPACE Real Estate - JavaScript

// Mock Data
const mockData = {
    branches: [
        { BranchID: 1, BranchName: 'KeySpace Johannesburg North', City: 'Johannesburg', Province: 'Gauteng', ContactNumber: '011-234-5678', Email: 'jhb.north@keyspace.co.za' },
        { BranchID: 2, BranchName: 'KeySpace Cape Town Central', City: 'Cape Town', Province: 'Western Cape', ContactNumber: '021-345-6789', Email: 'cpt.central@keyspace.co.za' },
        { BranchID: 3, BranchName: 'KeySpace Pretoria East', City: 'Pretoria', Province: 'Gauteng', ContactNumber: '012-456-7890', Email: 'pta.east@keyspace.co.za' }
    ],
    
    agents: [
        { AgentID: 1, BranchID: 1, FirstName: 'Thabo', LastName: 'Mabaso', ContactNumber: '082-123-4567', Email: 'thabo.mabaso@keyspace.co.za', Region: 'Sandton', ActiveListingCount: 12 },
        { AgentID: 2, BranchID: 1, FirstName: 'Sarah', LastName: 'Van Der Merwe', ContactNumber: '083-234-5678', Email: 'sarah.vdm@keyspace.co.za', Region: 'Rosebank', ActiveListingCount: 8 },
        { AgentID: 3, BranchID: 2, FirstName: 'Michael', LastName: 'Ndlovu', ContactNumber: '084-345-6789', Email: 'michael.ndlovu@keyspace.co.za', Region: 'Camps Bay', ActiveListingCount: 15 },
        { AgentID: 4, BranchID: 3, FirstName: 'Jessica', LastName: 'Botha', ContactNumber: '081-456-7890', Email: 'jessica.botha@keyspace.co.za', Region: 'Centurion', ActiveListingCount: 10 }
    ],
    
    locations: [
        { LocationID: 1, PostalCode: 2196, City: 'Johannesburg', Province: 'Gauteng' },
        { LocationID: 2, PostalCode: 2146, City: 'Johannesburg', Province: 'Gauteng' },
        { LocationID: 3, PostalCode: 8005, City: 'Cape Town', Province: 'Western Cape' },
        { LocationID: 4, PostalCode: 157, City: 'Centurion', Province: 'Gauteng' },
        { LocationID: 5, PostalCode: 2191, City: 'Johannesburg', Province: 'Gauteng' }
    ],
    
    propertyTypes: [
        { PropertyTypeID: 1, TypeName: 'Residential', Description: 'Houses, apartments, and townhouses for living' },
        { PropertyTypeID: 2, TypeName: 'Commercial', Description: 'Office spaces, retail units, and business premises' },
        { PropertyTypeID: 3, TypeName: 'Industrial', Description: 'Warehouses, factories, and industrial parks' },
        { PropertyTypeID: 4, TypeName: 'Land', Description: 'Vacant land and development sites' }
    ],
    
    properties: [
        {
            PropertyID: 1,
            AgentID: 1,
            PropertyTypeID: 1,
            LocationID: 1,
            Street: '45 Rivonia Road',
            Title: 'Luxurious 4-Bed Villa in Sandton',
            Price: 8500000,
            Size_sqm: 450,
            Bedrooms: '4',
            Bathrooms: '3.5',
            Status: 'available',
            ListingDate: '2026-04-15',
            imageUrl: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
            features: ['Swimming Pool', 'Garden', 'Double Garage', 'Security System', 'Air Conditioning']
        },
        {
            PropertyID: 2,
            AgentID: 2,
            PropertyTypeID: 1,
            LocationID: 2,
            Street: '12 Oxford Road',
            Title: 'Modern 2-Bed Apartment in Rosebank',
            Price: 2750000,
            Size_sqm: 120,
            Bedrooms: '2',
            Bathrooms: '2',
            Status: 'available',
            ListingDate: '2026-05-01',
            imageUrl: 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800',
            features: ['Balcony', 'Secure Parking', '24/7 Security', 'Gym Access']
        },
        {
            PropertyID: 3,
            AgentID: 3,
            PropertyTypeID: 1,
            LocationID: 3,
            Street: '88 Victoria Road',
            Title: 'Stunning 5-Bed Home with Ocean Views',
            Price: 15500000,
            Size_sqm: 600,
            Bedrooms: '5',
            Bathrooms: '4',
            Status: 'available',
            ListingDate: '2026-03-20',
            imageUrl: 'https://images.unsplash.com/photo-1613977257363-707ba9348227?w=800',
            features: ['Ocean View', 'Swimming Pool', 'Wine Cellar', 'Home Cinema', 'Triple Garage']
        },
        {
            PropertyID: 4,
            AgentID: 4,
            PropertyTypeID: 1,
            LocationID: 4,
            Street: '23 Lenchen Avenue',
            Title: 'Spacious 3-Bed Family Home in Centurion',
            Price: 3200000,
            Size_sqm: 280,
            Bedrooms: '3',
            Bathrooms: '2',
            Status: 'available',
            ListingDate: '2026-04-28',
            imageUrl: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800',
            features: ['Garden', 'Garage', 'Security System', 'Study Room']
        },
        {
            PropertyID: 5,
            AgentID: 1,
            PropertyTypeID: 2,
            LocationID: 1,
            Street: '150 West Street',
            Title: 'Premium Office Space in Sandton CBD',
            Price: 12000000,
            Size_sqm: 850,
            Bedrooms: 'N/A',
            Bathrooms: '6',
            Status: 'available',
            ListingDate: '2026-05-05',
            imageUrl: 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800',
            features: ['Boardroom', 'Kitchen', 'Covered Parking', 'Backup Power', 'Reception Area']
        },
        {
            PropertyID: 6,
            AgentID: 2,
            PropertyTypeID: 1,
            LocationID: 5,
            Street: '67 Jan Smuts Avenue',
            Title: 'Elegant 3-Bed Penthouse',
            Price: 5800000,
            Size_sqm: 220,
            Bedrooms: '3',
            Bathrooms: '2.5',
            Status: 'available',
            ListingDate: '2026-04-10',
            imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
            features: ['Rooftop Terrace', 'City Views', 'Concierge', 'Underground Parking']
        },
        {
            PropertyID: 7,
            AgentID: 3,
            PropertyTypeID: 1,
            LocationID: 3,
            Street: '34 Camps Bay Drive',
            Title: 'Contemporary Beach House',
            Price: 22000000,
            Size_sqm: 750,
            Bedrooms: '6',
            Bathrooms: '5',
            Status: 'sold',
            ListingDate: '2026-02-14',
            imageUrl: 'https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?w=800',
            features: ['Beach Access', 'Infinity Pool', 'Entertainment Area', 'Staff Quarters']
        },
        {
            PropertyID: 8,
            AgentID: 4,
            PropertyTypeID: 1,
            LocationID: 4,
            Street: '91 Sable Road',
            Title: 'Charming Starter Home',
            Price: 1850000,
            Size_sqm: 150,
            Bedrooms: '2',
            Bathrooms: '1',
            Status: 'available',
            ListingDate: '2026-05-08',
            imageUrl: 'https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=800',
            features: ['Garden', 'Carport', 'Patio']
        }
    ]
};

// State
let currentView = 'properties';
let savedProperties = JSON.parse(localStorage.getItem('savedProperties') || '[]');
let filters = {
    search: '',
    type: '',
    location: '',
    minPrice: '',
    maxPrice: '',
    status: ''
};

// Helper Functions
function formatPrice(price) {
    return 'R ' + price.toLocaleString();
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-ZA', { year: 'numeric', month: 'long', day: 'numeric' });
}

function getAgent(agentId) {
    return mockData.agents.find(a => a.AgentID === agentId);
}

function getLocation(locationId) {
    return mockData.locations.find(l => l.LocationID === locationId);
}

function getPropertyType(typeId) {
    return mockData.propertyTypes.find(t => t.PropertyTypeID === typeId);
}

function getBranch(branchId) {
    return mockData.branches.find(b => b.BranchID === branchId);
}

// Save/Unsave Property
function toggleSaveProperty(propertyId) {
    const index = savedProperties.indexOf(propertyId);
    if (index > -1) {
        savedProperties.splice(index, 1);
    } else {
        savedProperties.push(propertyId);
    }
    localStorage.setItem('savedProperties', JSON.stringify(savedProperties));
}

function isPropertySaved(propertyId) {
    return savedProperties.includes(propertyId);
}

// Filter Properties
function filterProperties() {
    return mockData.properties.filter(property => {
        const matchesSearch = !filters.search || 
            property.Title.toLowerCase().includes(filters.search.toLowerCase()) ||
            property.Street.toLowerCase().includes(filters.search.toLowerCase());
        
        const matchesType = !filters.type || property.PropertyTypeID.toString() === filters.type;
        const matchesLocation = !filters.location || property.LocationID.toString() === filters.location;
        const matchesMinPrice = !filters.minPrice || property.Price >= parseFloat(filters.minPrice);
        const matchesMaxPrice = !filters.maxPrice || property.Price <= parseFloat(filters.maxPrice);
        const matchesStatus = !filters.status || property.Status === filters.status;
        
        return matchesSearch && matchesType && matchesLocation && 
               matchesMinPrice && matchesMaxPrice && matchesStatus;
    });
}

// Navigation
function showView(view) {
    currentView = view;
    
    // Update nav buttons
    document.querySelectorAll('.nav-btn, .mobile-nav-btn').forEach(btn => {
        btn.classList.remove('active');
        if (btn.dataset.view === view) {
            btn.classList.add('active');
        }
    });
    
    // Close mobile menu
    toggleMobileMenu(false);
    
    // Render view
    renderView();
    
    // Scroll to top
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Mobile Menu
function toggleMobileMenu(force) {
    const menu = document.getElementById('mobileMenu');
    if (force === false) {
        menu.classList.remove('active');
    } else {
        menu.classList.toggle('active');
    }
}

// Property Card HTML
function createPropertyCard(property) {
    const agent = getAgent(property.AgentID);
    const location = getLocation(property.LocationID);
    
    return `
        <div class="card property-card" onclick="openPropertyModal(${property.PropertyID})">
            <div style="position: relative;">
                <img src="${property.imageUrl}" alt="${property.Title}" class="property-image">
                <div class="property-status status-${property.Status}">
                    ${property.Status.charAt(0).toUpperCase() + property.Status.slice(1)}
                </div>
            </div>
            <div class="card-content">
                <h3 class="property-title">${property.Title}</h3>
                <div class="property-location">
                    <i data-lucide="map-pin"></i>
                    <span>${property.Street}, ${location.City}</span>
                </div>
                <div class="property-details">
                    <div class="property-features">
                        ${property.Bedrooms !== 'N/A' ? `
                            <div class="property-feature">
                                <i data-lucide="bed"></i>
                                <span>${property.Bedrooms}</span>
                            </div>
                        ` : ''}
                        <div class="property-feature">
                            <i data-lucide="bath"></i>
                            <span>${property.Bathrooms}</span>
                        </div>
                        <div class="property-feature">
                            <i data-lucide="maximize"></i>
                            <span>${property.Size_sqm}m²</span>
                        </div>
                    </div>
                </div>
                <div class="property-footer">
                    <div class="property-price">${formatPrice(property.Price)}</div>
                    ${agent ? `
                        <div class="property-agent">
                            <i data-lucide="user"></i>
                            <span>${agent.FirstName} ${agent.LastName}</span>
                        </div>
                    ` : ''}
                </div>
            </div>
        </div>
    `;
}

// Agent Card HTML
function createAgentCard(agent) {
    const branch = getBranch(agent.BranchID);
    
    return `
        <div class="agent-card">
            <div class="agent-header">
                <div class="agent-avatar">
                    ${agent.FirstName[0]}${agent.LastName[0]}
                </div>
                <div class="agent-info">
                    <h3>${agent.FirstName} ${agent.LastName}</h3>
                    <p class="agent-region">${agent.Region} Specialist</p>
                </div>
            </div>
            <div class="agent-contacts">
                <div class="agent-contact">
                    <i data-lucide="phone"></i>
                    <span>${agent.ContactNumber}</span>
                </div>
                <div class="agent-contact">
                    <i data-lucide="mail"></i>
                    <span>${agent.Email}</span>
                </div>
                ${branch ? `
                    <div class="agent-contact">
                        <i data-lucide="building-2"></i>
                        <span>${branch.BranchName}</span>
                    </div>
                ` : ''}
            </div>
            <div class="agent-footer">
                <div class="agent-listings">
                    <span>Active Listings</span>
                    <span>${agent.ActiveListingCount}</span>
                </div>
                <button class="btn-contact">Contact Agent</button>
            </div>
        </div>
    `;
}

// Branch Card HTML
function createBranchCard(branch) {
    const branchAgents = mockData.agents.filter(a => a.BranchID === branch.BranchID);
    const totalListings = branchAgents.reduce((sum, agent) => sum + agent.ActiveListingCount, 0);
    
    return `
        <div class="card">
            <div class="branch-header">
                <h3>${branch.BranchName}</h3>
                <div class="branch-location">
                    <i data-lucide="map-pin"></i>
                    <span>${branch.City}, ${branch.Province}</span>
                </div>
            </div>
            <div class="branch-content">
                <div class="branch-contacts">
                    <div class="branch-contact">
                        <div class="branch-contact-icon">
                            <i data-lucide="phone"></i>
                        </div>
                        <div class="branch-contact-info">
                            <p>Phone</p>
                            <p>${branch.ContactNumber}</p>
                        </div>
                    </div>
                    <div class="branch-contact">
                        <div class="branch-contact-icon">
                            <i data-lucide="mail"></i>
                        </div>
                        <div class="branch-contact-info">
                            <p>Email</p>
                            <p>${branch.Email}</p>
                        </div>
                    </div>
                </div>
                <div class="branch-stats">
                    <div class="branch-stat">
                        <div class="branch-stat-icon">
                            <i data-lucide="users"></i>
                        </div>
                        <div class="branch-stat-value">${branchAgents.length}</div>
                        <div class="branch-stat-label">Agents</div>
                    </div>
                    <div class="branch-stat">
                        <div class="branch-stat-value">${totalListings}</div>
                        <div class="branch-stat-label">Total Listings</div>
                    </div>
                </div>
                <button class="btn-contact">View Branch</button>
            </div>
        </div>
    `;
}

// Render View
function renderView() {
    const mainContent = document.getElementById('mainContent');
    
    switch(currentView) {
        case 'properties':
            renderPropertiesView();
            break;
        case 'agents':
            renderAgentsView();
            break;
        case 'branches':
            renderBranchesView();
            break;
        case 'saved':
            renderSavedView();
            break;
    }
    
    lucide.createIcons();
}

// Properties View
function renderPropertiesView() {
    const availableProperties = mockData.properties.filter(p => p.Status === 'available');
    const filteredProps = filterProperties();
    
    const html = `
        ${renderHeroSection()}
        ${renderFeaturedSection(availableProperties.slice(0, 3))}
        ${renderWhyChooseUs()}
        ${renderStatsBar()}
        ${renderTestimonials()}
        
        <div class="section">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Search All Properties</h2>
                    <p class="section-subtitle">Browse through our extensive collection of premium properties</p>
                </div>
                
                ${renderStats()}
                ${renderSearchFilters()}
                
                <div class="results-count">
                    Showing <span>${filteredProps.length}</span> properties
                </div>
                
                ${filteredProps.length > 0 ? `
                    <div class="grid grid-cols-3">
                        ${filteredProps.map(p => createPropertyCard(p)).join('')}
                    </div>
                ` : `
                    <div class="empty-state">
                        <p>No properties found matching your criteria.</p>
                        <button class="btn-clear-filters" onclick="clearFilters()">Clear Filters</button>
                    </div>
                `}
            </div>
        </div>
        
        ${renderNewsletter()}
    `;
    
    document.getElementById('mainContent').innerHTML = html;
}

// Hero Section
function renderHeroSection() {
    return `
        <div class="hero">
            <div class="hero-bg"></div>
            <div class="container">
                <div class="hero-content">
                    <div>
                        <div class="hero-badge">
                            🏆 South Africa's Leading Real Estate Platform
                        </div>
                        <h1>Discover Your Perfect Home with KEYSPACE</h1>
                        <p>Browse premium properties across Johannesburg, Cape Town, and Pretoria. Find your dream home with our expert agents.</p>
                        
                        <div class="hero-buttons">
                            <button class="hero-btn-primary" onclick="scrollToSearch()">
                                <i data-lucide="search"></i>
                                <span>Search Properties</span>
                            </button>
                            <button class="hero-btn-secondary">
                                View All Listings
                            </button>
                        </div>
                        
                        <div class="hero-stats">
                            <div class="hero-stat">
                                <div class="hero-stat-label">
                                    <i data-lucide="trending-up"></i>
                                    <span>Success Rate</span>
                                </div>
                                <div class="hero-stat-value">98%</div>
                            </div>
                            <div class="hero-stat">
                                <div class="hero-stat-label">
                                    <i data-lucide="award"></i>
                                    <span>Properties</span>
                                </div>
                                <div class="hero-stat-value">500+</div>
                            </div>
                            <div class="hero-stat">
                                <div class="hero-stat-label">
                                    <i data-lucide="shield"></i>
                                    <span>Secure</span>
                                </div>
                                <div class="hero-stat-value">100%</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="hero-image">
                        <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800" alt="Luxury Home">
                        <div class="hero-featured-card">
                            <p>Featured Property</p>
                            <p>R 8,500,000</p>
                            <p>Luxurious Villa in Sandton</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
}

// Featured Section
function renderFeaturedSection(properties) {
    return `
        <div class="section" style="background: white;">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Featured Properties</h2>
                    <p class="section-subtitle">Handpicked premium properties just for you</p>
                </div>
                <div class="grid grid-cols-3">
                    ${properties.map(p => createPropertyCard(p)).join('')}
                </div>
            </div>
        </div>
    `;
}

// Why Choose Us
function renderWhyChooseUs() {
    const features = [
        { icon: 'shield', title: 'Trusted & Secure', desc: 'All transactions protected with industry-leading security', color: 'blue' },
        { icon: 'users', title: 'Expert Agents', desc: 'Professional agents with deep local market knowledge', color: 'green' },
        { icon: 'trending-up', title: 'Best Prices', desc: 'Competitive pricing and great value for investment', color: 'purple' },
        { icon: 'award', title: 'Award Winning', desc: "South Africa's leading real estate platform", color: 'orange' },
        { icon: 'clock', title: '24/7 Support', desc: 'Round-the-clock customer support for all needs', color: 'red' },
        { icon: 'check-circle', title: 'Verified Listings', desc: 'Every property is verified and quality-checked', color: 'teal' }
    ];
    
    return `
        <div class="section" style="background: var(--bg-color);">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Why Choose KEYSPACE?</h2>
                    <p class="section-subtitle">Making your property journey seamless, secure, and successful</p>
                </div>
                <div class="features-grid">
                    ${features.map(f => `
                        <div class="feature-card">
                            <div class="feature-icon ${f.color}">
                                <i data-lucide="${f.icon}"></i>
                            </div>
                            <h3>${f.title}</h3>
                            <p>${f.desc}</p>
                        </div>
                    `).join('')}
                </div>
            </div>
        </div>
    `;
}

// Stats Bar
function renderStatsBar() {
    return `
        <div class="stats-bar">
            <div class="container">
                <div class="stats-bar-grid">
                    <div class="stats-bar-item">
                        <div class="stats-bar-icon green">
                            <i data-lucide="trending-up"></i>
                        </div>
                        <div class="stats-bar-content">
                            <div class="stats-bar-value">2,500+</div>
                            <div class="stats-bar-label">Properties Sold</div>
                        </div>
                    </div>
                    <div class="stats-bar-item">
                        <div class="stats-bar-icon blue">
                            <i data-lucide="map-pin"></i>
                        </div>
                        <div class="stats-bar-content">
                            <div class="stats-bar-value">15</div>
                            <div class="stats-bar-label">Cities Covered</div>
                        </div>
                    </div>
                    <div class="stats-bar-item">
                        <div class="stats-bar-icon purple">
                            <i data-lucide="award"></i>
                        </div>
                        <div class="stats-bar-content">
                            <div class="stats-bar-value">10+</div>
                            <div class="stats-bar-label">Years Experience</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
}

// Testimonials
function renderTestimonials() {
    const testimonials = [
        { name: 'Sipho Mthembu', role: 'Property Buyer', location: 'Sandton, Johannesburg', rating: 5, text: 'KEYSPACE made finding my dream home effortless. The agents were professional and the process was smooth from start to finish.', image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150' },
        { name: 'Thandiwe Ndlovu', role: 'First-Time Buyer', location: 'Cape Town', rating: 5, text: 'As a first-time buyer, I was nervous about the process. The team at KEYSPACE guided me every step of the way. Highly recommended!', image: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150' },
        { name: 'Johan van der Berg', role: 'Property Investor', location: 'Pretoria', rating: 5, text: "I've purchased multiple properties through KEYSPACE. Their market knowledge and professionalism are unmatched in South Africa.", image: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150' }
    ];
    
    return `
        <div class="section" style="background: white;">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">What Our Clients Say</h2>
                    <p class="section-subtitle">Don't just take our word for it - hear from our happy clients</p>
                </div>
                <div class="testimonials-grid">
                    ${testimonials.map(t => `
                        <div class="testimonial-card">
                            <i data-lucide="quote" class="quote-icon"></i>
                            <div class="testimonial-header">
                                <img src="${t.image}" alt="${t.name}" class="testimonial-avatar">
                                <div class="testimonial-info">
                                    <h4>${t.name}</h4>
                                    <p>${t.role}</p>
                                    <p>${t.location}</p>
                                </div>
                            </div>
                            <div class="testimonial-rating">
                                ${Array(t.rating).fill('<i data-lucide="star"></i>').join('')}
                            </div>
                            <p class="testimonial-text">"${t.text}"</p>
                        </div>
                    `).join('')}
                </div>
            </div>
        </div>
    `;
}

// Newsletter
function renderNewsletter() {
    return `
        <div class="newsletter">
            <div class="container">
                <div class="newsletter-content">
                    <div class="newsletter-text">
                        <div class="newsletter-header">
                            <div class="newsletter-icon">
                                <i data-lucide="mail"></i>
                            </div>
                            <h2>Stay Updated</h2>
                        </div>
                        <p>Subscribe to our newsletter and get the latest property listings, market insights, and exclusive deals.</p>
                    </div>
                    <form class="newsletter-form" onsubmit="handleNewsletterSubmit(event)">
                        <input type="email" placeholder="Enter your email address" required>
                        <button type="submit">
                            <i data-lucide="send"></i>
                            <span>Subscribe</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    `;
}

// Stats
function renderStats() {
    const stats = [
        { icon: 'home', label: 'Properties Listed', value: mockData.properties.length, color: 'blue' },
        { icon: 'trending-up', label: 'Active Listings', value: mockData.properties.filter(p => p.Status === 'available').length, color: 'green' },
        { icon: 'users', label: 'Expert Agents', value: mockData.agents.length, color: 'purple' },
        { icon: 'award', label: 'Branches', value: mockData.branches.length, color: 'orange' }
    ];
    
    return `
        <div class="stats-grid">
            ${stats.map(s => `
                <div class="stat-card">
                    <div class="stat-content">
                        <div class="stat-icon ${s.color}">
                            <i data-lucide="${s.icon}"></i>
                        </div>
                        <div>
                            <div class="stat-value">${s.value}</div>
                            <div class="stat-label">${s.label}</div>
                        </div>
                    </div>
                </div>
            `).join('')}
        </div>
    `;
}

// Search Filters
function renderSearchFilters() {
    return `
        <div class="search-filters">
            <div class="filters-header">
                <i data-lucide="sliders-horizontal"></i>
                <h2>Search & Filter Properties</h2>
            </div>
            <div class="filters-grid">
                <div class="filter-group search-input-wrapper" style="grid-column: 1 / -1;">
                    <div class="search-icon">
                        <i data-lucide="search"></i>
                    </div>
                    <input type="text" placeholder="Search properties..." value="${filters.search}" oninput="updateFilter('search', this.value)">
                </div>
                <div class="filter-group">
                    <label>Property Type</label>
                    <select value="${filters.type}" onchange="updateFilter('type', this.value)">
                        <option value="">All Types</option>
                        ${mockData.propertyTypes.map(t => `
                            <option value="${t.PropertyTypeID}" ${filters.type == t.PropertyTypeID ? 'selected' : ''}>
                                ${t.TypeName}
                            </option>
                        `).join('')}
                    </select>
                </div>
                <div class="filter-group">
                    <label>Location</label>
                    <select value="${filters.location}" onchange="updateFilter('location', this.value)">
                        <option value="">All Locations</option>
                        ${mockData.locations.map(l => `
                            <option value="${l.LocationID}" ${filters.location == l.LocationID ? 'selected' : ''}>
                                ${l.City}, ${l.Province}
                            </option>
                        `).join('')}
                    </select>
                </div>
                <div class="filter-group">
                    <label>Status</label>
                    <select value="${filters.status}" onchange="updateFilter('status', this.value)">
                        <option value="">All Status</option>
                        <option value="available" ${filters.status === 'available' ? 'selected' : ''}>Available</option>
                        <option value="sold" ${filters.status === 'sold' ? 'selected' : ''}>Sold</option>
                        <option value="rented" ${filters.status === 'rented' ? 'selected' : ''}>Rented</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Min Price (R)</label>
                    <input type="number" placeholder="0" value="${filters.minPrice}" oninput="updateFilter('minPrice', this.value)">
                </div>
                <div class="filter-group">
                    <label>Max Price (R)</label>
                    <input type="number" placeholder="No limit" value="${filters.maxPrice}" oninput="updateFilter('maxPrice', this.value)">
                </div>
            </div>
        </div>
    `;
}

// Update Filter
function updateFilter(key, value) {
    filters[key] = value;
    renderView();
}

// Clear Filters
function clearFilters() {
    filters = {
        search: '',
        type: '',
        location: '',
        minPrice: '',
        maxPrice: '',
        status: ''
    };
    renderView();
}

// Scroll to Search
function scrollToSearch() {
    const section = document.querySelector('.search-filters');
    if (section) {
        section.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
}

// Agents View
function renderAgentsView() {
    const html = `
        <div class="section">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Meet Our Expert Agents</h2>
                    <p class="section-subtitle">Connect with our professional real estate agents</p>
                </div>
                <div class="grid grid-cols-3">
                    ${mockData.agents.map(a => createAgentCard(a)).join('')}
                </div>
            </div>
        </div>
    `;
    
    document.getElementById('mainContent').innerHTML = html;
}

// Branches View
function renderBranchesView() {
    const html = `
        <div class="section">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Our Branches</h2>
                    <p class="section-subtitle">Visit our branches across South Africa</p>
                </div>
                <div class="grid grid-cols-3">
                    ${mockData.branches.map(b => createBranchCard(b)).join('')}
                </div>
            </div>
        </div>
    `;
    
    document.getElementById('mainContent').innerHTML = html;
}

// Saved View
function renderSavedView() {
    const savedProps = mockData.properties.filter(p => savedProperties.includes(p.PropertyID));
    
    const html = `
        <div class="section">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Saved Properties</h2>
                    <p class="section-subtitle">Your favorite properties - ${savedProps.length} saved</p>
                </div>
                ${savedProps.length > 0 ? `
                    <div class="grid grid-cols-3">
                        ${savedProps.map(p => createPropertyCard(p)).join('')}
                    </div>
                ` : `
                    <div class="empty-state">
                        <p>You haven't saved any properties yet.</p>
                        <button class="btn-primary" onclick="showView('properties')">Browse Properties</button>
                    </div>
                `}
            </div>
        </div>
    `;
    
    document.getElementById('mainContent').innerHTML = html;
}

// Property Modal
function openPropertyModal(propertyId) {
    const property = mockData.properties.find(p => p.PropertyID === propertyId);
    if (!property) return;
    
    const agent = getAgent(property.AgentID);
    const location = getLocation(property.LocationID);
    const type = getPropertyType(property.PropertyTypeID);
    const isSaved = isPropertySaved(propertyId);
    
    const html = `
        <div class="modal-header">
            <h2>${property.Title}</h2>
            <button class="btn-close" onclick="closePropertyModal()">
                <i data-lucide="x"></i>
            </button>
        </div>
        <div class="modal-body">
            <img src="${property.imageUrl}" alt="${property.Title}" class="property-detail-image">
            
            <div class="property-detail-grid">
                <div>
                    <div class="property-detail-header">
                        <div class="property-detail-price">${formatPrice(property.Price)}</div>
                        <div class="property-actions">
                            <button class="btn-action ${isSaved ? 'saved' : ''}" onclick="handleSaveProperty(${propertyId})">
                                <i data-lucide="heart"></i>
                                <span>${isSaved ? 'Saved' : 'Save'}</span>
                            </button>
                            <button class="btn-action">
                                <i data-lucide="share-2"></i>
                                <span>Share</span>
                            </button>
                        </div>
                    </div>
                    
                    <div class="property-detail-location">
                        <i data-lucide="map-pin"></i>
                        <span>${property.Street}, ${location.City}, ${location.Province}</span>
                    </div>
                    
                    <div class="property-specs">
                        ${property.Bedrooms !== 'N/A' ? `
                            <div class="property-spec">
                                <i data-lucide="bed"></i>
                                <div class="property-spec-value">${property.Bedrooms}</div>
                                <div class="property-spec-label">Bedrooms</div>
                            </div>
                        ` : ''}
                        <div class="property-spec">
                            <i data-lucide="bath"></i>
                            <div class="property-spec-value">${property.Bathrooms}</div>
                            <div class="property-spec-label">Bathrooms</div>
                        </div>
                        <div class="property-spec">
                            <i data-lucide="maximize"></i>
                            <div class="property-spec-value">${property.Size_sqm}</div>
                            <div class="property-spec-label">m²</div>
                        </div>
                        <div class="property-spec">
                            <i data-lucide="tag"></i>
                            <div class="property-spec-value" style="font-size: 0.875rem; text-transform: uppercase;">${property.Status}</div>
                            <div class="property-spec-label">Status</div>
                        </div>
                    </div>
                    
                    <div class="property-info">
                        <h4>Property Details</h4>
                        <div class="property-info-grid">
                            <div class="property-info-item">
                                <p>Property Type</p>
                                <p>${type.TypeName}</p>
                            </div>
                            <div class="property-info-item">
                                <p>Listing Date</p>
                                <p>${formatDate(property.ListingDate)}</p>
                            </div>
                            <div class="property-info-item">
                                <p>Postal Code</p>
                                <p>${location.PostalCode}</p>
                            </div>
                            <div class="property-info-item">
                                <p>Property ID</p>
                                <p>KS-${property.PropertyID.toString().padStart(6, '0')}</p>
                            </div>
                        </div>
                    </div>
                    
                    ${property.features && property.features.length > 0 ? `
                        <div class="property-info">
                            <h4>Features & Amenities</h4>
                            <div class="property-features-list">
                                ${property.features.map(f => `
                                    <div class="property-feature-item">
                                        <i data-lucide="check-circle"></i>
                                        <span>${f}</span>
                                    </div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                </div>
                
                <div>
                    ${agent ? `
                        <div class="agent-contact-card">
                            <h4>Contact Agent</h4>
                            <div class="agent-contact-header">
                                <div class="agent-contact-avatar">
                                    ${agent.FirstName[0]}${agent.LastName[0]}
                                </div>
                                <div class="agent-contact-info">
                                    <p>${agent.FirstName} ${agent.LastName}</p>
                                    <p>${agent.Region} Specialist</p>
                                </div>
                            </div>
                            <div class="agent-contact-details">
                                <div class="agent-contact-detail">
                                    <i data-lucide="phone"></i>
                                    <span>${agent.ContactNumber}</span>
                                </div>
                                <div class="agent-contact-detail">
                                    <i data-lucide="mail"></i>
                                    <span>${agent.Email}</span>
                                </div>
                                <div class="agent-contact-detail">
                                    <i data-lucide="user"></i>
                                    <span>${agent.ActiveListingCount} Active Listings</span>
                                </div>
                            </div>
                            <button class="btn-inquiry" onclick="openInquiryModal(${propertyId})">Send Inquiry</button>
                        </div>
                    ` : ''}
                    
                    <div class="viewing-card">
                        <h4>Schedule a Viewing</h4>
                        <p>Interested in this property? Schedule a viewing with our agent today.</p>
                        <button class="btn-viewing">
                            <i data-lucide="calendar"></i>
                            <span>Book Viewing</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    document.getElementById('propertyModalContent').innerHTML = html;
    document.getElementById('propertyModal').classList.add('active');
    lucide.createIcons();
}

function closePropertyModal() {
    document.getElementById('propertyModal').classList.remove('active');
}

function handleSaveProperty(propertyId) {
    toggleSaveProperty(propertyId);
    openPropertyModal(propertyId); // Refresh the modal
}

// Inquiry Modal
function openInquiryModal(propertyId) {
    const property = mockData.properties.find(p => p.PropertyID === propertyId);
    const agent = getAgent(property.AgentID);
    
    const html = `
        <div class="modal-header">
            <h2>Send Inquiry</h2>
            <button class="btn-close" onclick="closeInquiryModal()">
                <i data-lucide="x"></i>
            </button>
        </div>
        <div class="modal-body">
            <div class="inquiry-property-info">
                <p>Property</p>
                <p>${property.Title}</p>
                <p>Agent: ${agent.FirstName} ${agent.LastName}</p>
            </div>
            
            <form class="inquiry-form" onsubmit="handleInquirySubmit(event)">
                <div class="form-group">
                    <label>Full Name *</label>
                    <input type="text" placeholder="Enter your full name" required>
                </div>
                <div class="form-group">
                    <label>Email Address *</label>
                    <input type="email" placeholder="your.email@example.com" required>
                </div>
                <div class="form-group">
                    <label>Phone Number *</label>
                    <input type="tel" placeholder="082 123 4567" required>
                </div>
                <div class="form-group">
                    <label>Inquiry Type *</label>
                    <select required>
                        <option>Viewing Request</option>
                        <option>Price Enquiry</option>
                        <option>General Information</option>
                        <option>Make an Offer</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Message</label>
                    <textarea placeholder="Add any additional information or questions..."></textarea>
                </div>
                <div class="form-actions">
                    <button type="button" class="btn-cancel" onclick="closeInquiryModal()">Cancel</button>
                    <button type="submit" class="btn-submit">
                        <i data-lucide="send"></i>
                        <span>Send Inquiry</span>
                    </button>
                </div>
            </form>
        </div>
    `;
    
    document.getElementById('inquiryModalContent').innerHTML = html;
    document.getElementById('inquiryModal').classList.add('active');
    lucide.createIcons();
}

function closeInquiryModal() {
    document.getElementById('inquiryModal').classList.remove('active');
}

function handleInquirySubmit(event) {
    event.preventDefault();
    alert('Inquiry sent successfully! The agent will contact you soon.');
    closeInquiryModal();
    closePropertyModal();
}

// Newsletter Submit
function handleNewsletterSubmit(event) {
    event.preventDefault();
    const email = event.target.querySelector('input').value;
    alert('Thank you for subscribing! You will receive property updates at ' + email);
    event.target.reset();
}

// Scroll to Top
function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Back to Top Button Visibility
window.addEventListener('scroll', function() {
    const backToTop = document.getElementById('backToTop');
    if (window.scrollY > 300) {
        backToTop.classList.add('visible');
    } else {
        backToTop.classList.remove('visible');
    }
});

// Setup Navigation
document.addEventListener('DOMContentLoaded', function() {
    // Setup nav buttons
    document.querySelectorAll('.nav-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            showView(this.dataset.view);
        });
    });
    
    // Setup mobile nav buttons
    document.querySelectorAll('.mobile-nav-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            showView(this.dataset.view);
        });
    });
    
    // Initial render
    renderView();
});
