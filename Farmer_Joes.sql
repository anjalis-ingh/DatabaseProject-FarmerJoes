CREATE TABLE SUPPLIER (
    Supplier_ID INT PRIMARY KEY,
    Company_Name VARCHAR(50),
    Wholesale_Price DECIMAL(10,2),
    Supplied_Products VARCHAR(100)
);
CREATE TABLE PRODUCT (
    Product_ID INT PRIMARY KEY,
    PSupplier_ID INT,
    Product_Name VARCHAR(50),
    Description VARCHAR(100),
    Retail_Price DECIMAL(10,2),
    Stock_Quantity INT,
    Exp_Date DATE,
    FOREIGN KEY (PSupplier_ID) REFERENCES SUPPLIER(Supplier_ID)
);
CREATE TABLE DEFAULT_ORDER (
    Order_ID INT PRIMARY KEY,
    Payment_Method VARCHAR(50),
    Order_Date DATE,
    Amount DECIMAL(10,2)
);
CREATE TABLE CUSTOMER (
    Customer_ID INT PRIMARY KEY,
    Loyalty_Points INT,
    Contact_Information VARCHAR(100),
    Fname VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50)
);
CREATE TABLE DEPARTMENT (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);
CREATE TABLE EMPLOYEE (
    EDepartment_ID INT,
    Employee_ID INT PRIMARY KEY,
    Super_Employee_ID INT,
    Salary DECIMAL(10,2),
    Fname VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    FOREIGN KEY (EDepartment_ID) REFERENCES DEPARTMENT(Department_ID),
    FOREIGN KEY (Super_Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);