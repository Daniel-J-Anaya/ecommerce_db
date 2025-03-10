-- -----------------------------------------
-- This file is for saving any queries we are using in our DB: Please follow this format.

-- ---------------------
-- Situation (e.g. Looking for an order that was shipped by purchasers first name.)
-- ---------------------
-- Query Statment

-- -----------------------------------------
-- Jacob Oliver Query --
-- list users and their wishlist items --
-- -----------------------------------------
SELECT 
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    p.product_name
FROM wishlist w
JOIN users u ON w.user_id = u.user_id
JOIN product_table_wishlist pw ON w.wishlist_id = pw.wishlist_id
JOIN product_table p ON pw.product_table_id = p.product_table_id;
-- -----------------------------------------