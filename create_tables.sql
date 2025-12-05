------------------------------------------------------------
-- Royal Anchor Shipping Database - Schema Definition
-- Cleaned formatting from original coursework report
------------------------------------------------------------

-- Customer details
CREATE TABLE Customer (
    Customer_ID    VARCHAR2(10) PRIMARY KEY,
    Customer_Name  VARCHAR2(50) NOT NULL,
    Email          VARCHAR2(50),
    Phone_Number   VARCHAR2(20)
);

-- Departments on vessels (e.g. Deck, Engineering)
CREATE TABLE Department (
    Department_ID   VARCHAR2(10) PRIMARY KEY,
    Department_Name VARCHAR2(100) NOT NULL
);

-- Crew roles within departments (e.g. Captain, Chief Engineer)
CREATE TABLE Crew_Role (
    Role_ID        VARCHAR2(10) PRIMARY KEY,
    Role_Name      VARCHAR2(100) NOT NULL,
    Department_ID  VARCHAR2(10) NOT NULL,
    FOREIGN KEY (Department_ID)
        REFERENCES Department (Department_ID)
);

-- Ports around the world
CREATE TABLE Port (
    Port_ID    VARCHAR2(10) PRIMARY KEY,
    Port_Name  VARCHAR2(100) NOT NULL,
    Country    VARCHAR2(50),
    Longitude  NUMBER(10,6),
    Latitude   NUMBER(10,6)
);

-- High-level vessel routes
CREATE TABLE Route (
    Route_ID       VARCHAR2(10) PRIMARY KEY,
    Route_Name     VARCHAR2(100) NOT NULL,
    Total_Distance NUMBER(10,2) CHECK (Total_Distance > 0)
);

-- Vessel type characteristics (A, G, T, etc.)
CREATE TABLE Vessel_Type (
    Vessel_Type_ID VARCHAR2(10) PRIMARY KEY,
    Imo_no_Prefix  VARCHAR2(10),
    Type_Desc      VARCHAR2(100) NOT NULL,
    Length         NUMBER(6,2),
    Capacity       NUMBER(8,2),
    Quantity_Owned NUMBER(5)
);

-- Lookup for goods classification
CREATE TABLE Goods_Type (
    Goods_Type_ID VARCHAR2(10) PRIMARY KEY,
    Type_Name     VARCHAR2(100) NOT NULL
);

-- Container type with dimensions and weight limits
CREATE TABLE Container_Type (
    Container_Type_ID  VARCHAR2(10) PRIMARY KEY,
    Name_Of_Container  VARCHAR2(50) NOT NULL,
    Exterior_Length    NUMBER(6,3) CHECK (Exterior_Length > 0),
    Exterior_Width     NUMBER(6,3) CHECK (Exterior_Width > 0),
    Exterior_Height    NUMBER(6,3) CHECK (Exterior_Height > 0),
    Interior_Length    NUMBER(6,3) CHECK (Interior_Length > 0),
    Interior_Width     NUMBER(6,3) CHECK (Interior_Width > 0),
    Interior_Height    NUMBER(6,3) CHECK (Interior_Height > 0),
    Max_Gross_Weight   NUMBER(10,2) CHECK (Max_Gross_Weight > 0)
);

-- Individual vessels, identified by IMO number
CREATE TABLE Vessel_Name (
    IMO_No             VARCHAR2(10) PRIMARY KEY,
    Vessel_Name        VARCHAR2(100) NOT NULL,
    Vessel_Type_ID     VARCHAR2(10) NOT NULL,
    Speed_knots        NUMBER(6,2),
    Gross_Tonnage      NUMBER(10),
    Deadweight_Tonnage NUMBER(10),
    Length             NUMBER(6,2),
    Breadth            NUMBER(6,2),
    Date_Built         DATE,
    FOREIGN KEY (Vessel_Type_ID)
        REFERENCES Vessel_Type (Vessel_Type_ID)
);

-- Port offices
CREATE TABLE Office (
    Office_ID    VARCHAR2(10) PRIMARY KEY,
    Port_ID      VARCHAR2(10) NOT NULL,
    Manager      VARCHAR2(100),
    Address      VARCHAR2(255),
    Contact_Info VARCHAR2(100),
    FOREIGN KEY (Port_ID)
        REFERENCES Port (Port_ID)
);

-- Customer bookings
CREATE TABLE Booking (
    Booking_ID      VARCHAR2(10) PRIMARY KEY,
    Customer_ID     VARCHAR2(10) NOT NULL,
    Origin_Port_ID  VARCHAR2(10) NOT NULL,
    Dest_Port_ID    VARCHAR2(10) NOT NULL,
    Booking_Date    DATE,
    Cost            NUMBER(10,2),
    Status          VARCHAR2(10),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Origin_Port_ID)
        REFERENCES Port (Port_ID),
    FOREIGN KEY (Dest_Port_ID)
        REFERENCES Port (Port_ID)
);

-- Vessel schedules (a vessel on a route for a time period)
CREATE TABLE Vessel_Schedule (
    Schedule_ID VARCHAR2(10) PRIMARY KEY,
    IMO_No      VARCHAR2(10) NOT NULL,
    Route_ID    VARCHAR2(10) NOT NULL,
    Start_Date  DATE,
    End_Date    DATE,
    Status      VARCHAR2(20),
    FOREIGN KEY (IMO_No)
        REFERENCES Vessel_Name (IMO_No),
    FOREIGN KEY (Route_ID)
        REFERENCES Route (Route_ID)
);

-- Containers belonging to bookings and optionally assigned to schedules
CREATE TABLE Container (
    Container_ID      VARCHAR2(10) PRIMARY KEY,
    Booking_ID        VARCHAR2(10) NOT NULL,
    Container_Type_ID VARCHAR2(10) NOT NULL,
    Schedule_ID       VARCHAR2(10),
    Container_Number  VARCHAR2(50) UNIQUE,
    FOREIGN KEY (Booking_ID)
        REFERENCES Booking (Booking_ID),
    FOREIGN KEY (Container_Type_ID)
        REFERENCES Container_Type (Container_Type_ID),
    FOREIGN KEY (Schedule_ID)
        REFERENCES Vessel_Schedule (Schedule_ID)
);

-- Goods carried inside containers
-- NOTE: Quantity definition fixed from report (removed stray comma).
CREATE TABLE Goods (
    Goods_ID       VARCHAR2(10) PRIMARY KEY,
    Container_ID   VARCHAR2(10) NOT NULL,
    Goods_Type_ID  VARCHAR2(10) NOT NULL,
    Description    VARCHAR2(255),
    Weight         NUMBER(10,2),
    Quantity       NUMBER(5),
    FOREIGN KEY (Container_ID)
        REFERENCES Container (Container_ID),
    FOREIGN KEY (Goods_Type_ID)
        REFERENCES Goods_Type (Goods_Type_ID)
);

-- Route composition: which ports and in what order
CREATE TABLE Route_Port (
    Route_ID      VARCHAR2(10),
    Port_ID       VARCHAR2(10),
    Stop_Order    NUMBER NOT NULL,
    Transit_Hours NUMBER(5,2),
    PRIMARY KEY (Route_ID, Port_ID),
    FOREIGN KEY (Route_ID)
        REFERENCES Route (Route_ID),
    FOREIGN KEY (Port_ID)
        REFERENCES Port (Port_ID)
);

-- Actual port calls for a schedule
CREATE TABLE Port_Call (
    Port_Call_ID   VARCHAR2(10) PRIMARY KEY,
    Schedule_ID    VARCHAR2(10) NOT NULL,
    Port_ID        VARCHAR2(10) NOT NULL,
    Arrival_Date   DATE NOT NULL,
    Departure_Date DATE NOT NULL,
    FOREIGN KEY (Schedule_ID)
        REFERENCES Vessel_Schedule (Schedule_ID),
    FOREIGN KEY (Port_ID)
        REFERENCES Port (Port_ID)
);

-- Crew members and their assignments
CREATE TABLE Crew_Member (
    Crew_ID             VARCHAR2(10) PRIMARY KEY,
    Crew_Member_Name    VARCHAR2(100) NOT NULL,
    Role_ID             VARCHAR2(10) NOT NULL,
    Department_ID       VARCHAR2(10) NOT NULL,
    Assigned_Vessel_Imo VARCHAR2(10) NOT NULL,
    Certificate_No      VARCHAR2(20),
    Rank                VARCHAR2(50),
    Experience_Years    NUMBER(2),
    DOB                 DATE,
    FOREIGN KEY (Role_ID)
        REFERENCES Crew_Role (Role_ID),
    FOREIGN KEY (Department_ID)
        REFERENCES Department (Department_ID),
    FOREIGN KEY (Assigned_Vessel_Imo)
        REFERENCES Vessel_Name (IMO_No)
);

-- Crew licenses/certifications
CREATE TABLE License (
    License_ID     VARCHAR2(10) PRIMARY KEY,
    Crew_ID        VARCHAR2(10),
    License_Type   VARCHAR2(100),
    Date_of_Issue  DATE,
    Date_of_Expiry DATE,
    FOREIGN KEY (Crew_ID)
        REFERENCES Crew_Member (Crew_ID),
    CONSTRAINT chk_dates
        CHECK (Date_of_Expiry > Date_of_Issue)
);

-- Land-based employees at offices
-- Note: Column name kept as in the original work (Land_Employye_ID).
CREATE TABLE Land_Employee (
    Land_Employye_ID  VARCHAR2(10) PRIMARY KEY,
    Office_ID         VARCHAR2(10) NOT NULL,
    Name_of_Employee  VARCHAR2(50),
    Position          VARCHAR2(100),
    FOREIGN KEY (Office_ID)
        REFERENCES Office (Office_ID)
);

-- Required crew quantities per vessel type and role
CREATE TABLE Vessel_Crew_Requirements (
    Vessel_Type_ID VARCHAR2(10),
    Role_ID        VARCHAR2(10),
    Quantity       NUMBER(3) NOT NULL,
    PRIMARY KEY (Vessel_Type_ID, Role_ID),
    FOREIGN KEY (Vessel_Type_ID)
        REFERENCES Vessel_Type (Vessel_Type_ID),
    FOREIGN KEY (Role_ID)
        REFERENCES Crew_Role (Role_ID)
);
