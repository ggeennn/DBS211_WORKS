-- Create independent tables first
CREATE TABLE Airline (
    Airline_code CHAR(2) PRIMARY KEY,
    Airline_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Aircraft (
    Aircraft_code VARCHAR(10) PRIMARY KEY,
    Aircraft_desc VARCHAR(50) NOT NULL
);

CREATE TABLE Airport (
    Airport_code CHAR(3) PRIMARY KEY,
    Airport_name VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Traveler (
    traveler_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F', 'O'))
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    booking_date DATE NOT NULL
);

-- Create tables with FK dependencies
CREATE TABLE Flight (
    Flight_num VARCHAR(10) PRIMARY KEY,
    Airline_code CHAR(2) REFERENCES Airline NOT NULL,
    Aircraft_code VARCHAR(10) REFERENCES Aircraft NOT NULL,
    operatedBy CHAR(2) REFERENCES Airline,
    dep_airport CHAR(3) REFERENCES Airport NOT NULL,
    arr_airport CHAR(3) REFERENCES Airport NOT NULL
);

CREATE TABLE BookingRecord (
    BookingID INT REFERENCES Booking,
    Flight_num VARCHAR(10) REFERENCES Flight,
    dep_datetime DATE NOT NULL,
    arr_datetime DATE NOT NULL,
    PRIMARY KEY (BookingID, Flight_num)
);

CREATE TABLE TICKET (
    eticket_num VARCHAR(15) PRIMARY KEY,
    BookingID INT REFERENCES Booking NOT NULL,
    traveler_id INT REFERENCES Traveler NOT NULL,
    Meal_preference VARCHAR(20),
    ticket_price DECIMAL(10,2) NOT NULL,
    taxes_fees DECIMAL(10,2) NOT NULL
);

-- Insert into Airline
INSERT INTO Airline (Airline_code, Airline_Name) VALUES ('AF', 'Air France');

-- Insert into Aircraft (assumed)
INSERT INTO Aircraft (Aircraft_code, Aircraft_desc) VALUES ('A380', 'Airbus A380');

-- Insert into Airport
INSERT INTO Airport (Airport_code, Airport_name, City) VALUES ('YYZ', 'Toronto Pearson Intl', 'Toronto');
INSERT INTO Airport (Airport_code, Airport_name, City) VALUES ('CDG', 'Charles de Gaulle', 'Paris');

-- Insert into Flight
INSERT INTO Flight (Flight_num, Airline_code, Aircraft_code, operatedBy, dep_airport, arr_airport)
VALUES ('AF393', 'AF', 'A380', NULL, 'YYZ', 'CDG');

-- Insert into Booking
INSERT INTO Booking (BookingID, booking_date) VALUES (56753365, TO_DATE('01-JUN-19', 'DD-MON-YY'));
INSERT INTO Booking (BookingID, booking_date) VALUES (56753936, TO_DATE('02-JUN-19', 'DD-MON-YY'));

-- Insert into BookingRecord
INSERT INTO BookingRecord (BookingID, Flight_num, dep_datetime, arr_datetime)
VALUES (
    56753365,
    'AF393',
    TO_DATE('22-JUN-19 21:08:00', 'DD-MON-YY HH24:MI:SS'),
    TO_DATE('22-JUN-19 22:00:00', 'DD-MON-YY HH24:MI:SS')
);

-- Insert into Traveler
INSERT ALL
    INTO Traveler (traveler_id, first_name, last_name, gender) VALUES (111, 'Andrew', 'Smith', 'M')
    INTO Traveler (traveler_id, first_name, last_name, gender) VALUES (112, 'Mariam', 'Daoud', 'F')
    INTO Traveler (traveler_id, first_name, last_name, gender) VALUES (113, 'Yasmine', 'Ch', 'F')
    INTO Traveler (traveler_id, first_name, last_name, gender) VALUES (114, 'Hasan', 'Ch', 'M')
SELECT * FROM dual;

-- Insert into TICKET
INSERT ALL
    INTO TICKET (eticket_num, BookingID, traveler_id, Meal_preference, ticket_price, taxes_fees)
    VALUES ('573480996631', 56753936, 111, 'Vegetarian', 1200, 182)
    INTO TICKET (eticket_num, BookingID, traveler_id, Meal_preference, ticket_price, taxes_fees)
    VALUES ('573480996619', 56753365, 112, 'Halal', 1353, 180)
    INTO TICKET (eticket_num, BookingID, traveler_id, Meal_preference, ticket_price, taxes_fees)
    VALUES ('573480996620', 56753365, 113, 'Vegetarian', 1142, 180)
    INTO TICKET (eticket_num, BookingID, traveler_id, Meal_preference, ticket_price, taxes_fees)
    VALUES ('0573480996621', 56753365, 114, 'Halal', 1142, 180)
SELECT * FROM dual;


--P3 Q1
SELECT
    Flight_num,
    Airline_code,
    Airline_Name,
    Aircraft_code,
    Aircraft_desc,
    dep_airport AS departure_airport_code,
    ap1.Airport_name AS departure_airport_name,
    arr_airport AS arrival_airport_code,
    ap2.Airport_name AS arrival_airport_name
FROM Flight 
JOIN Airline  USING(Airline_code)
JOIN Aircraft USING(Aircraft_code)
JOIN Airport ap1 ON dep_airport = ap1.Airport_code
JOIN Airport ap2 ON arr_airport = ap2.Airport_code
WHERE Flight_num = 'AF393';
-- 1 row affected

--P3 Q2
SELECT
    BookingID,
    booking_date,
    Flight_num,
    dep_airport AS departure_airport_code,
    TO_CHAR(dep_datetime, 'DD-MON-YY HH24:MI:SS') AS departure_date_time,
    arr_airport AS arrival_airport_code,
    TO_CHAR(arr_datetime, 'DD-MON-YY HH24:MI:SS') AS arrival_date_time
FROM BookingRecord
JOIN Booking USING(BookingID)
JOIN Flight USING(Flight_num)
WHERE BookingID = 56753365
ORDER BY dep_datetime;
-- 1 row affected

--P3 Q3
SELECT
    BookingID,
    eticket_num,
    first_name AS traveler_first_name,
    last_name AS traveler_last_name
FROM TICKET
JOIN Traveler USING(traveler_id)
WHERE BookingID = 56753365;
-- 3 row affected

--P3 Q4
SELECT
    SUM(ticket_price + taxes_fees) AS total_fees
FROM TICKET
WHERE BookingID = 56753365;
-- 1 row affected

--P3 Q5
CREATE VIEW Book_ticket AS
SELECT
    b.BookingID,
    COUNT(t.eticket_num) AS number_of_tickets
FROM Booking b
LEFT JOIN TICKET t ON b.BookingID = t.BookingID
GROUP BY b.BookingID;
-- 2 row affected
