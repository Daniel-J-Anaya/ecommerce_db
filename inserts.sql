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
SET AUTOCOMMIT=0;

USE mydb;

-- ------------------------------------------------------------------
-- Each Transaction usually has five parts:
-- 1. START TRANSACTION;
-- 2. SAVEPOINT `savepoint name`; (Optional)
-- 3. Query or queries to run
-- 4. ROLLBACK TO SAVEPOINT `savepoint name`; (Optional)
-- 5. COMMIT;

-- Without a COMMIT statement, nothing will be saved to the database
-- ------------------------------------------------------------------

-- --------------------------------------------------------------------
-- 2. Follow the next prompts to experiment and play with the database
-- --------------------------------------------------------------------


-------------------
START TRANSACTION;

INSERT INTO users
(user_id)
VALUES
('CHECK THIS CODE');

INSERT INTO users
  (first_name)
VALUES
  ('James'),
  ('Terry'),
  ('Jessica'),
  ('Sophia'),
  ('Brian');

INSERT INTO users
  (last_name)
VALUES
  ('Smith'),
  ('Johnson'),
  ('Williams'),
  ('Brown'),
  ('Jones');

INSERT INTO users
 (email)
VALUES
  ('JamesSmith123@gmail.com'),
  ('TerryJohnson99@yahoo.com'),
  ('JessicaWilliams456@hotmail.com'),
  ('SophiaBrown22@outlook.com'),
  ('BrianJones789@gmail.com');

INSERT INTO users
(password_hash)
VALUES
  ('BlueTiger45!'),
  ('SunnyLake99?'),
  ('GreenApple22$'),
  ('HappyMoon88#'),
  ('SilverTree12&');

INSERT INTO users
(phone_number)
VALUES
  ('(208) 456-7892'),
  ('(208) 234-5678'),
  ('(208) 987-6543'),
  ('(208) 765-4321'),
  ('(208) 543-2109');

INSERT INTO users
(address_id)
VALUES
  ASK ABOUT CODE

INSERT INTO users
(created_at)
VALUES
  ('1/20/2025'),
  ('1/21/2025'),
  ('1/22/2025'),
  ('1/23/2025'),
  ('1/24/2025');

COMMIT;

----------------
---- orders ---- 
----------------

START TRANSACTION;

INSERT INTO orders
(orders_id)
VALUES
 ('CHECK THIS CODE');

INSERT INTO orders
(user_id)
VALUES
('CHECK THIS CODE');

INSERT INTO orders
(total_price)
VALUES
  ('140.00'),
  ('110.00'),
  ('65.00'),
  ('160.00'),
  ('150.00');

INSERT INTO orders
(order_status)
VALUES
  ('pending'),
  ('shipped'),
  ('shipped'),
  ('delivered'),
  ('delivered');

INSERT INTO orders
(created_at)
VALUES
  ('1/20/2025'),
  ('1/21/2025'),
  ('1/22/2025'),
  ('1/23/2025'),
  ('1/24/2025');

INSERT INTO orders
(discount_id)
VALUES
  ('CHECK THIS CODE');

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
