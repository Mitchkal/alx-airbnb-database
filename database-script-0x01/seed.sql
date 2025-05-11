-- insert users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('u1-uuid-0001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
('u2-uuid-0002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host'),
('u3-uuid-0003', 'Carol', 'Williams', 'carol@example.com', 'hashed_pw_3', NULL, 'admin');

-- insert properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
('p1-uuid-0001', 'u2-uuid-0002', 'Cozy Cabin', 'A peaceful retreat in the woods', 'Denver, CO', 120.00),
('p2-uuid-0002', 'u2-uuid-0002', 'City Loft', 'Modern apartment in downtown', 'New York, NY', 200.00);

-- insert bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('b1-uuid-0001', 'p1-uuid-0001', 'u1-uuid-0001', '2025-06-01', '2025-06-05', 480.00, 'confirmed'),
('b2-uuid-0002', 'p2-uuid-0002', 'u1-uuid-0001', '2025-07-10', '2025-07-12', 400.00, 'pending');

-- insert payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('pay1-uuid-0001', 'b1-uuid-0001', 480.00, 'credit_card'),
('pay2-uuid-0002', 'b2-uuid-0002', 400.00, 'paypal');

-- insert reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('r1-uuid-0001', 'p1-uuid-0001', 'u1-uuid-0001', 5, 'Absolutely loved the cabin! Peaceful and clean.'),
('r2-uuid-0002', 'p2-uuid-0002', 'u1-uuid-0001', 4, 'Great location but a bit noisy.');

-- insert messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('m1-uuid-0001', 'u1-uuid-0001', 'u2-uuid-0002', 'Hi Bob, is the cabin available for next weekend?'),
('m2-uuid-0002', 'u2-uuid-0002', 'u1-uuid-0001', 'Hi Alice, yes it is available. Feel free to book!');