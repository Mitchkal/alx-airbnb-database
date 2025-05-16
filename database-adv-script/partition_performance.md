# Impact of partitioning

- Creating Partitions in the bookings table based on the starting dates renders data retrieval by queries much faster compared to when the table is not partitioned. This makes it easier to for example search for boookings based on date.
- When creating partitions it is important to have the parameter/attribute used in the partitioning as a primary key.
