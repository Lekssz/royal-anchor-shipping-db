<h1 align="center">🚢 Royal Anchor Shipping Database</h1>

<p align="center">
  <strong>A complete relational database system for global shipping operations, built with Oracle SQL.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-Oracle%20SQL-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Database-Relational-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Project-Type%20%3A-Portfolio-green?style=for-the-badge" />
</p>

---

# Royal Anchor Shipping Database

A relational database system for managing global shipping operations for the fictional **Royal Anchor Shipping (RAC)** company.

The system models customers, bookings, vessels, routes, containers, goods, port operations, crew structure, and land-based offices. It is built using **Oracle SQL** with full referential integrity, normalized schema design, and validation queries demonstrating key logistics workflows.

---

## 🚢 Main Concepts

### **Customer & Booking Management**
- Customers can make one or more bookings.
- Each booking includes origin/destination ports, booking date, cost, and shipment status.
- Bookings are linked to containers that carry goods.

### **Containers & Cargo**
- Each container has a defined container type with specific dimensions and maximum gross weight.
- Containers belong to a single booking.
- Goods placed in containers are classified using standardized goods types.

### **Vessels, Routes & Scheduling**
- Vessels belong to vessel types that define operational characteristics.
- Routes are composed of multiple ports with a defined sequence (`STOP_ORDER`).
- Vessel schedules assign vessels to routes with start and end dates.
- Port calls record arrival and departure dates for each schedule.

### **Crew & Staffing**
- Departments (Deck, Engineering, Steward, etc.) contain various crew roles.
- Crew members are assigned to vessels and may hold certifications.
- Vessel crew requirements define staffing numbers needed per vessel type.

### **Offices & Land Employees**
- Each port can have offices managed by land-based employees.
- Offices store manager details, address, and contact information.

---

## 📁 Project Structure

```
royal-anchor-shipping-db/
├─ README.md
├─ sql/
│  ├─ create_tables.sql
│  ├─ insert_sample_data.sql
│  └─ validation_queries.sql
└─ docs/
   ├─ ERD.png
   └─ Report.pdf
```

**`sql/create_tables.sql`**  
Full schema including primary keys, foreign keys, check constraints, and structural validation.

**`sql/insert_sample_data.sql`**  
Contains all real sample data used for testing.  
*Note: Sample data is synthetic and provided only for demonstration.*

**`sql/validation_queries.sql`**  
A set of SQL queries validating core system functionality such as cargo tracking, vessel schedules, and port sequencing.

---

## 🗄️ Schema Highlights

Key tables include:

- `Customer`, `Booking`, `Container`, `Goods`
- `Container_Type`, `Goods_Type`
- `Port`, `Route`, `Route_Port`, `Port_Call`
- `Vessel_Type`, `Vessel_Name`, `Vessel_Schedule`
- `Department`, `Crew_Role`, `Crew_Member`, `License`
- `Office`, `Land_Employee`
- `Vessel_Crew_Requirements`

The design enforces:

- Referential integrity through foreign keys  
- CHECK constraints for dimensions, weights, and date rules  
- Unique container numbers  
- Ordered route paths using `STOP_ORDER`  

---

## ▶️ Running the Database

The scripts use **Oracle SQL** syntax (`VARCHAR2`, `NUMBER`, `DATE`, etc.).

### 1. Create all tables
```sql
@sql/create_tables.sql
```

### 2. Insert sample data
```sql
@sql/insert_sample_data.sql
```

### 3. Run validation queries
```sql
@sql/validation_queries.sql
```

---

## 🔧 Future Enhancements

The following improvements could extend the system:

- **Automated vessel scheduling**  
  Logic to assign vessels to routes based on availability, capacity, and demand.

- **Triggers for operational rules**  
  Examples:
  - Prevent goods from exceeding a container’s maximum weight.
  - Automatically update booking/container status when schedules change.

- **Reporting and analytics views**  
  Dashboards for:
  - Vessel utilization  
  - Booking trends  
  - Cargo volume by goods type  
  - Port activity frequency  

- **Front-end application integration**  
  A UI for booking creation, cargo tracking, and viewing vessel schedules.

- **Access control and authentication**  
  Role-based permissions for staff and operations teams.

- **Performance optimization**  
  Indexes on high-activity columns (e.g., Booking_ID, Container_ID, IMO_No) to support larger datasets.

---

## 📌 Notes

- Sample data is **synthetic** and included only for testing the schema.
- This repository provides a complete working example of a relational shipping database suitable for learning, demonstration, or portfolio use.
