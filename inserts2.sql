-- FORMAT

-- Team Member: Description
-- START TRANSACTION;

-- INSERT INTO table name (table columns)
-- VALUES
--     ('Value 1', 'Value 2'),
--     ('Value 1', 'Value 2')

-- COMMIT;

-- ---------------------------------------------------------------

-- -----------------------------------
-- Efrain Miller: Additional Addresses
-- -----------------------------------
START TRANSACTION;

INSERT INTO address (street_address, city, state, postal_code, country)
VALUES 
    ('123 Maple Street', 'Springfield', 'Illinois', '62701', 'United States'),
    ('456 Oak Avenue', 'Chicago', 'Illinois', '60601', 'United States'),
    ('789 Pine Road', 'Los Angeles', 'California', '90001', 'United States'),
    ('101 Birch Lane', 'Miami', 'Florida', '33101', 'United States'),
    ('202 Cedar Boulevard', 'New York', 'New York', '10001', 'United States');

COMMIT;

-- ---------------------------------------------------------------

-- -----------------------------------
-- Efrain Miller: Additional Users
-- -----------------------------------
START TRANSACTION;

 INSERT INTO users (first_name,last_name,email,password_hash,phone_number,address_id,created_at)
 VALUES 
 ('John','Doe','jondoe@gmail.com','A1b2C3d4E5','+2084567890','6','2025-03-10'),
 ('Jane', 'Smith', 'janesmith@gmail.com', 'X5y6Z7a8B9', '+2098765432', '7', '2025-03-10'),
('Michael', 'Johnson', 'michaeljohnson@gmail.com', 'F2g3H4i5J6', '+2109876543', '8', '2025-03-10'),
('Emily', 'Davis', 'emilydavis@gmail.com', 'K7l8M9n0O1', '+2112345678', '9', '2025-03-10'),
('David', 'Wilson', 'davidwilson@gmail.com', 'P3q4R5s6T7', '+2123456789', '10', '2025-03-10');

COMMIT;

-- ----------------------------------------------------------------

-- --------------------------------
-- Danny Anaya: 10 Additional Cards
-- --------------------------------
START TRANSACTION;

INSERT INTO card 
(card_number, card_cvv, card_date) 
VALUES
  ('1234 5678 9012 3456', 111, '01/27'), 
  ('2345 6789 0123 4567', 222, '02/28'), 
  ('3456 7890 1234 5678', 333, '03/29'), 
  ('4567 8901 2345 6789', 444, '04/30'), 
  ('5678 9012 3456 7890', 555, '05/26'), 
  ('6789 0123 4567 8901', 666, '06/25'), 
  ('7890 1234 5678 9012', 777, '07/27'), 
  ('8901 2345 6789 0123', 888, '08/24'), 
  ('9012 3456 7890 1234', 999, '09/28'), 
  ('0123 4567 8901 2345', 000, '10/30');

COMMIT;

-- -----------------------------------------------------------------

-- -------------------------------------------------------
-- Danny Anaya: Linking Users to Card, Updating users_card
-- -------------------------------------------------------
START TRANSACTION;

INSERT INTO users_card 
(user_id, card_id)
VALUES
  ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'John Doe')
  , (SELECT card_id FROM card WHERE card_number = '1234 5678 9012 3456'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Jane Smith')
  , (SELECT card_id FROM card WHERE card_number = '2345 6789 0123 4567'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Michael Johnson')
  , (SELECT card_id FROM card WHERE card_number = '3456 7890 1234 5678'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Emily Davis')
  , (SELECT card_id FROM card WHERE card_number = '4567 8901 2345 6789'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'David Wilson')
  , (SELECT card_id FROM card WHERE card_number = '5678 9012 3456 7890'));

COMMIT;

-- -----------------------------------------------------------------

-- -------------------------------------------------------
-- Jacob Oliver: Additional Orders
-- -------------------------------------------------------
START TRANSACTION;

INSERT INTO orders (user_id, order_date, total_amount, status, shipping_address_id, card_id) 
VALUES
  ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'John Doe'),
   '2025-03-11', 149.99, 'Shipped',
   (SELECT address_id FROM address WHERE street_address = '123 Maple Street'),
   (SELECT card_id FROM card WHERE card_number = '1234 5678 9012 3456')),

  ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Jane Smith'),
   '2025-03-12', 89.50, 'Processing',
   (SELECT address_id FROM address WHERE street_address = '456 Oak Avenue'),
   (SELECT card_id FROM card WHERE card_number = '2345 6789 0123 4567')),

  ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Michael Johnson'),
   '2025-03-13', 249.75, 'Delivered',
   (SELECT address_id FROM address WHERE street_address = '789 Pine Road'),
   (SELECT card_id FROM card WHERE card_number = '3456 7890 1234 5678')),

  ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Emily Davis'),
   '2025-03-14', 39.99, 'Shipped',
   (SELECT address_id FROM address WHERE street_address = '101 Birch Lane'),
   (SELECT card_id FROM card WHERE card_number = '4567 8901 2345 6789')),

  ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'David Wilson'),
   '2025-03-15', 99.99, 'Processing',
   (SELECT address_id FROM address WHERE street_address = '202 Cedar Boulevard'),
   (SELECT card_id FROM card WHERE card_number = '5678 9012 3456 7890'));

COMMIT;

