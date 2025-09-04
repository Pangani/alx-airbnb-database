
## Normalizing the Airbnb Database Schema to 3NF

The normalisation of the airbnb Database schema will involve passing it through 3 principles namely 1NF, 2NF and 3NF.

Consider the entities given: 

- **User**(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)  
- **Property**(property_id, host_id → User.user_id, name, description, location, pricepernight, created_at, updated_at)  
- **Booking**(booking_id, property_id → Property.property_id, user_id → User.user_id, start_date, end_date, total_price, status, created_at)  
- **Payment**(payment_id, booking_id → Booking.booking_id, amount, payment_date, payment_method)  
- **Review**(review_id, property_id → Property.property_id, user_id → User.user_id, rating, comment, created_at)  
- **Message**(message_id, sender_id → User.user_id, recipient_id → User.user_id, message_body, sent_at)

Assume surrogate primary keys are **UUIDs**; all FKs point to those UUIDs.


### 1. First Normal Form (1NF)
By definition, 
- All attributes in all these entities are **atomic** (Each column has single values).
- Each row must be unique, and is uniquely identifiable by a primary key.

*For the airbnb database schema, we see that:*

 **`Property.location`**  
   - For `location` can be unpacked to *address_line, city, region, country and coordinates*
   - **Solution:** Decompose into single-valued attributes (e.g., `address_line`, `city`, `region`, `country_code`, `latitude`, `longitude`).


### 2. Second Normal Form (2NF)
This is build on 1NF by ensuring that all non-key attributes depend on the primary key. By definition, 
- Must already be in 1NF
- All non-key columns must depend on the entire primary key

*On our database schema, we see that:*
- All tables use a single-column surrogate PK → no partial dependencies.  

### 3. Third Normal Form (3NF)

This builds upon 2NF by ensuring that: 
- a non-key attribute must not depend on another non-key attribute.  
- Every non-key attribute must depend **only** on the key (the whole key, and nothing but the key).

*Checking our database schema in 2NF, we note that:*

1) **`Booking.total_price`**  
   - `total_price` is derivable from `start_date`, `end_date`, and the property’s nightly price **at booking time**. Keeping it may create **update anomalies** (e.g., if `Property.price_per_night` changes later).  
   - *Solution:* Should use the nightly rate at the time of booking. Add the field `Booking.unit_price_at_booking`
   - Compute `total_price` in queries as: `DATEDIFF(end_date, start_date) * unit_price_at_booking - discounts + fees`.

2) **ENUMs for `Booking.status` and `Payment.payment_method`**  
   - ENUMs don’t **violate** 3NF by themselves, but they’re rigid and block attaching attributes (e.g., status order, terminal state flag; payment method fees).  
   - **3NF Action:** Normalize to lookup tables: `BookingStatus(status_code, label, is_terminal, sort_order, ...)` and `PaymentMethod(method_code, label, ...)`.  
   - This prevents transitive dependencies if you later add attributes about these codes.

3. **`User.role` → `Role` + `UserRole` (as discussed in 1NF)**  
   - Avoids future multi-valued role anomalies and supports attaching attributes to roles.

4. **`Property.location` decomposition**  
   - Not strictly a 3NF violation **yet**, but decomposition prevents latent transitive dependencies (e.g., postal_code → city/region/country) and supports indexing/filtering.  
   - If you introduce `postal_code` with canonical city/region mappings, consider a reference table to avoid `postal_code → city` transitive dependencies inside `Property`.
