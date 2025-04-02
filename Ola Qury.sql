Create Database Ola;
use Ola;

SELECT * FROM booking;

#1 Reterive all Sucessful Bookings
create view Succesful_Bookings As 
select * from booking 
where Booking_status="Success";

Select * from Succesful_Bookings;

#2 Find the average ride distance for each vehicle type 
create view Avg_Distance as
Select Vehicle_Type,avg(Ride_Distance) from Booking
group by Vehicle_Type;

Select * from Avg_Distance;

#3 Get the total number of canceled rides by customers .
create view Cancel_Rides_Customers As
select count(Canceled_Rides_by_Customer) from booking
where Booking_status="Canceled by Customer";

-- ALternate way to do this.
select count(*) from booking
where Booking_status="Canceled by Customer";

Select * from Cancel_Rides_Customers;

#4 List the top 5 customers who booked the highest number of rides
create view Customers_Highest_rides as 
select Customer_Id,count(Booking_Id) as total_sales
from booking
group by Customer_Id
order by total_sales Desc
limit 5;

select * from Customers_Highest_rides;

#5  Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Canceled_by_driver_Personal_Car_related_issue as 
select count(*) as  Canceled_by_driver_Personal_Car_related_issue 
from booking
where Canceled_Rides_by_Driver ='Personal & Car related issue';

select * from Canceled_by_driver_Personal_Car_related_issue;

#6  Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_Rating_for_prime_sedan as
select min(Driver_Ratings) as min_rating , Max(Driver_Ratings) as max_rating
from Booking
where Vehicle_Type='Prime Sedan';

select * from max_min_driver_Rating_for_prime_sedan ;

# 7. Retrieve all rides where payment was made using UPI
create view UPI_Payment as
select * from booking
where Payment_method ='UPI';

select * from UPI_Payment;

#8  Find the average customer rating per vehicle type
create  view Avg_Cust_rating as 
select Vehicle_type,avg(Customer_Rating) as Avg_Customer_rating
from booking
group by vehicle_type;

select * from Avg_Cust_rating;

#9. Calculate the total booking value of rides completed successfully
create view total_successful_ride_value as
select sum(booking_value) as total_booking_value
from booking
where booking_status ='Success';

select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason
create view Incomplete_Rides_Reason as
select Booking_Id,Incomplete_Rides_Reason
from booking
where incomplete_Rides ='Yes';

select * from Incomplete_Rides_Reason ;
