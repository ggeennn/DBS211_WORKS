-- ***********************
-- Name: Yicheng Wang
-- ID: 150868206
-- Name: Ivy Nicole Dioso
-- ID: 190130237
-- Name: Sanjil Amgain
-- ID: 166534230
-- Date: 2025/1/30
-- Purpose: Lab 04 DBS211
-- ***********************
SET AUTOCOMMIT ON;   
-- Q1 
CREATE TABLE employee2 AS 
SELECT * 
FROM employees;
ALTER TABLE employee2 ADD CONSTRAINT pk_employee2 PRIMARY KEY (employeenumber);
ALTER TABLE employee2 ADD CONSTRAINT EMP2_OFFICE_FK FOREIGN KEY (officecode) REFERENCES offices(officecode);
ALTER TABLE employee2 ADD CONSTRAINT EMP2_RTEMP_FK FOREIGN KEY (reportsto) REFERENCES employee2(employeenumber);

-- Q2
ALTER TABLE employee2 
ADD username VARCHAR(50);

-- Q3
DELETE FROM employee2;

-- Q4
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
SELECT * 
FROM employees;


-- Q5
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle, username) 
VALUES (1703, 'Wang', 'Yicheng', 'x2222', 'ywang841@myseneca.ca', 4, 1088, 'Cashier', NULL);

-- Q6
SELECT * 
FROM employee2 
WHERE employeenumber = 1703;

-- Q7
UPDATE employee2 
SET jobtitle = 'Head Cashier' 
WHERE employeenumber = 1703;

-- Q8
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle, username) 
VALUES (1704, 'Fake', 'Employee', 'x2222', 'fake.employee@myseneca.ca', 4, 1703, 'Cashier', NULL);

-- Q9
DELETE FROM employee2 
WHERE employeenumber = 1703; 
-- (Data Integrity) This will not work because another employee is still reporting to this employee.

-- Q10
DELETE FROM employee2 
WHERE employeenumber = 1704;
-- this works because the related data is deleted first

-- Q11
INSERT ALL
INTO employee2 VALUES (1703, 'Wang', 'Yicheng', 'x2222', 'ywang841@myseneca.ca', 4, 1088, 'Cashier', NULL)
INTO employee2 VALUES (1704, 'Fake', 'Employee', 'x2222', 'fake.employee@myseneca.ca', 4, 1088, 'Cashier', NULL)
SELECT * FROM dual;

-- Q12
DELETE FROM employee2 
WHERE employeenumber IN (1703, 1704);

-- Q13
UPDATE employee2 
SET username = LOWER(SUBSTR(firstname, 1, 1)||lastname);

-- Q14
DELETE FROM employee2 
WHERE officecode = 4;
-- WILL NOT WORK: integrity constraint (DBS211_251NGG32.EMP2_RTEMP_FK) violated - child record found

-- Q15
DROP TABLE employee2;
