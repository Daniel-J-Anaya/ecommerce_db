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

USE library;

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

START TRANSACTION;

INSERT INTO location
(location_name)
VALUES
('Rexburg General Library');

INSERT INTO author
( author_fname
, author_lname )
VALUES
( 'A.'
, 'Carter' ),
( 'B.'
, 'Woods' ),
( 'C.'
, 'Baker' ),
( 'D.'
, 'Harper' ),
( 'E.'
, 'Lin' ),
( 'G.'
, 'Palmer' ),
( 'H.'
, 'Martinez' ),
( 'I.'
, 'King' ),
( 'J.'
, 'Reed' );

INSERT INTO genre
(genre_name)
VALUES
('Fiction'),
('Adventure'),
('Sci-Fi'),
('Historical'),
('Cookbook'),
('Mystery'),
('Non-Fiction'),
('Science'),
('Thriller'),
('Business'),
('Technology');

COMMIT;

----------------
---- orders ---- Garrett
----------------

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
