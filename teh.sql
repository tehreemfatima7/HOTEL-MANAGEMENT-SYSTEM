-- Create Database
CREATE DATABASE HostelDB;
USE HostelDB;

-- Students Table
CREATE TABLE Students (
    studentid INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- Rooms Table
CREATE TABLE Rooms (
    roomid INT PRIMARY KEY,
    roomnumber VARCHAR(20),
    capacity INT
);

-- Hostel Fee Table
CREATE TABLE HostelFee (
    feeid INT PRIMARY KEY,
    roomid INT,
    feeamount INT,
    FOREIGN KEY (roomid) REFERENCES Rooms(roomid)
);

-- Payment Table
CREATE TABLE Payment (
    paymentid INT PRIMARY KEY,
    studentid INT,
    feeid INT,
    status VARCHAR(30),
    paymentdate DATE,
    FOREIGN KEY (studentid) REFERENCES Students(studentid),
    FOREIGN KEY (feeid) REFERENCES HostelFee(feeid)
);

-- Insert Students
INSERT INTO Students (studentid, name, department) 
VALUES (1, 'Usman', 'CS'),
       (2, 'Ali', 'IT'),
       (3, 'Kashif', 'SE');

-- Insert Rooms
INSERT INTO Rooms (roomid, roomnumber, capacity) 
VALUES (101, 'A1', 2),
       (102, 'A2', 3),
       (103, 'B1', 2);

-- Insert Hostel Fees
INSERT INTO HostelFee (feeid, roomid, feeamount) 
VALUES (201, 101, 15000),
       (202, 102, 18000),
       (203, 103, 20000);

-- Insert Payments
INSERT INTO Payment (paymentid, studentid, feeid, status, paymentdate)
VALUES (1, 1, 201, 'Payable', NULL),
       (2, 2, 202, 'Payable', NULL),
       (3, 3, 203, 'Payable', NULL);

-- Update Payment (Example: Usman paid his hostel fee)
UPDATE Payment
SET status = 'Paid', paymentdate = GETDATE()
WHERE studentid = 1;

-- View All Payments
SELECT * FROM Payment;

-- Join Students with Payment Status
SELECT Students.studentid, Students.name, Payment.status, Payment.paymentdate
FROM Students
INNER JOIN Payment
ON Students.studentid = Payment.studentid;
