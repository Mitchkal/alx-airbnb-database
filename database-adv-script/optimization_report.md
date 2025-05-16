with the initial Query, Explain showed the following inefficiencies:

1. 🔴 Table payments: full table scan (type = ALL)
   Key = NULL: No index is being used.

- We are referencing booking_id, and although it's a foreign key, it doesn't guarantee an index since in MySQL 5.7, foreign keys do not automatically create indexes unless explicitly defined.
- We thus need an index on booking_id in payments.

2. 🔴 Table bookings: full table scan (type = ALL)
   Key = NULL: Not using any of its indexes.

"Using join buffer (Block Nested Loop)" means performance will degrade rapidly with data growth.

- Possible causes include

- - No suitable covering index for the join sequence.

- - Index not properly optimized for the current join order.

- We need a composite index on booking_id, property_id, and user_id if queries frequently join all 3.

* Alternatively, an index on bookings user_id will at least be suffcient

3. Table properties and users: using eq_ref
   This is optimal. eq_ref is the best join type — it means MySQL expects one matching row.

- Indexes are being used here (PRIMARY).

On the query, since we initially use SELECT \*, we incuur a high dat transfer and memory usage. We are also not ordering the output to maintain user relevance. The query is improved by selecting sepcific columns, utilizing table aliases to improve readability and clarity and by ordering the output by start date in decreasing order. Column names prefixed with table aliases removes ambiguity and makes debugging easier.
