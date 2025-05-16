-- sql
-- drop initial table if it exists

DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    booking_id CHAR(36),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)


PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);



EXPLAIN SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';