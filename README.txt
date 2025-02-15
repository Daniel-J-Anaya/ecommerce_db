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
,
START TRANSACTION;

INSERT INTO category_table ( category_id,name,description)
VALUES (1,'Galactic footwear','A collection of space-inspired shoes designed for those who want to walk among the stars. Featuring futuristic styles and cosmic comfort, these shoes are perfect for dreamers and explorers alike.'),(2,'Astro kicks collection','Elevate your step with the Astro Kicks Collection, where innovation meets interstellar fashion. Designed for both comfort and style, these kicks are ready for any cosmic adventure'),(3,'Cosmic Stride Series','Step boldly into the future with the Cosmic Stride Series, a lineup of gravity-defying footwear inspired by the mysteries of the universe. Walk with confidence, whether on Earth or beyond.'),(4,'Interstellar Soles','Experience the next evolution of footwear with Interstellar Soles—a range of celestial designs crafted for comfort, durability, and a style that’s light-years ahead'),(5,'Nebula Walkers',' Inspired by the beauty of the cosmos, Nebula Walkers bring a touch of the stars to your everyday journey. Sleek, stylish, and infused with futuristic flair, these shoes will take you places—literally and figuratively');

COMMIT;
Team Members:
Danny Anaya
Andrew Jones
Jacob Oliver
