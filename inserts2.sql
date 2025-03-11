-- FORMAT

-- Team Member: Description
-- START TRANSACTION;

-- INSERT INTO table name (table columns)
-- VALUES
--     ('Value 1', 'Value 2'),
--     ('Value 1', 'Value 2')

-- COMMIT;

-- ---------------------------------------------------------------

-- -----------------------------------
-- Efrain Miller: Additional Addresses
-- -----------------------------------
START TRANSACTION;

INSERT INTO address (street_address, city, state, postal_code, country)
VALUES 
    ('123 Maple Street', 'Springfield', 'Illinois', '62701', 'United States'),
    ('456 Oak Avenue', 'Chicago', 'Illinois', '60601', 'United States'),
    ('789 Pine Road', 'Los Angeles', 'California', '90001', 'United States'),
    ('101 Birch Lane', 'Miami', 'Florida', '33101', 'United States'),
    ('202 Cedar Boulevard', 'New York', 'New York', '10001', 'United States');

COMMIT;

-- ---------------------------------------------------------------

-- -----------------------------------
-- Efrain Miller: Additional Users
-- -----------------------------------
START TRANSACTION;

 INSERT INTO users (first_name,last_name,email,password_hash,phone_number,address_id,created_at)
 VALUES 
 ('John','Doe','jondoe@gmail.com','A1b2C3d4E5','+2084567890','6','2025-03-10'),
 ('Jane', 'Smith', 'janesmith@gmail.com', 'X5y6Z7a8B9', '+2098765432', '7', '2025-03-10'),
('Michael', 'Johnson', 'michaeljohnson@gmail.com', 'F2g3H4i5J6', '+2109876543', '8', '2025-03-10'),
('Emily', 'Davis', 'emilydavis@gmail.com', 'K7l8M9n0O1', '+2112345678', '9', '2025-03-10'),
('David', 'Wilson', 'davidwilson@gmail.com', 'P3q4R5s6T7', '+2123456789', '10', '2025-03-10');

COMMIT;
