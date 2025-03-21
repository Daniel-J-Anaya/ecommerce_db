-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommercedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ecommercedb` ;

-- -----------------------------------------------------
-- Schema ecommercedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommercedb` DEFAULT CHARACTER SET utf8 ;
USE `ecommercedb` ;

-- -----------------------------------------------------
-- Table `ecommercedb`.`product_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`product_table` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`product_table` (
  `product_table_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(30) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `price` DECIMAL NOT NULL,
  `stock` INT NOT NULL,
  `created_at` DATE NOT NULL,
  `image` VARCHAR(200) NULL,
  PRIMARY KEY (`product_table_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`address` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`address` (
  `address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street_address` VARCHAR(225) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NOT NULL,
  `postal_code` VARCHAR(20) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`users` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`users` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password_hash` VARCHAR(100) NOT NULL,
  `phone_number` VARCHAR(100) NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  `created_at` DATE NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  INDEX `users_address_fk1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `users_address_fk1`
    FOREIGN KEY (`address_id`)
    REFERENCES `ecommercedb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`wishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`wishlist` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`wishlist` (
  `wishlist_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `added_at` DATE NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  INDEX `fk_wishlist_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_wishlist_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommercedb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`card` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`card` (
  `card_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(19) NOT NULL,
  `card_cvv` INT NOT NULL,
  `card_date` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`card_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`discounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`discounts` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`discounts` (
  `discounts_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `discount_code` VARCHAR(15) NOT NULL,
  `discount_type` ENUM('percentage', 'fixed') NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`discounts_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`orders` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`orders` (
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
    REFERENCES `ecommercedb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_discountsfk2`
    FOREIGN KEY (`discount_id`)
    REFERENCES `ecommercedb`.`discounts` (`discounts_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`payments` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`payments` (
  `payments_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `card_id` INT UNSIGNED NOT NULL,
  `payment_status` ENUM('pending', 'completed', 'failed') NOT NULL,
  `payment_date` DATE NOT NULL,
  -- `user_id` INT UNSIGNED NOT NULL,                             -- commented out the user_id
  PRIMARY KEY (`payments_id`),
  INDEX `payments_card_fk1_idx` (`card_id` ASC) VISIBLE,
  -- INDEX `payments_users_fk2_idx` (`user_id` ASC) VISIBLE,      -- commented out the user_id
  INDEX `payments_orders_fk3_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `payments_card_fk1`
    FOREIGN KEY (`card_id`)
    REFERENCES `ecommercedb`.`card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  -- CONSTRAINT `payments_users_fk2`
  --  FOREIGN KEY (`user_id`)
  --  REFERENCES `ecommercedb`.`users` (`user_id`)                 -- commented out the user_id
  --  ON DELETE NO ACTION
  --  ON UPDATE NO ACTION,
  CONSTRAINT `payments_orders_fk2`
    FOREIGN KEY (`order_id`)
    REFERENCES `ecommercedb`.`orders` (`orders_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`returns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`returns` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`returns` (
  `returns_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `return_reason` TEXT(300) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `processed_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`returns_id`),
  INDEX `returns_fk1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `returns_fk1`
    FOREIGN KEY (`order_id`)
    REFERENCES `ecommercedb`.`orders` (`orders_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`category_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`category_table` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`category_table` (
  `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT(200) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`product_table_wishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`product_table_wishlist` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`product_table_wishlist` (
  `product_table_id` INT NOT NULL,
  `wishlist_id` INT NOT NULL,
  PRIMARY KEY (`product_table_id`, `wishlist_id`),
  INDEX `fk_product_table_has_wishlist_wishlist1_idx` (`wishlist_id` ASC) VISIBLE,
  INDEX `fk_product_table_has_wishlist_product_table1_idx` (`product_table_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_table_has_wishlist_product_table1`
    FOREIGN KEY (`product_table_id`)
    REFERENCES `ecommercedb`.`product_table` (`product_table_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_table_has_wishlist_wishlist1`
    FOREIGN KEY (`wishlist_id`)
    REFERENCES `ecommercedb`.`wishlist` (`wishlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`product_table_has_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`product_table_has_orders` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`product_table_has_orders` (
  `product_table_id` INT NOT NULL,
  `orders_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,                                                          -- Added quantity column so that we can see how many were bought
  PRIMARY KEY (`product_table_id`, `orders_id`),
  INDEX `fk_product_table_has_orders_orders1_idx` (`orders_id` ASC) VISIBLE,
  INDEX `fk_product_table_has_orders_product_table1_idx` (`product_table_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_table_has_orders_product_table1`
    FOREIGN KEY (`product_table_id`)
    REFERENCES `ecommercedb`.`product_table` (`product_table_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_table_has_orders_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `ecommercedb`.`orders` (`orders_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`users_card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`users_card` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`users_card` (
  `user_id` INT UNSIGNED NOT NULL,
  `card_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `card_id`),
  INDEX `fk_users_has_card_card1_idx` (`card_id` ASC) VISIBLE,
  INDEX `fk_users_has_card_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_card_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommercedb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_card_card1`
    FOREIGN KEY (`card_id`)
    REFERENCES `ecommercedb`.`card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommercedb`.`product_table_category_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommercedb`.`product_table_category_table` ;

CREATE TABLE IF NOT EXISTS `ecommercedb`.`product_table_category_table` (
  `product_table_id` INT NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_table_id`, `category_id`),
  INDEX `fk_product_table_has_category_table_category_table1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_product_table_has_category_table_product_table1_idx` (`product_table_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_table_has_category_table_product_table1`
    FOREIGN KEY (`product_table_id`)
    REFERENCES `ecommercedb`.`product_table` (`product_table_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_table_has_category_table_category_table1`
    FOREIGN KEY (`category_id`)
    REFERENCES `ecommercedb`.`category_table` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
