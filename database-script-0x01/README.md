### Database Schema Overview

The Airbnb database schema models the core entities and relationships of a booking platform while following Third Normal Form (3NF) principles for data integrity and efficiency.  

#### Key Entities
- *User* – Stores account details for guests, hosts, and admins.  
- *Property* – Listings created by hosts with descriptions, locations, and pricing.  
- *Booking* – Links guests to properties with reservation dates, total price, and status.  
- *Payment* – Tracks booking payments, linked to a lookup table of valid payment methods.  
- *Review* – Guest ratings and comments on properties.  
- *Message* – Communication between users (e.g., guest ↔ host).  
- *PaymentMethod* – A normalized lookup table that ensures valid payment methods.  

#### Highlights
- **Normalization** – Reduces redundancy (e.g., payment methods stored once).  
- **Constraints** – Enforces data quality (unique emails, valid statuses, rating ranges).  
- **Indexes** – Improve query performance for frequent lookups (`email`, `property_id`, `booking_id`).  
- **Scalability** – The design can be extended easily to include additional features like availability calendars or property amenities.  
