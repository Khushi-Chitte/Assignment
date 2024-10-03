

-------------------------------------------TASK 2-------------------------------------------------

USE TicketBookingSystem;

-- Insert into Venu
INSERT INTO Venu (venue_name, address)
VALUES
('Grand Theatre', '123 Main Street, Mumbai'),
('Concert Arena', '456 Music Avenue, Delhi'),
('Movie Hall', '789 Film Road, Pune'),
('Opera House', '101 Opera Blvd, Ahmedabad'),
('Sports Stadium', '202 Stadium Road, Jaipur'),
('Drama Theatre', '303 Drama Street, Bhopal'),
('Open Air Cinema', '404 Outdoor Park, Bangalore');

-- Insert into Event
INSERT INTO Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type)
VALUES
('The Lion King Musical', '2024-10-05', '19:00:00', 1, 200, 150, 50.00, 'Concert'),
('Rock Concert', '2024-10-12', '18:30:00', 2, 500, 300, 75.00, 'Concert'),
('Avengers: Endgame', '2024-10-15', '20:00:00', 3, 100, 70, 12.50, 'Movie'),
('Phantom of the Opera', '2024-11-05', '20:00:00', 4, 300, 270, 80.00, 'Concert'),
('Football Championship', '2024-10-22', '17:00:00', 5, 1000, 750, 100.00, 'Sports'),
('Shakespearean Play', '2024-12-01', '18:00:00', 6, 200, 190, 60.00, 'Concert'),
('Outdoor Movie Night', '2024-10-10', '19:30:00', 7, 150, 100, 20.00, 'Movie');

-- Insert into Customer
INSERT INTO Customer (customer_name, email, phone_number)
VALUES
('John Doe', 'john.doe@example.com', '9876543210'),
('Jane Smith', 'jane.smith@example.com', '9876543211'),
('Alice Brown', 'alice.brown@example.com', '9876543212'),
('Mark Johnson', 'mark.johnson@example.com', '9876543213'),
('Emma Wilson', 'emma.wilson@example.com', '9876543214'),
('Sophia Miller', 'sophia.miller@example.com', '9876543215'),
('Liam Anderson', 'liam.anderson@example.com', '9876543216');

--Insert into Booking 
INSERT INTO Booking (customer_id, event_id, num_tickets, total_cost, booking_date)
VALUES 
(1, 1, 2, 100.00, '2024-09-25'),
(2, 2, 3, 225.00, '2024-09-26'),
(3, 3, 4, 50.00, '2024-09-27'),
(4, 4, 2, 160.00, '2024-09-28'),
(5, 5, 1, 25.00, '2024-09-28'),
(6, 6, 5, 300.00, '2024-09-29'),
(7, 7, 3, 60.00, '2024-09-30');



SELECT * from Venu;
SELECT * from Booking;
SELECT * from Event;
SELECT * from Customer;

--TASK2 Q2 List all events
SELECT 
	 E.event_id,
	 E.event_name,
	 E.event_date,
	 E.event_time,
	 V.venue_name,
	 E.total_seats,
	 E.available_seats,
	 E.ticket_price,
	 E.event_type
 FROM Event E
 JOIN Venu V
 ON E.venue_id = V.venue_id

 --Task2 Q3 select events with available tickets
 SELECT event_id,event_name,event_date,event_time,total_seats,available_seats,ticket_price,event_type
 FROM Event
 WHERE available_seats>0

 --Task2 Q4 select events name partial match with 'cup'
 SELECT event_name
 FROM Event
 WHERE event_name LIKE '%cup%'


 --Task2 Q5 select events with ticket price range is between 1000 to 2500
 SELECT *
 FROM Event
 WHERE ticket_price BETWEEN 1000 AND 2500

 --Task2 Q6 retrieve events with dates falling within a specific range
SELECT * 
FROM Event
WHERE event_date BETWEEN '2024-10-1' AND '2024-10-20'

--Task2 Q7  retrieve events with available tickets that also have "Concert" in their name
SELECT * 
FROM Event
WHERE available_seats>0
AND event_type LIKE '%Concert%'


--Task2 Q8 retrieve users in batches of 5, starting from the 6th user
SELECT * 
FROM Customer 
ORDER BY customer_id
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY


--Task2 Q9 retrieve bookings details contains booked no of ticket more than 4
SELECT * 
FROM Booking
WHERE num_tickets>4


--Task2 Q10 o retrieve customer information whose phone number end with ‘000’SELECT *FROM CustomerWHERE phone_number LIKE '%000'--Task2 Q11  retrieve the events in order whose seat capacity more than 15000SELECT * FROM EventWHERE total_seats>15000ORDER BY total_seats;--Task2 Q12 select events name not start with ‘x’, ‘y’, ‘z’SELECT event_name FROM EventWhere event_name NOT LIKE 'x%' AND event_name NOT LIKE 'y%' AND event_name NOT LIKE 'z%'