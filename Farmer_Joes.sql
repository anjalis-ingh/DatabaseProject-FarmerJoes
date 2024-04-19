CREATE DATABASE IF NOT EXISTS Farmer_Joes;

USE Farmer_Joes;

CREATE TABLE SUPPLIER (
    Supplier_ID INT PRIMARY KEY,
    Company_Name VARCHAR(50)
);
CREATE TABLE PRODUCT (
    Product_ID INT PRIMARY KEY,
    PSupplier_ID INT,
    Product_Name VARCHAR(50),
    Descriptions VARCHAR(100),
    Retail_Price DECIMAL(10,2),
    Stock_Quantity INT,
    Exp_Date DATE,
    FOREIGN KEY (PSupplier_ID) REFERENCES SUPPLIER(Supplier_ID)
);
ALTER TABLE PRODUCT CHANGE Description Descriptions VARCHAR(100);

ALTER TABLE PRODUCT DROP COLUMN Wholesale_Price;

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
CREATE TABLE PROMOTION (
	Promo_Product_ID INT,
    Promotion_ID INT PRIMARY KEY,
    Discount_Amount DECIMAL(10,2),
    Start_Date DATE,
    End_Date DATE,
    Descriptions VARCHAR(100),
    FOREIGN KEY (Promo_Product_ID) REFERENCES PRODUCT(Product_ID)
);
ALTER TABLE PROMOTION CHANGE Description Descriptions VARCHAR(100);

CREATE TABLE WHOLESALE_ORDER (
	WOrder_ID INT,
    WEmployee_ID INT,
    FOREIGN KEY (WOrder_ID) REFERENCES DEFAULT_ORDER(Order_ID),
    FOREIGN KEY (WEmployee_ID) REFERENCES EMPLOYEE(Employee_ID)
);
CREATE TABLE RETAIL_ORDER (
	ROrder_ID INT,
    RCustomer_ID INT,
    FOREIGN KEY (ROrder_ID) REFERENCES DEFAULT_ORDER(Order_ID),
    FOREIGN KEY (RCustomer_ID) REFERENCES CUSTOMER(Customer_ID)
);
CREATE TABLE FULFILLS (
    PProduct_ID INT,
    OOrder_ID INT,
    FOREIGN KEY (PProduct_ID) REFERENCES PRODUCT(Product_ID),
    FOREIGN KEY (OOrder_ID) REFERENCES DEFAULT_ORDER(Order_ID)
);
CREATE TABLE UPDATES (
    PProduct_ID INT,
    EEmployee_ID INT,
    FOREIGN KEY (PProduct_ID) REFERENCES PRODUCT (Product_ID),
    FOREIGN KEY (EEmployee_ID) REFERENCES EMPLOYEE (Employee_ID)
);
CREATE TABLE SUPPLIER_CONTACT (
    SSupplier_ID INT PRIMARY KEY,
    SContact_Information VARCHAR(255),
    FOREIGN KEY (SSupplier_ID) REFERENCES SUPPLIER (Supplier_ID)
);
CREATE TABLE CUSTOMER_CONTACT (
    CCustomer_ID INT,
    CContact_Information VARCHAR(255),
    PRIMARY KEY (CCustomer_ID),
    FOREIGN KEY (CCustomer_ID) REFERENCES CUSTOMER (Customer_ID)
);
CREATE TABLE EMPLOYEE_CONTACT (
    EEmployee_ID INT PRIMARY KEY,
    EContact_Information VARCHAR(255),
    FOREIGN KEY (EEmployee_ID) REFERENCES EMPLOYEE (Employee_ID)
);


