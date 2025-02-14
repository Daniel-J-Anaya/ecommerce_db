---- Example Insert Statements ----
/*
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
, 'Woods' );

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

-- ---------------------------------------
-- ---------------------------------------
-- a. Add your name to the person table
-- ---------------------------------------
-- ---------------------------------------

INSERT INTO person
( person_fname
, person_lname )
VALUES
( 'Hank'
, 'Green' ),
( 'Bob'
, 'Smith' ),
( 'Erin'
, 'Black' );

INSERT INTO book
( book_title
, book_isbn
, book_publish_year
, author_id )
VALUES
( 'The Great Escape'
, '978-3-16-148410-0'
, 2018
, (SELECT author_id FROM author WHERE CONCAT(author_fname, ' ', author_lname) = 'A. Carter')
);

-- -----------------------------------------
-- -----------------------------------------
-- b. Update one or more stock_quantities
-- -----------------------------------------
-- -----------------------------------------

INSERT INTO stock
( book_id
, location_id
, stock_quantity )
VALUES
( (SELECT book_id FROM book WHERE book_title = 'Digital Marketing Essentials')
, (SELECT location_id FROM location WHERE location_name = 'Rexburg General Library')
, 50
);

COMMIT;
*/


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

----------------
---- orders ----
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
