### Entities & Attributes
<br>
The following are the entities and their attributes for this project:

**User**
user_id (PK)
first_name
last_name
email (unique)
password_hash
phone_number
role (guest, host, admin)
created_at

**Property**
property_id (PK)
host_id (FK → User.user_id)
name
description
location
pricepernight
created_at
updated_at

**Booking**
booking_id (PK)
property_id (FK → Property.property_id)
user_id (FK → User.user_id)
start_date
end_date
total_price
status (pending, confirmed, canceled)
created_at

**Payment**
payment_id (PK)
booking_id (FK → Booking.booking_id)
amount
payment_date
payment_method (credit_card, paypal, stripe)

**Review**
review_id (PK)
property_id (FK → Property.property_id)
user_id (FK → User.user_id)
rating (1–5)
comment
created_at

**Message**
message_id (PK)
sender_id (FK → User.user_id)
recipient_id (FK → User.user_id)
message_body
sent_at

### Relationships
<br>

- User ↔ Property: 1:N (One User/Host can have many Properties).
- User ↔ Booking: 1:N (One User/Guest can make many Bookings).
- Property ↔ Booking: 1:N (One Property can be booked many times).
- Booking ↔ Payment: 1:1 or 1:N (One Booking can have one or multiple Payments, depending on rules).
- User ↔ Review ↔ Property: M:N (One User can leave many Reviews on different Properties; One Property can have many Reviews from different Users).
- User ↔ Message ↔ User: M:N (One User can send many Messages to many Users).
