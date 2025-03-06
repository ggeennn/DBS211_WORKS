-- ***********************
-- Name: Yicheng Wang
-- ID: 150868206
-- Name: Ivy Nicole Dioso
-- ID: 190130237
-- Name: Sanjil Amgain
-- ID: 166534230
-- Date: 2025/02/14
-- Purpose: Lab 06 DBS211
-- ***********************
SET AUTOCOMMIT ON;
-- Part A
-- Q1
CREATE TABLE L6_MOVIES (
mid INT PRIMARY KEY,
title VARCHAR(35) NOT NULL,
releaseYear INT NOT NULL,
director INT NOT NULL,
score DECIMAL(3,2) CHECK (score > 0 AND score < 5)
);

CREATE TABLE L6_ACTORS (
    aid INT PRIMARY KEY,         
    firstName VARCHAR(20) NOT NULL,   
    lastName VARCHAR(30) NOT NULL   
);

CREATE TABLE L6_CASTINGS (
    movieid INT NOT NULL REFERENCES L6_MOVIES(mid),             
    actorid INT NOT NULL REFERENCES L6_ACTORS(aid),             
    PRIMARY KEY (movieid, actorid)
);

CREATE TABLE L6_DIRECTORS (
    directorid INT PRIMARY KEY,      
    firstname VARCHAR(20) NOT NULL,    
    lastname VARCHAR(30) NOT NULL     
);

-- Q2
ALTER TABLE L6_MOVIES
ADD CONSTRAINT fk_director 
    FOREIGN KEY (director) 
    REFERENCES L6_DIRECTORS(directorid);

-- Q3
ALTER TABLE L6_MOVIES ADD UNIQUE (title);

-- Q4
INSERT ALL  
  INTO L6_DIRECTORS VALUES (1010, 'Rob', 'Minkoff')
  INTO L6_DIRECTORS VALUES (1020, 'Bill', 'Condon')
  INTO L6_DIRECTORS VALUES (1050, 'Josh', 'Cooley')
  INTO L6_DIRECTORS VALUES (2010, 'Brad', 'Bird')
  INTO L6_DIRECTORS VALUES (3020, 'Lake', 'Bell')
SELECT * FROM DUAL;

INSERT ALL
  INTO L6_MOVIES VALUES (100, 'The Lion King', 2019, 3020, 3.50)
  INTO L6_MOVIES VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
  INTO L6_MOVIES VALUES (300, 'Toy Story 4', 2019, 1020, 4.50)
  INTO L6_MOVIES VALUES (400, 'Mission Impossible', 2018, 2010, 4.99)  -- 将5.00改为4.99
  INTO L6_MOVIES VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90)
SELECT * FROM DUAL;

-- Q5
-- Yes, the order is critical. 
-- Proper drop order to avoid foreign key constraint errors
DROP TABLE L6_CASTINGS;  
DROP TABLE L6_MOVIES;    
DROP TABLE L6_ACTORS;   
DROP TABLE L6_DIRECTORS;

-- Part B
-- Q6
CREATE TABLE employee2 AS
SELECT * 
FROM employees;

-- Q7
ALTER TABLE employee2 ADD username VARCHAR(20);

-- Q8
DELETE FROM employee2;

-- Q9
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
SELECT * 
FROM employees;

-- Q10
UPDATE employee2
SET lastname = 'Wang',
    firstname = 'Yicheng'
WHERE employeenumber = 1002;

-- Q11
UPDATE employee2
SET username = LOWER(SUBSTR(firstname, 1, 1) || lastname);

-- Q12
DELETE FROM employee2 
WHERE officecode = 4;

-- Q13
DROP TABLE employee2;