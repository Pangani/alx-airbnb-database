
-- Sample Data for Airbnb Schema


-- Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('u1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '+265991234567', 'guest'),
  ('u2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '+265998765432', 'host'),
  ('u3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '+265997777777', 'guest'),
  ('u4', 'Diana', 'Ngoma', 'diana@example.com', 'hashed_pw4', '+265996666666', 'admin');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('p1', 'u2', 'Lakeview Cottage', 'Cozy cottage with stunning lake views.', 'Mangochi, Malawi', 80.00),
  ('p2', 'u2', 'City Apartment', 'Modern apartment in the city center.', 'Lilongwe, Malawi', 100.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('b1', 'p1', 'u1', '2025-09-10', '2025-09-15', 400.00, 'confirmed'),
  ('b2', 'p2', 'u3', '2025-10-01', '2025-10-05', 400.00, 'pending');

-- Payment Methods
INSERT INTO PaymentMethod (method_id, method_name)
VALUES
  ('pm1', 'credit_card'),
  ('pm2', 'paypal'),
  ('pm3', 'stripe');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay1', 'b1', 400.00, '2025-09-05 10:00:00', 'pm1');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('r1', 'p1', 'u1', 5, 'Amazing stay! Highly recommend.'),
  ('r2', 'p2', 'u3', 4, 'Great apartment but a bit noisy.');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('m1', 'u1', 'u2', 'Hi Bob, is the cottage available for next weekend?'),
  ('m2', 'u2', 'u1', 'Hi Alice, yes the cottage is available. Looking forward to hosting you!');
