-- sql
-- using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT * FROM bookings INNER JOIN users ON bookings.user_id = users.user_id;

-- using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT * FROM properties LEFT JOIN reviews ON properties.property_id = reviews.property_id WHERE reviews.review_id IS NULL;

--  using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT * FROM users LEFT OUTER JOIN bookings ON users.user_id = bookings.user_id;
