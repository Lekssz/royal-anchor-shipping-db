------------------------------------------------------------
-- Royal Anchor Shipping Database - Sample Data
-- Contains the real INSERT statements taken from APEX screenshots.
------------------------------------------------------------

------------------------------------------------------------
-- 1. Customer data
------------------------------------------------------------

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone_Number) VALUES
    ('CUST001', 'Emily Carter', 'emily.carter@gmail.com', '07123456789'),
    ('CUST002', 'Ali Khan', 'ali.khan@freightlink.co.uk', '07234567890'),
    ('CUST003', 'Sandra Osei', 'sandra.osei@racship.com', '07345678901'),
    ('CUST004', 'John Mendes', 'john.mendes@yahoo.com', '07456789012'),
    ('CUST005', 'Lisa Zhang', 'lisa.zhang@globalnet.cn', '07567890123'),
    ('CUST006', 'Samuel Ade', 'sam.ade@africargo.ng', '07678901234'),
    ('CUST007', 'David Ngugi', 'd.ngugi@logistix.ke', '07789012345'),
    ('CUST008', 'Anna Müller', 'anna.mueller@contiship.de', '07890123456'),
    ('CUST009', 'Marcos Lima', 'mlima@transatlantico.br', '07901234567'),
    ('CUST010', 'Jessica Lee', 'jlee@cargoexpress.sg', '07012345678'),
    ('CUST011', 'George Evans', 'george.evans@outlook.com', '07123456780'),
    ('CUST012', 'Fatima Noor', 'fatima.noor@racship.com', '07234567881');


------------------------------------------------------------
-- 2. Ports
------------------------------------------------------------

INSERT ALL
    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('MIAMI',    'Miami Port',          'USA',         -80.1918,   25.7617)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('SOUTH001', 'Southampton Port',    'UK',          -1.4043,    50.9097)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('LAGOS01',  'Lagos Port',          'Nigeria',      3.3753,     6.5244)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('ANTWERP1', 'Port of Antwerp',     'Belgium',      4.4025,    51.2194)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('HOUSTON1', 'Houston Port',        'USA',        -95.3584,    29.7499)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('SHANGHAI', 'Shanghai Port',       'China',      121.4737,    31.2304)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('NEWYORK',  'New York Port',       'USA',        -74.0060,    40.7128)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('CAPETOWN', 'Cape Town Port',      'South Africa', 18.4241,  -33.9249)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('CHARLES1', 'Charleston Port',     'USA',        -79.9311,    32.7765)

    INTO Port (Port_ID, Port_Name, Country, Longitude, Latitude)
    VALUES ('DARPORT',  'Dar es Salaam Port',  'Tanzania',    39.2083,    -6.7924)
SELECT * FROM dual;


------------------------------------------------------------
-- 3. Vessel types
------------------------------------------------------------

INSERT ALL
    INTO Vessel_Type (Vessel_Type_ID, Imo_no_Prefix, Type_Desc, Length, Capacity, Quantity_Owned)
    VALUES ('VT01', 'IMO123', 'Cargo Vessel - Medium', 220.0, 5000, 4)

    INTO Vessel_Type (Vessel_Type_ID, Imo_no_Prefix, Type_Desc, Length, Capacity, Quantity_Owned)
    VALUES ('VT02', 'IMO124', 'Container Ship - Large', 300.0, 10000, 2)

    INTO Vessel_Type (Vessel_Type_ID, Imo_no_Prefix, Type_Desc, Length, Capacity, Quantity_Owned)
    VALUES ('VT03', 'IMO125', 'Bulk Carrier - Small', 180.0, 2000, 5)
SELECT * FROM dual;


------------------------------------------------------------
-- 4. Container types
------------------------------------------------------------

INSERT ALL
    INTO Container_Type (Container_Type_ID, Name_Of_Container,
                         Exterior_Length, Exterior_Width, Exterior_Height,
                         Interior_Length, Interior_Width, Interior_Height,
                         Max_Gross_Weight)
    VALUES ('CT01', '20ft Dry Cargo',
            6.058, 2.438, 2.591,
            5.898, 2.352, 2.385,
            30480)

    INTO Container_Type (Container_Type_ID, Name_Of_Container,
                         Exterior_Length, Exterior_Width, Exterior_Height,
                         Interior_Length, Interior_Width, Interior_Height,
                         Max_Gross_Weight)
    VALUES ('CT02', '40ft Dry Cargo',
            12.192, 2.438, 2.591,
            12.032, 2.352, 2.385,
            30480)

    INTO Container_Type (Container_Type_ID, Name_Of_Container,
                         Exterior_Length, Exterior_Width, Exterior_Height,
                         Interior_Length, Interior_Width, Interior_Height,
                         Max_Gross_Weight)
    VALUES ('CT03', '40ft Refrigerated',
            12.192, 2.438, 2.896,
            11.5,   2.29,  2.57,
            34000)
SELECT * FROM dual;


------------------------------------------------------------
-- 5. Goods types
------------------------------------------------------------

INSERT ALL
    INTO Goods_Type (Goods_Type_ID, Type_Name)
    VALUES ('GT01', 'Electronics')

    INTO Goods_Type (Goods_Type_ID, Type_Name)
    VALUES ('GT02', 'Furniture')

    INTO Goods_Type (Goods_Type_ID, Type_Name)
    VALUES ('GT03', 'Vehicles')

    INTO Goods_Type (Goods_Type_ID, Type_Name)
    VALUES ('GT04', 'Perishable Goods')

    INTO Goods_Type (Goods_Type_ID, Type_Name)
    VALUES ('GT05', 'Construction Materials')
SELECT * FROM dual;


------------------------------------------------------------
-- 6. Vessels
------------------------------------------------------------

INSERT ALL
    INTO Vessel_Name (IMO_No, Vessel_Name, Vessel_Type_ID, Speed_knots,
                      Gross_Tonnage, Deadweight_Tonnage, Length, Breadth, Date_Built)
    VALUES ('IMO1234567', 'Horizon Star', 'VT01',
            22.5, 30500, 18000, 220.0, 32.0, TO_DATE('2015-03-10', 'YYYY-MM-DD'))

    INTO Vessel_Name (IMO_No, Vessel_Name, Vessel_Type_ID, Speed_knots,
                      Gross_Tonnage, Deadweight_Tonnage, Length, Breadth, Date_Built)
    VALUES ('IMO1244567', 'Aurora Pacific', 'VT02',
            20.0, 35000, 22000, 300.0, 35.0, TO_DATE('2018-07-25', 'YYYY-MM-DD'))

    INTO Vessel_Name (IMO_No, Vessel_Name, Vessel_Type_ID, Speed_knots,
                      Gross_Tonnage, Deadweight_Tonnage, Length, Breadth, Date_Built)
    VALUES ('IMO1254567', 'Ocean Runner', 'VT03',
            18.0, 15000, 12000, 180.0, 28.0, TO_DATE('2016-05-18', 'YYYY-MM-DD'))
SELECT * FROM dual;


------------------------------------------------------------
-- 7. Routes
------------------------------------------------------------

INSERT ALL
    INTO Route (Route_ID, Route_Name, Total_Distance)
    VALUES ('RT001', 'Asia-Europe Trade Line', 15000)

    INTO Route (Route_ID, Route_Name, Total_Distance)
    VALUES ('RT002', 'North Atlantic Express', 8000)
SELECT * FROM dual;


------------------------------------------------------------
-- 8. Vessel schedules
------------------------------------------------------------

INSERT ALL
    INTO Vessel_Schedule (Schedule_ID, IMO_No, Route_ID, Start_Date, End_Date, Status)
    VALUES ('SCH001', 'IMO1234567', 'RT001',
            TO_DATE('2025-05-01', 'YYYY-MM-DD'),
            TO_DATE('2025-06-15', 'YYYY-MM-DD'),
            'Scheduled')

    INTO Vessel_Schedule (Schedule_ID, IMO_No, Route_ID, Start_Date, End_Date, Status)
    VALUES ('SCH002', 'IMO1244567', 'RT001',
            TO_DATE('2025-06-01', 'YYYY-MM-DD'),
            TO_DATE('2025-07-10', 'YYYY-MM-DD'),
            'Planned')

    INTO Vessel_Schedule (Schedule_ID, IMO_No, Route_ID, Start_Date, End_Date, Status)
    VALUES ('SCH003', 'IMO1254567', 'RT002',
            TO_DATE('2025-05-20', 'YYYY-MM-DD'),
            TO_DATE('2025-06-20', 'YYYY-MM-DD'),
            'Confirmed')
SELECT * FROM dual;


------------------------------------------------------------
-- 9. Bookings
------------------------------------------------------------

INSERT ALL
    INTO Booking (Booking_ID, Customer_ID, Origin_Port_ID, Dest_Port_ID,
                  Booking_Date, Cost, Status)
    VALUES ('BOOK001', 'CUST001', 'MIAMI', 'SOUTH001',
            TO_DATE('2025-04-10', 'YYYY-MM-DD'), 2000, 'Pending')

    INTO Booking (Booking_ID, Customer_ID, Origin_Port_ID, Dest_Port_ID,
                  Booking_Date, Cost, Status)
    VALUES ('BOOK002', 'CUST001', 'LAGOS01', 'ANTWERP1',
            TO_DATE('2025-04-12', 'YYYY-MM-DD'), 3500, 'Confirmed')

    INTO Booking (Booking_ID, Customer_ID, Origin_Port_ID, Dest_Port_ID,
                  Booking_Date, Cost, Status)
    VALUES ('BOOK003', 'CUST002', 'HOUSTON1', 'SHANGHAI',
            TO_DATE('2025-03-15', 'YYYY-MM-DD'), 4100, 'Confirmed')

    INTO Booking (Booking_ID, Customer_ID, Origin_Port_ID, Dest_Port_ID,
                  Booking_Date, Cost, Status)
    VALUES ('BOOK004', 'CUST003', 'NEWYORK', 'CAPETOWN',
            TO_DATE('2025-03-20', 'YYYY-MM-DD'), 1900, 'Shipped')

    INTO Booking (Booking_ID, Customer_ID, Origin_Port_ID, Dest_Port_ID,
                  Booking_Date, Cost, Status)
    VALUES ('BOOK005', 'CUST004', 'CHARLES1', 'DARPORT',
            TO_DATE('2025-04-01', 'YYYY-MM-DD'), 2800, 'Pending')
SELECT * FROM dual;


------------------------------------------------------------
-- 10. Containers
------------------------------------------------------------

INSERT ALL
    INTO Container (Container_ID, Booking_ID, Container_Type_ID, Schedule_ID, Container_Number)
    VALUES ('CONT001', 'BOOK001', 'CT01', NULL, 'CNT-10001')

    INTO Container (Container_ID, Booking_ID, Container_Type_ID, Schedule_ID, Container_Number)
    VALUES ('CONT002', 'BOOK001', 'CT02', NULL, 'CNT-10002')

    INTO Container (Container_ID, Booking_ID, Container_Type_ID, Schedule_ID, Container_Number)
    VALUES ('CONT003', 'BOOK002', 'CT03', NULL, 'CNT-10003')

    INTO Container (Container_ID, Booking_ID, Container_Type_ID, Schedule_ID, Container_Number)
    VALUES ('CONT004', 'BOOK003', 'CT02', NULL, 'CNT-10004')

    INTO Container (Container_ID, Booking_ID, Container_Type_ID, Schedule_ID, Container_Number)
    VALUES ('CONT005', 'BOOK004', 'CT01', NULL, 'CNT-10005')
SELECT * FROM dual;


------------------------------------------------------------
-- 11. Route_Port (route composition)
------------------------------------------------------------

INSERT ALL
    INTO Route_Port (Route_ID, Port_ID, Stop_Order, Transit_Hours)
    VALUES ('RT001', 'SHANGHAI', 1, 0)

    INTO Route_Port (Route_ID, Port_ID, Stop_Order, Transit_Hours)
    VALUES ('RT001', 'SINGAPORE', 2, 6)

    INTO Route_Port (Route_ID, Port_ID, Stop_Order, Transit_Hours)
    VALUES ('RT001', 'LEHAVRE', 3, 16)

    INTO Route_Port (Route_ID, Port_ID, Stop_Order, Transit_Hours)
    VALUES ('RT001', 'HAMBURG', 4, 18)

    INTO Route_Port (Route_ID, Port_ID, Stop_Order, Transit_Hours)
    VALUES ('RT002', 'NEWYORK', 1, 0)

    INTO Route_Port (Route_ID, Port_ID, Stop_Order, Transit_Hours)
    VALUES ('RT002', 'LONDON', 2, 5)
SELECT * FROM dual;


------------------------------------------------------------
-- 12. Port_Call (schedule execution at ports)
------------------------------------------------------------

INSERT ALL
    INTO Port_Call (Port_Call_ID, Schedule_ID, Port_ID, Arrival_Date, Departure_Date)
    VALUES ('CALL001', 'SCH001', 'SHANGHAI',
            TO_DATE('2025-05-01', 'YYYY-MM-DD'),
            TO_DATE('2025-05-02', 'YYYY-MM-DD'))

    INTO Port_Call (Port_Call_ID, Schedule_ID, Port_ID, Arrival_Date, Departure_Date)
    VALUES ('CALL002', 'SCH001', 'SINGAPORE',
            TO_DATE('2025-05-08', 'YYYY-MM-DD'),
            TO_DATE('2025-05-09', 'YYYY-MM-DD'))

    INTO Port_Call (Port_Call_ID, Schedule_ID, Port_ID, Arrival_Date, Departure_Date)
    VALUES ('CALL003', 'SCH001', 'LEHAVRE',
            TO_DATE('2025-06-10', 'YYYY-MM-DD'),
            TO_DATE('2025-06-11', 'YYYY-MM-DD'))

    INTO Port_Call (Port_Call_ID, Schedule_ID, Port_ID, Arrival_Date, Departure_Date)
    VALUES ('CALL004', 'SCH001', 'HAMBURG',
            TO_DATE('2025-06-14', 'YYYY-MM-DD'),
            TO_DATE('2025-06-15', 'YYYY-MM-DD'))
SELECT * FROM dual;


------------------------------------------------------------
-- 13. Departments
------------------------------------------------------------

INSERT ALL
    INTO Department (Department_ID, Department_Name)
    VALUES ('D01', 'Captain')

    INTO Department (Department_ID, Department_Name)
    VALUES ('D02', 'Deck Department')

    INTO Department (Department_ID, Department_Name)
    VALUES ('D03', 'Engineering Department')

    INTO Department (Department_ID, Department_Name)
    VALUES ('D04', 'Steward''s Department')
SELECT * FROM dual;


------------------------------------------------------------
-- 14. Crew roles
------------------------------------------------------------

INSERT ALL
    INTO Crew_Role (Role_ID, Role_Name, Department_ID)
    VALUES ('R01', 'Captain', 'D01')

    INTO Crew_Role (Role_ID, Role_Name, Department_ID)
    VALUES ('R02', 'Chief Mate', 'D02')

    INTO Crew_Role (Role_ID, Role_Name, Department_ID)
    VALUES ('R03', 'Second Mate', 'D02')

    INTO Crew_Role (Role_ID, Role_Name, Department_ID)
    VALUES ('R04', 'Chief Engineer', 'D03')

    INTO Crew_Role (Role_ID, Role_Name, Department_ID)
    VALUES ('R05', 'Second Engineer', 'D03')

    INTO Crew_Role (Role_ID, Role_Name, Department_ID)
    VALUES ('R06', 'Chief Steward', 'D04')
SELECT * FROM dual;


------------------------------------------------------------
-- 15. Crew members
------------------------------------------------------------

INSERT ALL
    INTO Crew_Member (Crew_ID, Crew_Member_Name, Certificate_No, DOB,
                      Experience_Years, Rank, Department_ID, Role_ID, Assigned_Vessel_Imo)
    VALUES ('CM001', 'John Blake', 'CERT-001',
            TO_DATE('1980-04-10', 'YYYY-MM-DD'),
            18, 'Captain', 'D01', 'R01', 'IMO1234567')

    INTO Crew_Member (Crew_ID, Crew_Member_Name, Certificate_No, DOB,
                      Experience_Years, Rank, Department_ID, Role_ID, Assigned_Vessel_Imo)
    VALUES ('CM002', 'Ali Kamara', 'CERT-002',
            TO_DATE('1985-09-21', 'YYYY-MM-DD'),
            15, 'Chief Mate', 'D02', 'R02', 'IMO1234567')

    INTO Crew_Member (Crew_ID, Crew_Member_Name, Certificate_No, DOB,
                      Experience_Years, Rank, Department_ID, Role_ID, Assigned_Vessel_Imo)
    VALUES ('CM003', 'Liam Chan', 'CERT-003',
            TO_DATE('1988-11-05', 'YYYY-MM-DD'),
            12, 'Chief Engineer', 'D03', 'R04', 'IMO1234567')

    INTO Crew_Member (Crew_ID, Crew_Member_Name, Certificate_No, DOB,
                      Experience_Years, Rank, Department_ID, Role_ID, Assigned_Vessel_Imo)
    VALUES ('CM004', 'Maya Tan', 'CERT-004',
            TO_DATE('1990-02-18', 'YYYY-MM-DD'),
            10, 'Second Mate', 'D02', 'R03', 'IMO1234567')

    INTO Crew_Member (Crew_ID, Crew_Member_Name, Certificate_No, DOB,
                      Experience_Years, Rank, Department_ID, Role_ID, Assigned_Vessel_Imo)
    VALUES ('CM005', 'Carlos Rivera', 'CERT-005',
            TO_DATE('1992-06-30', 'YYYY-MM-DD'),
            9, 'Second Engineer', 'D03', 'R05', 'IMO1234567')

    INTO Crew_Member (Crew_ID, Crew_Member_Name, Certificate_No, DOB,
                      Experience_Years, Rank, Department_ID, Role_ID, Assigned_Vessel_Imo)
    VALUES ('CM006', 'Anne Dupont', 'CERT-006',
            TO_DATE('1987-12-12', 'YYYY-MM-DD'),
            14, 'Chief Steward', 'D04', 'R06', 'IMO1234567')
SELECT * FROM dual;


------------------------------------------------------------
-- 16. Vessel crew requirements
------------------------------------------------------------

-- VT01: Cargo Vessel - Medium
INSERT ALL
    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT01', 'R01', 1)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT01', 'R02', 1)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT01', 'R03', 1)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT01', 'R04', 1)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT01', 'R05', 1)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT01', 'R06', 1)

-- VT02: Larger vessel
    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT02', 'R01', 1)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT02', 'R02', 2)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT02', 'R03', 2)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT02', 'R04', 2)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT02', 'R05', 2)

    INTO Vessel_Crew_Requirements (Vessel_Type_ID, Role_ID, Quantity)
    VALUES ('VT02', 'R06', 2)
SELECT * FROM dual;


------------------------------------------------------------
-- 17. Offices and land employees
------------------------------------------------------------

INSERT ALL
    INTO Office (Office_ID, Port_ID, Manager, Address, Contact_Info)
    VALUES ('OFF001', 'LONDON', 'Laura Spencer',
            '10 Thames Ave, London', '+44 20 7946 0958')

    INTO Office (Office_ID, Port_ID, Manager, Address, Contact_Info)
    VALUES ('OFF002', 'SINGAPORE', 'Derek Ng',
            '21 Marina Blvd, Singapore', '+65 6234 5678')

    INTO Office (Office_ID, Port_ID, Manager, Address, Contact_Info)
    VALUES ('OFF003', 'NEWYORK', 'Alicia Carter',
            '35 Broadway, New York', '+1 212 555 7823')

    INTO Office (Office_ID, Port_ID, Manager, Address, Contact_Info)
    VALUES ('OFF004', 'LAGOS01', 'Olu Ajayi',
            '14 Marina Rd, Lagos', '+234 803 123 4567')
SELECT * FROM dual;


INSERT ALL
    INTO Land_Employee (Land_Employye_ID, Office_ID, Name_of_Employee, Position)
    VALUES ('LE001', 'OFF001', 'Rachel Scott', 'HR Manager')

    INTO Land_Employee (Land_Employye_ID, Office_ID, Name_of_Employee, Position)
    VALUES ('LE002', 'OFF002', 'Marcus Lee', 'Logistics Officer')

    INTO Land_Employee (Land_Employye_ID, Office_ID, Name_of_Employee, Position)
    VALUES ('LE003', 'OFF003', 'Jamal Hayes', 'Accounts Clerk')

    INTO Land_Employee (Land_Employye_ID, Office_ID, Name_of_Employee, Position)
    VALUES ('LE004', 'OFF004', 'Tunde Bello', 'Operations Coordinator')
SELECT * FROM dual;


------------------------------------------------------------
-- 18. Goods (per container)
------------------------------------------------------------

INSERT ALL
    INTO Goods (Goods_ID, Container_ID, Goods_Type_ID, Description, Weight, Quantity)
    VALUES ('GOOD001', 'CONT001', 'GT01', 'Smartphones', 1500.00, 300)

    INTO Goods (Goods_ID, Container_ID, Goods_Type_ID, Description, Weight, Quantity)
    VALUES ('GOOD002', 'CONT002', 'GT02', 'Office Chairs', 2200.00, 120)

    INTO Goods (Goods_ID, Container_ID, Goods_Type_ID, Description, Weight, Quantity)
    VALUES ('GOOD003', 'CONT002', 'GT01', 'Laptops', 1200.00, 60)

    INTO Goods (Goods_ID, Container_ID, Goods_Type_ID, Description, Weight, Quantity)
    VALUES ('GOOD004', 'CONT003', 'GT03', 'Electric Scooters', 1800.00, 40)

    INTO Goods (Goods_ID, Container_ID, Goods_Type_ID, Description, Weight, Quantity)
    VALUES ('GOOD005', 'CONT004', 'GT05', 'Cement Bags', 3000.00, 100)

    INTO Goods (Goods_ID, Container_ID, Goods_Type_ID, Description, Weight, Quantity)
    VALUES ('GOOD006', 'CONT005', 'GT04', 'Frozen Vegetables', 2500.00, 75)
SELECT * FROM dual;

