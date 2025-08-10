Create Database Ola;
Use Ola;

Create View Successful_Bookings AS
SELECT * FROM booking 
WHERE Booking_Status = 'Success';

Select *  From  Successful_Bookings;

Create View ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM booking
GROUP BY Vehicle_Type;

Select * from ride_distance_for_each_vehicle;


Create View  canceled_rides_by_customers AS
SELECT COUNT(*) FROM booking
WHERE Booking_Status = 'Canceled by Customer';

SELECT * from canceled_rides_by_customers;

Create View Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM booking
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

Select * from Top_5_Customers;

Create View Rides_Canceled_by_Drivers_P_C_Issues AS
SELECT  COUNT(*) FROM booking
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

Create View Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM booking WHERE Vehicle_Type = 'Prime Sedan';

Create View  UPI_Payment AS
SELECT * FROM booking
WHERE Payment_Method = 'UPI'; 

Create View AVG_Cust_Rating AS 
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM booking
GROUP BY Vehicle_Type;


Create View total_successful_ride_value AS
SELECT SUM(Booking_Value) as total_successful_value
FROM booking
WHERE Booking_Status = 'Success';



Create View Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM booking
WHERE Incomplete_Rides = 'Yes';