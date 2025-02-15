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


-------------------
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
---- orders ---- 
----------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `orders_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `total_price` DECIMAL(10,2) NOT NULL,
  `order_status` ENUM('pending', 'shipped', 'delivered') NOT NULL,
  `created_at` DATE NOT NULL,
  `discount_id` INT UNSIGNED NULL,
  PRIMARY KEY (`orders_id`),
  UNIQUE INDEX `orders_id_UNIQUE` (`orders_id` ASC) VISIBLE,
  INDEX `fk_orders_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `order_discountsfk2_idx` (`discount_id` ASC) VISIBLE,
  CONSTRAINT `orders_usersfk1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_discountsfk2`
    FOREIGN KEY (`discount_id`)
    REFERENCES `mydb`.`discounts` (`discounts_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
