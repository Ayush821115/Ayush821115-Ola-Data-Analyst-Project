CREATE DATABASE Ola;
use	Ola;

SELECT *
FROM bookings;

-- 1. Retrieve all successful bookings
CREATE VIEW successful_booking AS
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';

SELECT * 
FROM successful_booking;

-- 2. Find the average ride distance from each vehicle
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS Avg_Distance
FROM bookings
GROUP BY Vehicle_Type;

SELECT *
FROM ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled ride by customers
CREATE VIEW ride_canceled_by_customer AS
SELECT COUNT(Booking_Status)
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT *
FROM ride_canceled_by_customer;

-- 4. List top 5 customers who booked the hishest number of rides
CREATE VIEW top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT *
FROM top_5_customers;

-- 5. Get the number of rides canceled by drivers due to personal and car-related issues
 CREATE VIEW canceled_by_drivers_p_and_c AS
 SELECT COUNT(*)
 FROM bookings
 WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
 
 SELECT *
 FROM canceled_by_drivers_p_and_c;
 
 -- 6. Find the maximum and minimum driver ratings from prime sedan booking
 CREATE VIEW max_min_driver_rating AS
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT *
FROM max_min_driver_rating;

-- 7. Retrive all rides where payment was made using UPI
CREATE VIEW payment_by_upi AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';

SELECT *
FROM payment_by_upi;

-- 8. Find the average customer rating per vehicle type
CREATE VIEW avg_customer_rating_per_vehicle AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

SELECT *
FROM avg_customer_rating_per_vehicle;

-- 9. Calculate the total booking value of rides completed successfully
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value)
FROM bookings
WHERE Booking_Status = 'Success';

SELECT *
FROM total_successful_ride_value;

-- 10. List all incomplete rides along with the reason
CREATE VIEW incomplete_rides_reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * 
FROM incomplete_rides_reason;
