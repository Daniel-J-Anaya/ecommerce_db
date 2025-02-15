This is a Class Project Database for en E-Commerce Website.
START TRANSACTION;

INSERT INTO address (addresses_id, street_address, city, state, postal_code, country)
VALUES 
    (1, '123 Pinecrest Dr', 'Boise', 'ID', 83702, 'USA'),
    (2, '4567 Maple Ave', 'Idaho Falls', 'ID', 83401, 'USA'),
    (3, '890 Riverbend Rd', 'Coeur d'Alene', 'ID', 83804, 'USA'),
    (4, '321 Aspen Way', 'Twin Falls', 'ID', 83301, 'USA'),
    (5, '6789 Birch Ln', 'Meridian', 'ID', 83642, 'USA');

COMMIT;
Team Members:
Danny Anaya
Andrew Jones
Jacob Oliver
