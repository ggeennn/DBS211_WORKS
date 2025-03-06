-- ***********************
-- Name: Yicheng Wang
-- ID: 150868206
-- Name: Ivy Nicole Dioso
-- ID: 190130237
-- Name: Sanjil Amgain
-- ID: 166534230
-- Date: 2025/03/06
-- Purpose: Lab 07 DBS211
-- ***********************

--PART A - Transactions
--Q1
-- 1. SET TRANSACTION READ WRITE;
-- 2. START TRANSACTION;
-- 3. SET AUTOCOMMIT OFF; + first DML statement
-- 4. DDL statement

--Q2
CREATE TABLE newEmployees AS
SELECT * FROM employees
WHERE 1=0;

--Q3
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

--Q4
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', 1, NULL, 'Sales Rep')
SELECT * FROM dual;

--Q5
SELECT * 
FROM newEmployees;
-- 5 rows

--Q6
ROLLBACK;
SELECT * FROM newEmployees;
-- 0 rows

--Q7
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', 1, NULL, 'Sales Rep')
SELECT * FROM dual;
COMMIT;
SELECT * FROM newEmployees;
-- 5 rows

--Q8
UPDATE newEmployees
SET jobTitle = 'unknown';

--Q9
COMMIT;

--Q10
ROLLBACK;
--a. 5 rows
SELECT * 
FROM newEmployees 
WHERE jobTitle = 'unknown';
--b. No
--c. ROLLBACK only undoes the uncommitted (task6) INSERT operation.

--Q11
SET TRANSACTION READ WRITE;
DELETE FROM newEmployees;

--Q12
CREATE VIEW vwNewEmps AS
SELECT * FROM newEmployees
ORDER BY lastname, firstname;

--Q13
ROLLBACK;
--a. 0 rows
--b. No, DDL in Q12 already commits the transaction in Q11

--Q14
SET TRANSACTION READ WRITE;
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', 1, NULL, 'Sales Rep')
SELECT * FROM dual;

--Q15
SAVEPOINT insertion;

--Q16
UPDATE newEmployees
SET jobTitle = 'unknown';
SELECT * FROM newEmployees;

--Q17
ROLLBACK TO insertion;
SELECT * FROM newEmployees;
-- jobTitle = 'Sales Rep' 
-- the data is rolled back to the insertion savepoint, which is the state after the INSERT but before the UPDATE.

--Q18
ROLLBACK;
SELECT * FROM newEmployees;
-- 0 rows
-- the basic ROLLBACK undoes the entire transaction in Q14 (before the INSERT)

--PART B - Permissions
--Q19
REVOKE ALL ON newEmployees FROM PUBLIC;

--Q20
GRANT SELECT ON newEmployees TO DBS211_251NGG10;

--Q21
GRANT INSERT, UPDATE, DELETE ON newEmployees TO DBS211_251NGG10;

--Q22
REVOKE ALL ON newEmployees FROM DBS211_251NGG10;

--PART C – Clean up
--Q23
DROP VIEW vwNewEmps;
DROP TABLE newEmployees;