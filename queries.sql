-- -----------------------------------------
-- This file is for saving any queries we are using in our DB: Please follow this format.

-- ---------------------
-- Situation (e.g. Looking for an order that was shipped by purchasers first name.)
-- ---------------------
-- Query Statment

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
