This is a Class Project Database for en E-Commerce Website.
SELECT CONCAT(first_name,'',last_name) AS  customer_name, a.street_address,a.city,a.state,a.postal_code,a.country
FROM users u
JOIN address a
ON u.address_id = a.address_id;

Team Members:
Danny Anaya
Andrew Jones
Jacob Oliver
Garrett Davis
Ian Miller
Efrain Miller
