show databases;
use farmer_joes;
select * from Wholesale_Order;
select * from Supplier;
select * from Retail_Order;
select * from Promotion;
select * from Employee;
select * from Promotion;
select * from Department;
select * from Default_Order;
select * from Customer;
select * from fulfills;

-- 1) Show a count of the largest population: How many total products are there?
SELECT COUNT(*) AS total_products
FROM Product;

-- 2) Show a listing of a key entity in the database: List of employees in the grocery store
SELECT Fname, LName
FROM Employee;

-- 3) Show a list of entities that must function together: 
SELECT Product_ID, Product_Name, Stock_Quantity, Supplier_ID, Company_Name from product 
	JOIN supplier on product.PSupplier_ID = supplier.Supplier_ID;
    
-- Shows a list of entities that must function together (Employee and Department)
SELECT Employee_ID, Fname, LName, Department_ID, Department_Name from employee
JOIN department ON employee.EDepartment_ID = department.Department_ID;

-- 4) Compute the total price of a given retail order after accounting for promotional discounts
-- Select the Order number and the sum of all the (product.Retail_price - promotion.Discount_Amount) (Total_Price) from Fulfills
-- Join the product and promotion tables on the product_id and finally filter the OOrder_ID to be 1.
SELECT OOrder_ID, SUM(product.Retail_Price - promotion.Discount_Amount) AS Total_Price
FROM fulfills
JOIN product ON product.Product_ID = fulfills.PProduct_ID 
JOIN promotion ON promotion.Promo_Product_ID = fulfills.PProduct_ID
WHERE fulfills.OOrder_ID = 1;

-- Shows the average price of all the Retail_Prices
SELECT AVG(Retail_Price) AS average_price
FROM Product;

-- Shows the average salary of all employees at Farmer Joes
SELECT AVG(Salary) AS average_salary
FROM Employee;




-- 5) Shows the expiry date of of the products
select * from product
ORDER BY product.Exp_Date;

-- 6) Show a count of all the cashiers 
SELECT COUNT(*) AS total_Cashiers
FROM Employee 
WHERE Employee.EDepartment_ID = 2;

