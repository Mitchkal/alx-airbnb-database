-- sql
-- finds total number of bookings by each user using Count function and Group by clause

SELECT COUNT(*) AS `Number of Bookings`, user_id FROM bookings GROUP BY user_id;

-- window function(ROW_NUMBER, RANK)  to rank properties based on the totl number of bookings that they have received
SELECT *, ROW_NUMBER() OVER (PARTITION BY property_id ORDER BY start_date) AS row_num, RANK() OVER (ORDER BY user_id) AS rank FROM bookings;
