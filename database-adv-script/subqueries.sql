-- sql
-- query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT * FROM properties WHERE property_id IN (SELECT property_id FROM reviews GROUP BY property_id HAVING AVG(rating) > 4);

-- a correlated subquery to find users who have made more than 3 bookings.
SELECT * FROM users u WHERE ( SELECT COUNT(*) FROM bookings b WHERE u.user_id = b.user_id) > 3;
