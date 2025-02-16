---- Parent Tables ----

-----------------------
---- product_table ----
-----------------------

------------------------
---- category_table ----
------------------------

-----------------
---- address ----
-----------------

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
