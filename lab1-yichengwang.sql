-- ----------------------------------
-- DBS211 - Lab 01
-- Name: <Yicheng Wang>
-- StudentID: <150868206>
-- Date: <2025-01-09>
-- ----------------------------------

-- Q1 
-- 8 tables
-- Tables: offices, employees, customers, orders, orderdetails, payments, products, productlines

-- Q2
SELECT COUNT(*) FROM customers;
-- 122 rows

-- Q3
SELECT * FROM customers;

-- Q4
-- 13 columns
-- customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, 
-- addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit

-- Q5
-- First row values:
-- customerNumber: 103 (INT)
-- customerName: 'Atelier graphique' (VARCHAR(50))
-- contactLastName: 'Schmitt' (VARCHAR(50))
-- contactFirstName: 'Carine' (VARCHAR(50))
-- phone: '40.32.2555' (VARCHAR(50))
-- addressLine1: '54, rue Royale' (VARCHAR(50))
-- addressLine2: NULL (VARCHAR(50))
-- city: 'Nantes' (VARCHAR(50))
-- state: NULL (VARCHAR(50))
-- postalCode: '44000' (VARCHAR(15))
-- country: 'France' (VARCHAR(50))
-- salesRepEmployeeNumber: 1370 (INT)
-- creditLimit: 21000.00 (DECIMAL(10,2))

-- Q6
-- Table Name      Rows    Columns
-- offices         7       9
-- employees       23      8
-- customers       122     13
-- products        110     9
-- productlines    7       4
-- orders          326     7
-- orderdetails    2996    5
-- payments        273     4

-- Q7
-- 2996 rows in orderdetails table

-- Q8
DESC offices;
/*
Name         Null?    Type         
------------ -------- ------------ 
OFFICECODE   NOT NULL VARCHAR2(10) 
CITY         NOT NULL VARCHAR2(50) 
PHONE        NOT NULL VARCHAR2(50) 
ADDRESSLINE1 NOT NULL VARCHAR2(50) 
ADDRESSLINE2          VARCHAR2(50) 
STATE                 VARCHAR2(50) 
COUNTRY      NOT NULL VARCHAR2(50) 
POSTALCODE   NOT NULL VARCHAR2(15) 
TERRITORY    NOT NULL VARCHAR2(10) 
*/
describe offices;
/*
Name         Null?    Type         
------------ -------- ------------ 
OFFICECODE   NOT NULL VARCHAR2(10) 
CITY         NOT NULL VARCHAR2(50) 
PHONE        NOT NULL VARCHAR2(50) 
ADDRESSLINE1 NOT NULL VARCHAR2(50) 
ADDRESSLINE2          VARCHAR2(50) 
STATE                 VARCHAR2(50) 
COUNTRY      NOT NULL VARCHAR2(50) 
POSTALCODE   NOT NULL VARCHAR2(15) 
TERRITORY    NOT NULL VARCHAR2(10) 
*/


-- Q9
-- Statement 1: Shows all employees data
SELECT * FROM employees;
-- Statement 2: Shows all customers data sorted by last name
SELECT * FROM customers ORDER BY contactLastName;

-- Q10
SELECT COUNT(*) FROM user_constraints WHERE table_name = 'PRODUCTS';
-- 11

-- Q11
-- Set line numbers: Tools -> Preferences -> Code Editor -> Line Gutter -> Show Line Numbers

-- Q12
-- Set font size: Tools -> Preferences -> Code Editor -> Fonts