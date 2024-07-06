Select *
From hotel_reservations;

-- 1. What is the total number of reservations in the dataset?
Select Count(*) as total_reservations
From hotel_reservations;

-- 2. Which meal plan is the most popular among guests?
Select type_of_meal_plan, Count(type_of_meal_plan) as count
From hotel_reservations
Group By type_of_meal_plan
Order By count DESC;

-- 3. What is the average price per room for reservations involving children?
Select Avg(avg_price_per_room) as avg_price_involving_children
From hotel_reservations
Where no_of_children > 0;

-- 4. How many reservations were made for the year 20X18?
Select Count(*) as total_reservations_2018
From hotel_reservations
Where arrival_date LIKE "_%_%2018"; 

-- 5. What is the most commonly booked room type?
Select room_type_reserved, Count(*) as count
From hotel_reservations
Group By room_type_reserved
Order By count DESC;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
Select Count(*) as weekend_reservations
From hotel_reservations
Where no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
Select MAX(lead_time) as highest_lead_time, MIN(lead_time) as lowest_lead_time
From hotel_reservations;

-- 8. What is the most common market segment type for reservations?
Select market_segment_type, Count(*) as count
From hotel_reservations
Group By market_segment_type
Order By count DESC;

-- 9. How many reservations have a booking status of "Confirmed"?
Select booking_status, Count(*) as confirmed_reservations
From hotel_reservations
Where booking_status = "Not_Canceled";

-- 10. What is the total number of adults and children across all reservations?
Select SUM(no_of_adults) as total_adults, SUM(no_of_children) as total_children
From hotel_reservations;

-- 11. What is the average number of weekend nights for reservations involving children?
Select Avg(no_of_weekend_nights) as avg_weekend_nights
From hotel_reservations
Where no_of_children > 0;

-- 12. How many reservations were made in each month of the year?
Select month(STR_TO_DATE(arrival_date, "%d-%m-%Y")) as `Month`, Count(*) as reservations
From hotel_reservations
Group By month(STR_TO_DATE(arrival_date, "%d-%m-%Y"))
Order By `Month`;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
Select room_type_reserved, Avg(no_of_weekend_nights) as avg_weekend_nights, Avg(no_of_week_nights) as avg_week_nights,
Avg(no_of_weekend_nights + no_of_week_nights) as avg_total_nights
From hotel_reservations
Group By room_type_reserved
Order By room_type_reserved ASC;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
Select room_type_reserved, Count(*) as reservations, Avg(avg_price_per_room) as average_price
From hotel_reservations
Where no_of_children > 0
Group By room_type_reserved
Order By reservations DESC;

-- 15. Find the market segment type that generates the highest average price per room.
Select market_segment_type, Avg(avg_price_per_room) as avg_price_per_room
From hotel_reservations
Group By market_segment_type
Order By avg_price_per_room DESC;