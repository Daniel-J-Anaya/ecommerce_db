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


-- --------------------------
-- Andrew Jones Week 08 Query
-- --------------------------

USE ecommercedb;

SELECT CONCAT(u.first_name, ' ', u.last_name) AS 'Full Name'
, u.phone_number AS 'Phone Number'
, o.order_status AS 'Order Status'
, o.total_price AS 'Order Price'
, o.created_at AS 'Date of Payment'
, DATEDIFF(NOW(), o.created_at) AS 'Days since order'
FROM orders o
INNER JOIN users u
ON o.user_id = u.user_id
WHERE o.order_status = 'shipped'
ORDER BY o.total_price DESC;

-- This query tells us which orders have been shipped but not delivered, and the amount of days since the order was placed. 
-- It has the users name and phone number to contact if about the delay in the order.


-- --------------------------
-- Ian Miller Week 09 Query
-- --------------------------
-- Want to look at how active customers are giving the total number of orders there are depending on each customer

SELECT 
    o.user_id,
    u.first_name, u.last_name,
    COUNT(o.orders_id) AS 'Total Orders',
    CASE 
        WHEN COUNT(o.orders_id) >= 5 THEN 'High Activity'
        WHEN COUNT(o.orders_id) BETWEEN 2 AND 4 THEN 'Medium Activity'
        ELSE 'Very Low Activity'
    END AS 'Activity'
FROM orders o
INNER JOIN users u
    ON o.user_id = u.user_id
GROUP BY o.user_id, u.first_name, u.last_name;

-- This query returns each user and their respective activity in relation to orders

-- -------------------------------------------------

-- -------------------------
-- Danny Anaya Week 09 Query
-- -------------------------

USE ecommercedb;

SELECT 
    o.orders_id AS 'Order ID',
    CONCAT(u.first_name, ' ', u.last_name) AS 'Customer Name',
    CONCAT('$', o.total_price) AS 'Total Price',
    o.created_at AS 'Order Date',
    -- Using CASE to display more user-friendly order statuses
    CASE 
        WHEN o.order_status = 'pending' THEN 'Awaiting Processing'
        WHEN o.order_status = 'shipped' THEN 'On the Way'
        WHEN o.order_status = 'delivered' THEN 'Completed'
        ELSE 'Unknown Status'
    END AS 'Order Status'
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE o.total_price < 150;
ORDER BY o.total_price DESC;

-- This query retreives a list of orders, orders them be price and display four columns: Order ID, Customer Name, Total Price, and Order Date.
-- It checks the Order Status then gives custom messages depencing on the status
-- It checks if the total price is less than $150

-- ----------------------------------------------

-- --------------------
-- Efrain Mailler Week9
-- --------------------

SELECT 
  payments_id,
  order_id,
  card_id,
  payment_status,
  payment_date,
  user_id,
  CASE 
    WHEN payment_status = 'pending' THEN 'Payment is being processed'
    WHEN payment_status = 'completed' THEN 'Payment completed successfully'
    WHEN payment_status = 'failed' THEN 'Payment failed, please retry'
    ELSE 'Unknown payment status'
  END AS payment_status_label
FROM ecommercedb.payments;

-- -------------------
-- Ian Miller Week 10
-- -------------------

-- The purpose of this query is to eventually return those members with higher statuses and their orders

SELECT 
    CASE 
        WHEN COUNT(u.user_id) >= 5 THEN 'Platinum'
        WHEN COUNT(u.user_id) BETWEEN 2 AND 4 THEN 'Gold'
        ELSE 'No Status'
    END AS Status,
    u.first_name AS 'First Name',
    u.last_name AS 'Last Name',
    SUM(o.orders_id) AS 'total orders'
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id  
GROUP BY u.first_name, u.last_name
LIMIT 10;

-- -------------------------
-- Danny Anaya Week 10 Query
-- -------------------------

START TRANSACTION;

SELECT 
    u.first_name AS 'First Name',
    u.last_name AS 'Last Name',
    o.orders_id AS 'Order Number',
    o.total_price AS 'Order Total',
    o.order_status AS 'Order Status',
    p.payment_date AS 'Payment Date',
    CASE
        WHEN p.payment_status = 'completed' THEN 'Payment Successful'
        WHEN p.payment_status = 'pending' THEN 'Payment Pending'
        WHEN p.payment_status = 'failed' THEN 'Payment Failed'
        ELSE 'No Payment Info'
    END AS 'Payment Status'
FROM 
    ecommercedb.users u
LEFT JOIN 
    ecommercedb.orders o ON u.user_id = o.user_id
LEFT JOIN 
    ecommercedb.payments p ON o.orders_id = p.order_id
GROUP BY 
    u.user_id, o.orders_id, p.payment_status
ORDER BY 
    o.total_price DESC
LIMIT 10;

COMMIT;


-- -------------------------
-- Efrain Miller Week 10 Query
-- -------------------------

SELECT u.first_name,u.last_name,u.email,o.orders_id,o.total_price AS order_total,
pt.product_name,d.discount_code,d.discount_type,d.amount AS discount_amount,p.payment_status
FROM ecommercedb.users u
LEFT JOIN ecommercedb.orders o 
ON u.user_id = o.user_id
LEFT JOIN ecommercedb.product_table_has_orders pto 
ON o.orders_id = pto.orders_id
LEFT JOIN ecommercedb.product_table pt 
ON pto.product_table_id = pt.product_table_id
LEFT JOIN ecommercedb.discounts d 
ON o.discount_id = d.discounts_id
LEFT JOIN ecommercedb.payments p 
ON o.orders_id = p.order_id;

-- -------------------------
-- Ian Miller Week 11 Query
-- -------------------------

SELECT CONCAT('$', FORMAT(SUM(o.total_price), 2)) AS 'TOTAL REVENUE'
,	o.orders_id AS 'Order Number'
,	CONCAT(u.first_name, ' ',u.last_name)
FROM payments p
INNER JOIN orders o
ON p.order_id = o.orders_id
INNER JOIN users u
ON p.user_id = u.user_id
INNER JOIN address a
ON u.address_id = a.address_id
WHERE a.state = 'ID'
GROUP BY o.orders_id
, CONCAT(u.first_name, ' ',u.last_name)
ORDER BY SUM(o.total_price) DESC;


-- -------------------------
-- Efrain Miller Week 11 Query
-- -------------------------
SELECT  CONCAT('$', FORMAT(AVG(o.total_price), 2)) AS 'Average Revenue',  
 CONCAT(a.city, ', ', a.country) AS 'Address ',    
o.orders_id
FROM orders o
JOIN address a
ON o.user_id = a.user_id  
WHERE o.order_status = 'shipped' 
AND o.created_at BETWEEN '2024-01-01' AND '2024-12-31'  
GROUP BY o.orders_id, a.city, a.country
HAVING AVG(o.total_price) > 100  
ORDER BY o.orders_id;

-- -------------------------
-- Andrew Jones Week 11 Query
-- -------------------------

SELECT ct.name AS 'Category Name',
	SUM(pt.price)AS 'Total Sales',
    SUM(ptho.quantity) AS 'Total Items Sold',
	COUNT(ptho.quantity) AS 'Orders containing Category'
FROM product_table_has_orders ptho
INNER JOIN product_table pt
ON ptho.product_table_id = pt.product_table_id
INNER JOIN product_table_category_table ptct
ON ptho.product_table_id = ptct.product_table_id
INNER JOIN category_table ct
ON ptct.category_id = ct.category_id
GROUP BY ct.name
ORDER BY SUM(pt.price) DESC
LIMIT 3;

-- This query tells us what the top three most profitable categories of product are that we sell.
-- We can use this to see which product lines we might want to put more products into.
