-- sql

EXPLAIN SELECT * FROM users WHERE role is 'admin';
CREATE INDEX idx_users_role ON users(role);
EXPLAIN SELECT * FROM users WHERE role is 'admin';


CREATE INDEX idx_users_email ON users(email);

CREATE INDEX idx_bookings_start_date ON bookings(start_date);

CREATE INDEX idx_bookings_status ON bookings(status);

CREATE INDEX idx_properties_location ON properties(location);

CREATE INDEX idx_properties_name ON properties(name);

CREATE INDEX idx_properties_price ON properties(pricepernight);
