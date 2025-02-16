---- Parent Tables ----

-----------------------
---- product_table ----
-----------------------

------------------------
---- category_table ----
------------------------
START TRANSACTION;

INSERT INTO category_table 
(name,description)
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
    ('123 Pinecrest Dr', 'Boise', 'ID', 83702, 'USA'),
    ('4567 Maple Ave', 'Idaho Falls', 'ID', 83401, 'USA'),
    ('890 Riverbend Rd', 'Coeur d'Alene', 'ID', 83804, 'USA'),
    ('321 Aspen Way', 'Twin Falls', 'ID', 83301, 'USA'),
    ('6789 Birch Ln', 'Meridian', 'ID', 83642, 'USA');

COMMIT;

-------------------
---- discounts ----
-------------------

--------------
---- card ----
--------------

---- Child Tables ----

---------------
---- users ----
---------------
START TRANSACTION;

INSERT INTO users
  (first_name, last_name, email, password_hash, phone_number, created_at)  -- missing the fk of address_id
VALUES
  ('James', 'Smith', 'JamesSmith123@gmail.com', 'BlueTiger45!', '(208) 456-7892', '1/20/2025'),
  ('Terry', 'Johnson', 'TerryJohnson99@yahoo.com', 'SunnyLake99?', '(208) 234-5678', '1/21/2025'),
  ('Jessica', 'Williams', 'JessicaWilliams456@hotmail.com', 'GreenApple22$', '(208) 987-6543', '1/22/2025'),
  ('Sophia', 'Brown', 'SophiaBrown22@outlook.com', 'HappyMoon88#', '(208) 765-4321', '1/23/2025'),
  ('Brian', 'Jones', 'BrianJones789@gmail.com', 'SilverTree12&', '(208) 543-2109', '1/24/2025');

COMMIT;

----------------
---- orders ----
----------------
START TRANSACTION;

INSERT INTO orders
(total_price, order_status, created_at)
VALUES
  ('140.00', 'pending', '1/20/2025'),
  ('110.00', 'shipped', '1/21/2025'),
  ('65.00', 'shipped', '1/22/2025'),
  ('160.00', 'delivered', '1/23/2025'),
  ('150.00', 'delivered', '1/24/2025');

COMMIT;
-----------------
---- returns ----
-----------------

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
