CREATE DATABASE P__M__5;
USE P__M__5;

-- Create Dealership table
CREATE TABLE Dealership (
    BusinessID INT PRIMARY KEY,
    Location VARCHAR(255),
    BusinessName VARCHAR(255),
    BusinessEmail VARCHAR(555),
    BusinessPhone VARCHAR(100)
);

-- Create index on BusinessID
CREATE INDEX idx_Dealership_BusinessID ON Dealership(BusinessID);

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Email VARCHAR(555),
    Phone VARCHAR(150)
);

-- Create index on CustomerID
CREATE INDEX idx_Customer_CustomerID ON Customer(CustomerID);

-- Create Employees table
CREATE TABLE Employees (
    EIN INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(150),
    Position VARCHAR(100),
    SSN VARCHAR(20),
    Number_of_cars_sold INT,
    Commission_Percentage DECIMAL(5,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create index on EIN
CREATE INDEX idx_Employees_EIN ON Employees(EIN);

-- CREATE COMMISSION TABLE
CREATE TABLE Commission (
    SSN VARCHAR(20),
    Position VARCHAR(100),
    NumberOfCarsSold INT,
    CommissionPercentage DECIMAL(5,2),
    PRIMARY KEY (SSN, Position, NumberOfCarsSold)
);

-- Create index on SSN
CREATE INDEX idx_Commission_SSN ON Commission(SSN);

-- Create Vehicle table
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    VIN VARCHAR(17),
    License_plate_Number VARCHAR(10),
    Color VARCHAR(50),
    Model VARCHAR(100),
    Date_of_Manufacture DATE,
    Place_of_Manufacture VARCHAR(25),
    Capacity INT,
    No_of_cylinders INT,
    Type VARCHAR(100),
    Conditions VARCHAR(100),
    No_of_doors INT,
    Price DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create index on VehicleID
CREATE INDEX idx_Vehicle_VehicleID ON Vehicle(VehicleID);

-- Create Inventory table
CREATE TABLE Inventory (
    Inventory_serial_number INT PRIMARY KEY,
    No_of_cars INT,
    Capacity INT,
    Location VARCHAR(255),
    VehicleID INT,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Create index on Inventory_serial_number
CREATE INDEX idx_Inventory_Inventory_serial_number ON Inventory(Inventory_serial_number);

-- Create Warranty table
CREATE TABLE Warranty (
    WarrantyID INT PRIMARY KEY,
    Duration INT,
    Warranty_Type VARCHAR(100),
    VehicleID INT,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Create index on WarrantyID
CREATE INDEX idx_Warranty_WarrantyID ON Warranty(WarrantyID);

-- Create Registration table
CREATE TABLE Registration (
    Reg_no INT PRIMARY KEY,
    Date_of_Expiration DATE,
    VIN VARCHAR(17),
    License_plate VARCHAR(10),
    Model VARCHAR(100),
    Date_of_Manufacture DATE,
    VehicleID INT,
    CustomerID INT,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create index on Reg_no
CREATE INDEX idx_Registration_Reg_no ON Registration(Reg_no);

-- Create Financing table
CREATE TABLE Financing (
    Loan_Number INT PRIMARY KEY,
    VehicleID INT,
    CustomerID INT,
    Interest_Rate DECIMAL(5,2),
    Payment_Type VARCHAR(50),
    Financing_Term INT,
    Plan VARCHAR(25),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create index on Loan_Number
CREATE INDEX idx_Financing_Loan_Number ON Financing(Loan_Number);

-- Create Customization table
CREATE TABLE Customization (
    InvoiceID INT PRIMARY KEY,
    Customization_Type VARCHAR(50),
    Area_of_Customization VARCHAR(25),
    Cost DECIMAL(10,2),
    VehicleID INT,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Create index on InvoiceID
CREATE INDEX idx_Customization_InvoiceID ON Customization(InvoiceID);

-- Create Survey table
CREATE TABLE Survey (
    Survey_number INT PRIMARY KEY,
    CustomerID INT,
    SurveyDate DATE,
    OverallRating INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create index on Survey_number
CREATE INDEX idx_Survey_Survey_number ON Survey(Survey_number);

-- Create Insurance Table:
CREATE TABLE Insurance (
    PolicyID INT PRIMARY KEY,
    InsuranceCompanyName VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    PlanType VARCHAR(100),
    VehicleID INT,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Create index on PolicyID
CREATE INDEX idx_Insurance_PolictID ON Insurance(PolicyID);

-- Inserting values in Dealership table
INSERT INTO Dealership (BusinessID, Location, BusinessName, BusinessEmail, BusinessPhone)
VALUES (001, 'Boston', 'Friendly Car Dealership', 'friendlycars@example.com', '713-555-1234');

-- Inserting values in Customer table
INSERT INTO Customer (CustomerID, Name, Address, Email, Phone)
VALUES (401, 'Alice Johnson', '456 Oak St, New York', 'alice@example.com', '222-333-4444'),
(402, 'Bob Smith', '789 Pine St, Los Angeles', 'bob@example.com', '555-666-7777'),
(403, 'Charlie Brown', '123 Maple St, Chicago', 'charlie@example.com', '888-999-0000'),
(404, 'David Brown', '456 Park Ave, Houston', 'david@example.com', '111-222-3337'),
(405, 'Olivia Martinez', '789 River Rd, Miami', 'olivia@example.com', '111-222-3338');
Select * from Customer;


-- Inserting values in Employees table
INSERT INTO Employees (EIN, Name, Email, Address, Phone, Position, SSN, Number_of_cars_sold, Commission_Percentage, CustomerID)
VALUES (101, 'Tom Thompson', 'tom@company.com', '125 SUNDALE DR.', '1111111111', 'Salesman', '123-45-6789', 10, 5.00, 401),
(102, 'Alice Johnson', 'alice@company.com', '156 Montague BLVD.', '2222222222', 'Salesman', '987-65-4321', 15, 7.50, 402),
(103, 'Bob Smith', 'bob@company.com', '421 MIAMI DR.', '3333333333', 'Office Manager', '555-55-5555', NULL, NULL, NULL),
(104, 'Emma Davis', 'emma@company.com', '567 IRVINGTON CMN.', '4444444444', 'Salesman', '444-44-4444', 20, 4.00, 404),
(105, 'James Wilson', 'james@company.com', '181 WARMTH DR.', '5555555555', 'Salesman', '777-77-7777', 12, 5.50, 405);
Select * from Employees;

-- Inserting values in Commission table
INSERT INTO Commission (SSN, Position, NumberOfCarsSold, CommissionPercentage)
VALUES ('123-45-6789', 'Salesman', 10, 5.00),
('987-65-4321', 'Salesman', 15, 7.50),
('555-55-5555', 'Office Manager', 8, 6.00),
('444-44-4444', 'Salesman', 23, 9.00),
('777-77-7777', 'Salesman', 22, 8.50);
Select * from Commission;




-- Inserting values in Vehicle table
INSERT INTO Vehicle (VehicleID, VIN, License_plate_Number, Color, Model, Date_of_Manufacture, Place_of_Manufacture, Capacity, No_of_cylinders, Type, Conditions, No_of_doors, Price, CustomerID)
VALUES (1, '1HGCM12345A67890', 'ABC123', 'Blue', 'Honda Accord', '2022-01-15', 'Japan', 5, 4, 'Sedan', 'New', 4, 25000.00, NULL),
(2, '5YJSA1E16HF188393', 'TESLA001', 'Red', 'Tesla Model S', '2021-12-30', 'USA', 5, 0, 'Electric', 'New', 4, 80000.00, NULL),
(3, '1C4RJFAG0HC812345', 'JEEP789', 'Black', 'Jeep Grand Cherokee', '2021-11-20', 'USA', 5, 6, 'SUV', 'Used', 4, 35000.00, NULL),
(4, '5LMCJ2D97LUL12345', 'LINCOLN456', 'Silver', 'Lincoln Corsair', '2022-02-05', 'USA', 5, 4, 'SUV', 'New', 4, 45000.00, NULL),
(5, '1GCVKREC1HZ100001', 'CHEVY789', 'White', 'Chevrolet Silverado', '2022-03-10', 'USA', 3, 8, 'Truck', 'New', 4, 40000.00, NULL);

-- Inserting values in Inventory table
INSERT INTO Inventory (Inventory_serial_number, No_of_cars, Capacity, Location, VehicleID)
VALUES (1001, 5, 10, '446 Finale Ave., Boston', 1),
(1002, 3, 5, '424 Expressway Blvd., Boston', 2),
(1003, 2, 4, '56 Sunnyvale Cmn., Boston', 3),
(1004, 4, 8, '45 Houston St., Boston', 4),
(1005, 6, 12, '345 Miami Dr., Boston', 5);
Select * from Inventory;

-- Inserting values in Warranty table
INSERT INTO Warranty (WarrantyID, Duration, Warranty_Type, VehicleID)
VALUES (11, 3, 'Basic', 1),
(22, 5, 'Extended', 2),
(33, 2, 'Basic', 3),
(44, 4, 'Extended', 4),
(55, 3, 'Basic', 5);

-- Inserting values in Registration table
INSERT INTO Registration (Reg_no, Date_of_Expiration, VIN, License_plate, Model, Date_of_Manufacture, VehicleID, CustomerID)
VALUES (1001, '2023-01-31', '1HGCM12345A67890', 'ABC123', 'Honda Accord', '2022-01-15', 1, 401),
(1002, '2024-03-31', '5YJSA1E16HF188393', 'TESLA001', 'Tesla Model S', '2021-12-30', 2, 402),
(1003, '2023-05-15', '1C4RJFAG0HC812345', 'JEEP789', 'Jeep Grand Cherokee', '2021-11-20', 3, 403),
(1004, '2025-02-28', '5LMCJ2D97LUL12345', 'LINCOLN456', 'Lincoln Corsair', '2022-02-05', 4, 404),
(1005, '2023-04-30', '1GCVKREC1HZ100001', 'CHEVY789', 'Chevrolet Silverado', '2022-03-10', 5, 405);

-- Inserting values in Insurance table
INSERT INTO Insurance (PolicyID, InsuranceCompanyName, StartDate, EndDate, PlanType, VehicleID)
VALUES (501, 'ABC Insurance', '2023-01-01', '2024-01-01', 'Comprehensive', 1),
(502, 'XYZ Insurance', '2023-02-01', '2024-02-01', 'Liability', 2),
(503, '123 Insurance', '2023-03-01', '2024-03-01', 'Collision', 3),
(504, 'XYZ Insurance', '2023-04-01', '2024-04-01', 'Comprehensive', 4),
(505, 'ABC Insurance', '2023-05-01', '2024-05-01', 'Liability', 5);

-- Inserting values in Financing table
INSERT INTO Financing (Loan_Number, VehicleID, CustomerID, Interest_Rate, Payment_Type, Financing_Term, Plan)
VALUES (2001, 1, 401, 3.5, 'Loan', 60, 'Standard'),
(2002, 2, 402, 2.9, 'Lease', 36, 'Premium'),
(2003, 3, 403, 4.2, 'Loan', 48, 'Basic'),
(2004, 4, 404, 3.8, 'Loan', 60, 'Standard'),
(2005, 5, 405, 4.0, 'Loan', 72, 'Extended');

-- Inserting values in Customization table
INSERT INTO Customization (InvoiceID, Customization_Type, Area_of_Customization, Cost, VehicleID)
VALUES (20011, 'Interior', 'Leather Seats', 1500.00, 1),
(20022, 'Exterior', 'Tinted Windows', 300.00, 2),
(20033, 'Performance', 'Turbocharger Kit', 5000.00, 3),
(20044, 'Audio', 'Premium Sound System', 2000.00, 4),
(20055, 'Exterior', 'Roof Rack', 400.00, 5);

-- Inserting values in Survey table
INSERT INTO Survey (Survey_number, CustomerID, SurveyDate, OverallRating)
VALUES (11001, 401, '2024-01-03', 4),
(11002, 402, '2024-02-14', 5),
(11003, 403, '2024-04-15', 3),
(11004, 404, '2024-02-14', 4),
(11005, 405, '2024-02-14', 5);

-- Query 1: Customers with active warranties longer than 3 years
SELECT c.Name, c.Email
FROM Customer c
JOIN Registration r ON c.CustomerID = r.CustomerID
JOIN Warranty w ON r.VehicleID = w.VehicleID
WHERE w.Duration > 3;

-- Query 2: Total cars sold by each employee
SELECT e.Name, SUM(e.Number_of_cars_sold) AS Total_Cars_Sold
FROM Employees AS e
GROUP BY e.Name;


