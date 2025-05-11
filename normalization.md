# Dtabase normalization

Database normalization is the process of organizing data in a database to reduce redundancy and improve integrity. It encompasses subdividing large tables into small ones and defining relationships between them; using normal forms.

## First Normal Form

The goal here is to remove repeating groups and ensure atomicity.
Each column must contain indivisible values and each record should be unique.
There should be no repeating groups or arrays in a single column e.g:
before 1NF:

- user :email, name

after 1NF:

- user : email
- user : name

## Second Normal Form (2NF)

The next goal is to eliminate partial dependencies. The dta tales should first be in 1NF and all non key attributes must be fully dependent on an entire primary key, not just part of it.
example:

- Before 2NF: |UserId|BookingId|UserName|
  Here the user_name depends on the user_id, not on a combination of user_id + booking_id

After the 2NF, we split into two tables:

- User(UserId, UserName)
- Bookings(UserId, BookingId)

## Third Normal Form

The goal here is to eliminate transitive dependencies. The dta should be in 2NF and then the non-key attributes must not depend on other non-key attributes.
example:
Before 3NF:

- |UserId|UserName|property|host|
  Here, Host depnds on property, which is not a key.

After 3NF, we have:

- user(UserId, UserName, Booking)
- Property(property, host)
