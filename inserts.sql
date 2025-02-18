SET AUTOCOMMIT=0;

USE ecommerce_db;

-- ------------------------------------------------------------------
-- Each Transaction usually has five parts:
-- 1. START TRANSACTION;
-- 2. SAVEPOINT `savepoint name`; (Optional)
-- 3. Query or queries to run
-- 4. ROLLBACK TO SAVEPOINT `savepoint name`; (Optional)
-- 5. COMMIT;

---- Parent Tables ----

-----------------------
---- product_table ----
-----------------------
START TRANSACTION

INSERT INTO product_table
(product_name, description, price, stock, created_at, image)
  
VALUES
('Space Shoes'
, 'Tired of Earth’s gravity holding you back? Step into the future with Galactic Stride™ Space Shoes—the only footwear designed to (almost) defy physics.'
, 140.00
, 20
, '2024-01-29'
, 'https://firefly.adobe.com/public/t2i?id=urn%3Aaaid%3Asc%3AUS%3Ab37c08e2-7a64-4fe0-ad91-9607a07a172b&ff_channel=shared_link&ff_source=Text2Image'),
('Cosmic Loafers'
, 'Tired of laces? Tired of effort? Tired of planetary constraints? Slip into Cosmic Loafers™, the ultimate footwear for those who believe gravity is optional and dress codes are merely suggestions.'
, 110.00
, 30
, '2024-01-30'
, Null),
('Pluto Clogs'
, 'Once considered a planet, now just a celestial afterthought—Pluto understands what it means to be underestimated. That’s why we created Pluto Clogs™, the ultimate shoe for those who don’t care about labels but do care about maximum comfort in the cold, unforgiving void.'
, 65.00
, 50
, '2024-01-31'
, Null),
('Gravity Boots'
, 'Ever feel like you’re just floating through life? Wish you had a little more stability—physically, if not emotionally? Introducing Gravity Boots™, the only footwear designed to keep your feet firmly planted, even when everything else is spiraling out of control.'
, 160.00
, 35
, '2024-02-01'
, Null),
('Supernova Sneakers'
, 'Tired of blending in like some average, low-energy star? Step up your game with Supernova Sneakers™, the only footwear inspired by the most dramatic exit in the universe. Designed for those who refuse to go out quietly.'
, 150.00
, 55
, '2024-02-02'
, Null);

COMMIT;
------------------------
---- category_table ----
------------------------
START TRANSACTION;

INSERT INTO category_table 
(name, description)
VALUES ('Galactic footwear','A collection of space-inspired shoes designed for those who want to walk among the stars. Featuring futuristic styles and cosmic comfort, these shoes are perfect for dreamers and explorers alike.'),
  ('Astro kicks collection','Elevate your step with the Astro Kicks Collection, where innovation meets interstellar fashion. Designed for both comfort and style, these kicks are ready for any cosmic adventure'),
  ('Cosmic Stride Series','Step boldly into the future with the Cosmic Stride Series, a lineup of gravity-defying footwear inspired by the mysteries of the universe. Walk with confidence, whether on Earth or beyond.'),
  ('Interstellar Soles','Experience the next evolution of footwear with Interstellar Soles—a range of celestial designs crafted for comfort, durability, and a style that’s light-years ahead'),
  ('Nebula Walkers',' Inspired by the beauty of the cosmos, Nebula Walkers bring a touch of the stars to your everyday journey. Sleek, stylish, and infused with futuristic flair, these shoes will take you places—literally and figuratively');

COMMIT;
-----------------
---- address ----
-----------------
START TRANSACTION;

INSERT INTO address 
(street_address, city, state, postal_code, country)
VALUES 
    ('123 Pinecrest Dr'
    , 'Boise'
    , 'ID'
    , 83702
    , 'USA'),
    ('4567 Maple Ave'
    , 'Idaho Falls'
    , 'ID'
    , 83401
    , 'USA'),
    ('890 Riverbend Rd'
    , 'Coeur d'Alene'
    , 'ID'
    , 83804
    , 'USA'),
    ('321 Aspen Way'
    , 'Twin Falls'
    , 'ID'
    , 83301
    , 'USA'),
    ('6789 Birch Ln'
    , 'Meridian'
    , 'ID'
    , 83642
    , 'USA');

COMMIT;
-------------------
---- discounts ----
-------------------
START TRANSACTION;

INSERT INTO discounts 
(discount_code, discount_type, amount, start_date, end_date)
VALUES
  ('SPRING20', 'percentage', 20.00, '2025-03-01', '2025-03-31'),
  ('SUMMER10', 'percentage', 10.00, '2025-06-01', '2025-06-30'),
  ('WELCOME5', 'fixed', 5.00, '2025-01-01', '2025-12-31'),
  ('BLACKFRIDAY', 'percentage', 50.00, '2025-11-29', '2025-11-29'),
  ('HOLIDAY25', 'fixed', 25.00, '2025-12-20', '2025-12-31');

COMMIT;
--------------
---- card ----
--------------
START TRANSACTION;

INSERT INTO card 
(card_number, card_cvv, card_date) 
VALUES
('4111 1111 1111 1111', 123, '12/26'),
('5500 0000 0000 0004', 456, '11/24'),
('3400 0000 0000 009', 789, '06/27'),
('6011 0000 0000 0012', 321, '03/25'),
('3000 0000 0000 0004', 654, '09/28');

COMMIT;


---- Child Tables ----

---------------
---- users ----
---------------
START TRANSACTION;

INSERT INTO users
  (first_name, last_name, email, password_hash, phone_number, address_id, created_at)
VALUES
  ('James'
  , 'Smith'
  , 'JamesSmith123@gmail.com'
  , 'BlueTiger45!'
  , '(208) 456-7892'
  , (SELECT address_id FROM address WHERE (CONCAT(street_address+', '+city+', '+state+' '+postal_code) = '123 Pinecrest Dr, Boise, ID 83702'))
  , '2025-01-20'),
  ('Terry', 'Johnson'
  , 'TerryJohnson99@yahoo.com'
  , 'SunnyLake99?'
  , '(208) 234-5678'
  , (SELECT address_id FROM address WHERE (CONCAT(street_address+', '+city+', '+state+' '+postal_code) = '123 Pinecrest Dr, Boise, ID 83702'))
  , '2025-01-21'),
  ('Jessica'
  , 'Williams'
  , 'JessicaWilliams456@hotmail.com'
  , 'GreenApple22$'
  , '(208) 987-6543'
  , (SELECT address_id FROM address WHERE (CONCAT(street_address+', '+city+', '+state+' '+postal_code) = '890 Riverbend Rd, Coeur d'Alene, ID 83804'))
  , '2025-01-22'),
  ('Sophia'
  , 'Brown'
  , 'SophiaBrown22@outlook.com'
  , 'HappyMoon88#'
  , '(208) 765-4321'
  , (SELECT address_id FROM address WHERE (CONCAT(street_address+', '+city+', '+state+' '+postal_code) = '321 Aspen Way, Twin Falls, ID 83301'))
  , '2025-01-23'),
  ('Brian'
  , 'Jones'
  , 'BrianJones789@gmail.com'
  , 'SilverTree12&'
  , '(208) 543-2109'
  , (SELECT address_id FROM address WHERE (CONCAT(street_address+', '+city+', '+state+' '+postal_code) = '321 Aspen Way, Twin Falls, ID 83301'))
  , '2025-01-24');

COMMIT;

----------------
---- orders ----
----------------
START TRANSACTION;

INSERT INTO orders
(user_id, total_price, order_status, created_at, discount_id) 
VALUES
  ((SELECT user_id FROM users WHERE (CONCAT(firest_name + ' ' + last_name) = 'James Smith'))
  , '140.00'
  , 'pending'
  , '2025-01-20'
  , NULL),
  ((SELECT user_id FROM users WHERE (CONCAT(firest_name + ' ' + last_name) = 'Brian Jones'))
  , '110.00'
  , 'shipped'
  , '2025-01-21'
  , NULL),
  ((SELECT user_id FROM users WHERE (CONCAT(firest_name + ' ' + last_name) = 'Sophia Brown'))
  , '65.00'
  , 'shipped'
  , '2025-01-22'
  , NULL),
  ((SELECT user_id FROM users WHERE (CONCAT(firest_name + ' ' + last_name) = 'James Smith'))
  , '160.00'
  , 'delivered'
  , '2025-01-23'
  , NULL),
  ((SELECT user_id FROM users WHERE (CONCAT(firest_name + ' ' + last_name) = 'Terry Johnson'))
  , '150.00'
  , 'delivered'
  , '2025-01-24'
  , NULL);

COMMIT;
-----------------
---- returns ----
-----------------
START TRANSACTION;

INSERT INTO returns (order_id, return_reason, created_at, processed_at)
VALUES
  (
    (SELECT order_id 
     FROM orders 
     WHERE user_id = (SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'James Smith')
       AND total_price = '140.00'
     LIMIT 1),
    'Customer reported receiving the wrong size; return initiated.',
    '2025-01-25 09:15:00',
    '2025-01-26 10:00:00'
  ),
  (
    (SELECT order_id 
     FROM orders 
     WHERE user_id = (SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Brian Jones')
       AND total_price = '110.00'
     LIMIT 1),
    'Product arrived damaged during shipping.',
    '2025-01-26 11:20:00',
    '2025-01-27 14:30:00'
  ),
  (
    (SELECT order_id 
     FROM orders 
     WHERE user_id = (SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Sophia Brown')
       AND total_price = '65.00'
     LIMIT 1),
    'Item not as described on the website.',
    '2025-01-27 08:45:00',
    '2025-01-28 09:00:00'
  ),
  (
    (SELECT order_id 
     FROM orders 
     WHERE user_id = (SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'James Smith')
       AND total_price = '160.00'
     LIMIT 1),
    'Customer changed their mind about the purchase.',
    '2025-01-28 13:00:00',
    '2025-01-29 15:45:00'
  ),
  (
    (SELECT order_id 
     FROM orders 
     WHERE user_id = (SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Terry Johnson')
       AND total_price = '150.00'
     LIMIT 1),
    'Order delivered late, prompting a return request.',
    '2025-01-29 10:30:00',
    '2025-01-30 12:00:00'
  );

COMMIT;
------------------
---- wishlist ----
------------------

------------------
---- payments ----
------------------

---- Linking Tables ----

--------------------------------
---- product_table_wishlist ----
--------------------------------

--------------------------------------
---- product_table_category_table ----
--------------------------------------

----------------------------------
---- product_table_has_orders ----
----------------------------------

--------------------
---- users_card ----
--------------------
