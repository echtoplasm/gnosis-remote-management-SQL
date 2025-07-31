# Gnosis Remote Systems Monitoring Database
## Multi-Tenant SaaS Database Design for Valar Data

### 🎯 Overview
Comprehensive database design for a cybersecurity monitoring platform serving multiple client organizations with strict data isolation and enterprise-grade security. Built as a final project demonstrating advanced database administration concepts and modern deployment practices.

### 🏗️ Architecture Highlights
- **Multi-tenant SaaS architecture** with application-level row security
- **Docker containerization** for consistent cross-platform deployment
- **Automated container status management** via database triggers
- **Enterprise CVE vulnerability analysis** with company-scoped findings
- **Complete audit trails** for regulatory compliance
- **Advanced access control** with three-tier user architecture

### 🛠️ Technologies
- **Database**: MariaDB 11.8.2 / MySQL 8.0
- **Containerization**: Docker & Docker Compose
- **Administration**: phpMyAdmin web interface
- **Development**: Advanced SQL procedures, triggers, and views
- **Deployment**: Cross-platform (Arch Linux → Ubuntu production)

### 📁 Project Structure
```
├── documentation/           # Complete project documentation (PDF)
├── sql-scripts/
│   ├── create-db-scripts/   # Database schema and data population
│   ├── accounts.sql         # Three-tier user account management
│   ├── docker-deployment/   # Container deployment configuration
│   └── test-results/        # Query execution results and testing
└── diagrams/                # Entity Relationship Diagrams
```

### 🚀 Quick Start

#### Prerequisites
- Docker and Docker Compose
- Git

#### Deployment
```bash
# Clone the repository
git clone [your-repo-url]
cd gnosis-database

# Deploy with Docker
cd sql-scripts/docker-deployment
docker-compose up -d

# Access phpMyAdmin
# URL: http://localhost
# Username: marklocklear
# Password: gnosis:eval:abt,-2025
# Database: gnosis_management
```

#### Manual Setup
```bash
# Create database and import schema
mysql -u root -p < sql-scripts/create-db-scripts/gnosis_createdb.sql

# Create user accounts
mysql -u root -p < sql-scripts/accounts.sql
```

### 🔐 Database Features
- **10 core entities** supporting comprehensive infrastructure monitoring
- **Multi-tenant data isolation** via `accessible_by` fields
- **Automated triggers** for real-time container status updates
- **Advanced views** for administrative activity monitoring
- **Comprehensive constraints** including CHECK constraints for data validation
- **CVE vulnerability tracking** with company-specific analysis

### 🏢 Business Context
Gnosis serves as a remote systems monitoring platform for cybersecurity firms managing distributed infrastructure. The system supports:
- Remote server monitoring with performance metrics
- Docker container management and oversight
- CVE vulnerability analysis and reporting
- SSH session auditing and compliance
- Multi-tenant SaaS operations

### 🧪 Testing
Comprehensive test suite included with results:
- Multi-tenant isolation validation
- Trigger functionality verification
- Access control enforcement testing
- Foreign key relationship validation

### 📊 Database Schema
The database implements a sophisticated multi-tenant architecture with:
- **Companies**: Central tenant management
- **Users/Admins**: Role-based access control
- **Remote Servers**: Infrastructure inventory
- **Docker Containers**: Application environment tracking
- **CVE Analysis**: Security vulnerability management
- **Audit Logging**: Complete activity trails

### 🎓 Academic Context
Database Administration (DBA210) Final Project  
**Key Learning Objectives Demonstrated:**
- Advanced database design and normalization
- Multi-tenant architecture implementation
- Modern deployment strategies (traditional LAMP vs containerization)
- Enterprise security and access control
- Database automation and triggers

### 🐧 Platform Notes
Developed on Arch Linux, deployed to Ubuntu production environment via Docker for consistent cross-platform compatibility.


