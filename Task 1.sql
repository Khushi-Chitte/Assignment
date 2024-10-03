
-------------------------------------------------TASK 1 ------------------------------------------------

--create database
CREATE DATABASE TicketBookingSystem;

--show list of database
EXEC sp_databases

USE TicketBookingSystem;

--create all the tables

-- 1. Venu Table
CREATE TABLE Venu (
    venue_id INT PRIMARY KEY IDENTITY(1,1),
    venue_name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL
);
GO


-- 2. Booking Table 
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT, 
    event_id INT,   
    num_tickets INT NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    booking_date DATE NOT NULL
);
GO

-- 3. Event Table
CREATE TABLE Event (
    event_id INT PRIMARY KEY IDENTITY(1,1),
    event_name NVARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    venue_id INT NOT NULL,
    total_seats INT NOT NULL,
    available_seats INT NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    event_type NVARCHAR(20) CHECK (event_type IN ('Movie', 'Sports', 'Concert')),
    booking_id INT, -- Reference to booking
    FOREIGN KEY (venue_id) REFERENCES Venu(venue_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);
GO

-- 4. Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    customer_name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    phone_number NVARCHAR(15) NOT NULL,
    booking_id INT, -- Reference to booking
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);
GO

SELECT * from Venu;
SELECT * from Booking;
SELECT * from Event;
SELECT * from Customer;


ALTER TABLE Booking
ADD CONSTRAINT fk_booking_customer FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE;
GO

ALTER TABLE Booking
ADD CONSTRAINT fk_booking_event FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE;
GO

