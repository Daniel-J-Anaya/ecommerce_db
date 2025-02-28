-- -----------------------------------------
-- This file is for saving any queries we are using in our DB: Please follow this format.

-- ---------------------
-- Situation (e.g. Looking for an order that was shipped by purchasers first name.)
-- ---------------------
-- Query Statment

-- -----------------------------------------


--- Garrett Week 8 Contribution ---
--- What Customers have a 208 area code in their phone number ---

SELECT
	CONCAT(first_name, ' ', last_name) AS 'Customer Name'
FROM users
WHERE LOCATE('208', phone_number) > 0;
