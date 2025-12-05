------------------------------------------------------------
-- Royal Anchor Shipping Database - Validation Queries
------------------------------------------------------------

-- Query 1: Customer bookings and associated costs
SELECT
    c.Customer_ID,
    c.Customer_Name,
    b.Booking_ID,
    b.Booking_Date,
    b.Cost
FROM Customer c
JOIN Booking b
    ON c.Customer_ID = b.Customer_ID
ORDER BY
    c.Customer_Name,
    b.Booking_Date;


-- Query 2: Vessels and their schedules
SELECT
    v.Vessel_Name,
    v.IMO_No,
    s.Schedule_ID,
    s.Route_ID,
    s.Start_Date,
    s.End_Date
FROM Vessel_Name v
JOIN Vessel_Schedule s
    ON v.IMO_No = s.IMO_No
ORDER BY
    v.Vessel_Name,
    s.Start_Date;


-- Query 3: Containers and goods details (with goods type)
SELECT
    c.Container_Number,
    g.Goods_ID,
    g.Description,
    gt.Type_Name AS Goods_Type
FROM Container c
JOIN Goods g
    ON c.Container_ID = g.Container_ID
JOIN Goods_Type gt
    ON g.Goods_Type_ID = gt.Goods_Type_ID
ORDER BY
    c.Container_Number,
    g.Goods_ID;


-- Query 4: Route and port sequence
SELECT
    rp.Route_ID,
    rp.Stop_Order,
    p.Port_ID,
    p.Port_Name
FROM Route_Port rp
JOIN Port p
    ON rp.Port_ID = p.Port_ID
ORDER BY
    rp.Route_ID,
    rp.Stop_Order;


-- Query 5: Track goods by booking (booking -> container -> goods)
SELECT
    b.Booking_ID,
    c.Container_Number,
    g.Goods_ID,
    g.Description
FROM Booking b
JOIN Container c
    ON b.Booking_ID = c.Booking_ID
JOIN Goods g
    ON c.Container_ID = g.Container_ID
ORDER BY
    b.Booking_ID,
    c.Container_Number;


-- Query 6: Land employees and their port locations
SELECT
    le.Land_Employye_ID,
    le.Name_of_Employee,
    le.Position,
    o.Office_ID,
    p.Port_Name
FROM Land_Employee le
JOIN Office o
    ON le.Office_ID = o.Office_ID
JOIN Port p
    ON o.Port_ID = p.Port_ID
ORDER BY
    p.Port_Name,
    le.Name_of_Employee;
