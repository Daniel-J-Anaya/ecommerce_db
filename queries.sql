-- -----------------------------------------
-- This file is for saving any queries we are using in our DB: Please follow this format.

-- ---------------------
-- Situation (e.g. Looking for an order that was shipped by purchasers first name.)
-- ---------------------
-- Query Statment

-- ---------------------
-- Jacob Oliver W09 Query
------------------------
SELECT 
    product_name,
    stock,
    CASE 
        WHEN stock = 0 THEN 'Out of Stock'
        WHEN stock <= 5 THEN 'Low Stock'
        WHEN stock <= 20 THEN 'Moderate Stock'
        ELSE 'In Stock'
    END AS stock_status
FROM product_table;

-- categorize stock levels in an eCommerce database
-- -----------------------------------------

