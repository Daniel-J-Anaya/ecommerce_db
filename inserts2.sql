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

-- ----------------------------------------------------------------

-- --------------------------------
-- Danny Anaya: 10 Additional Cards
-- --------------------------------
START TRANSACTION;

INSERT INTO card 
(card_number, card_cvv, card_date) 
VALUES
  ('1234 5678 9012 3456', 111, '01/27'), 
  ('2345 6789 0123 4567', 222, '02/28'), 
  ('3456 7890 1234 5678', 333, '03/29'), 
  ('4567 8901 2345 6789', 444, '04/30'), 
  ('5678 9012 3456 7890', 555, '05/26'), 
  ('6789 0123 4567 8901', 666, '06/25'), 
  ('7890 1234 5678 9012', 777, '07/27'), 
  ('8901 2345 6789 0123', 888, '08/24'), 
  ('9012 3456 7890 1234', 999, '09/28'), 
  ('0123 4567 8901 2345', 000, '10/30');

COMMIT;

-- -----------------------------------------------------------------

-- -------------------------------------------------------
-- Danny Anaya: Linking Users to Card, Updating users_card
-- -------------------------------------------------------
START TRANSACTION;

INSERT INTO users_card 
(user_id, card_id)
VALUES
  ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'John Doe')
  , (SELECT card_id FROM card WHERE card_number = '1234 5678 9012 3456'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Jane Smith')
  , (SELECT card_id FROM card WHERE card_number = '2345 6789 0123 4567'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Michael Johnson')
  , (SELECT card_id FROM card WHERE card_number = '3456 7890 1234 5678'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'Emily Davis')
  , (SELECT card_id FROM card WHERE card_number = '4567 8901 2345 6789'))
  , ((SELECT user_id FROM users WHERE CONCAT(first_name, ' ', last_name) = 'David Wilson')
  , (SELECT card_id FROM card WHERE card_number = '5678 9012 3456 7890'));

COMMIT;


START TRANSACTION;

INSERT INTO product_table
(product_name, description, price, stock, created_at, image)
VALUES
('Helium Heels'
, 'Feel like you’re walking on air with Helium Heels™, the lightest heels in the universe! Designed with ultra-lightweight materials and a bounce that makes every step feel effortless. Perfect for those who dream of floating through life—literally.'
, 130.00
, 25
, '2025-01-28'
, Null)
, ('Carbon Kicks'
, 'Simple, versatile, and indestructible—just like the most fundamental element of life! Carbon Kicks™ feature a high-strength graphene sole and a minimalist design, making them stronger than steel yet lighter than a feather. The perfect everyday sneaker for those who demand durability and style.'
, 115.00
, 50
, '2025-01-30'
, Null)
, ('Neon Runners'
, 'Stand out like a glowing noble gas with Neon Runners™! These high-energy sneakers come with built-in LED strips that illuminate your every step, ensuring you shine even in the darkest voids of space.'
, 80.00
, 55
, '2024-01-31'
, Null)
, ('Mercury Slides'
, 'Sleek, fluid, and always in motion—Mercury Slides™ adapt to your foot like liquid metal. Designed with temperature-responsive cushioning, these futuristic slip-ons provide ultimate comfort that molds to your foot’s heat and movement.'
, 50.00
, 100
, '2025-02-01'
, Null)
, ('Titanium Trainers'
, 'Built for those who never quit, Titanium Trainers™ are reinforced with titanium-infused fibers, making them shockproof, ultra-durable, and impact-resistant. Whether you’re on Earth or sprinting across Mars, these kicks will keep up.'
, 135.00
, 60
, '2025-02-02'
, Null)
, ('Oxygen Oxfords'
, 'Breathe easy with Oxygen Oxfords™, the world’s first self-ventilating dress shoes. Designed with nano-perforations that filter air and keep your feet fresher than an atmospheric breeze, these shoes redefine breathable footwear.'
, 160.00
, 60
, '2025-02-02'
, Null)
, ('Radium Runners'
, 'Inspired by Marie Curie’s legacy, these glow-in-the-dark Radium Runners™ absorb and store light during the day, then emit a soft, eerie glow at night. Designed for night owls, space travelers, and those who dare to shine in the dark.'
, 80.00
, 40
, '2025-02-02'
, Null)
, ('Cobalt Cleats'
, 'Power and precision meet in Cobalt Cleats™, featuring an atomic-grade grip designed for speed, traction, and control. Whether you’re tearing up the soccer field or running on alien terrain, these cleats give you an unfair advantage.'
, 150
, 35
, '2025-02-02'
, Null)
, ('Krypton Kicks'
, 'Faster than a speeding bullet? Almost. Krypton Kicks™ use cutting-edge shock-absorbing plasma gel to give you an explosive burst of speed with every step. Designed for athletes, intergalactic messengers, and those with heroic ambitions.'
, 130
, 35
, '2026-03-02'
, Null)
, ('Gold Gravity Boots'
, 'Because walking is too mainstream—introducing Gold Gravity Boots™, featuring electromagnetic soles that let you stick to any metallic surface! Perfect for astronauts, rooftop explorers, and anyone who’s tired of gravity dictating their path.'
, 130
, 35
, '2026-03-02'
, Null);
