-- initial query that retrieves all bookings along with the user details, property details, and payment details
EXPLAIN SELECT *
 FROM users
 INNER JOIN bookings ON users.user_id =  bookings.user_id 
 INNER JOIN properties ON bookings.property_id = properties.property_id
 INNER JOIN payments ON bookings.booking_id = payments.booking_id WHERE payment_method LIKE 'paypal' AND amount > 0.0;

--- improved query to make it more efficient
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM bookings AS b
INNER JOIN users AS u ON b.user_id = u.user_id
INNER JOIN properties AS p ON b.property_id = p.property_id
INNER JOIN payments AS pay ON b.booking_id = pay.booking_id WHERE payment_method LIKE 'paypal' AND amount > 0.0
ORDER BY b.start_date DESC;