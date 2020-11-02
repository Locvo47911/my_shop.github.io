-- create and select the database
DROP DATABASE IF EXISTS my_shop;
CREATE DATABASE my_shop;
USE my_shop;

-- create the tables for the database
CREATE TABLE addresses (
  addressID         INT            NOT NULL   	AUTO_INCREMENT,
  customerID        INT            NOT NULL,
  city              VARCHAR(40)    NOT NULL,
  phone             VARCHAR(12)    NOT NULL,
  shipAddress 	    VARCHAR(255)   NOT NULL,
  PRIMARY KEY (addressID),
  INDEX customerID (customerID)
);

CREATE TABLE administrators (
  adminID           INT            NOT NULL   	AUTO_INCREMENT,
  emailAddress      VARCHAR(255)   NOT NULL,
  password          VARCHAR(255)   NOT NULL,
  firstName         VARCHAR(255)   NOT NULL,
  lastName          VARCHAR(255)   NOT NULL,
  PRIMARY KEY (adminID)
);

CREATE TABLE categories (
  categoryID        INT            NOT NULL   	AUTO_INCREMENT,
  categoryName      VARCHAR(255)   NOT NULL,
  PRIMARY KEY (categoryID)
);

CREATE TABLE customers (
  customerID        INT            NOT NULL   	AUTO_INCREMENT,
  emailAddress      VARCHAR(255)   NOT NULL,
  password          VARCHAR(60)    NOT NULL,
  firstName         VARCHAR(60)    NOT NULL,
  lastName          VARCHAR(60)    NOT NULL,
  shipAddress 	    VARCHAR(255) 	   	DEFAULT NULL,
  PRIMARY KEY (customerID),
  UNIQUE INDEX emailAddress (emailAddress)
);

CREATE TABLE orderitems (
  itemID            INT            NOT NULL   	AUTO_INCREMENT,
  orderID           INT            NOT NULL,
  productID         INT            NOT NULL,
  quantity          INT 	   NOT NULL,
  PRIMARY KEY (itemID), 
  INDEX orderID (orderID), 
  INDEX productID (productID)
);

CREATE TABLE orders (
  orderID           INT            NOT NULL   	AUTO_INCREMENT,
  customerID        INT            NOT NULL,
  orderDate         DATETIME       NOT NULL,
  shipDate          DATETIME                  	DEFAULT NULL,
  name 	    	    VARCHAR(255)   NOT NULL,
  phone 	    VARCHAR(12)    NOT NULL,
  shipAddress       VARCHAR(255)   NOT NULL,
  PRIMARY KEY (orderID), 
  INDEX customerID (customerID)
);

CREATE TABLE products (
  productID         INT            NOT NULL   AUTO_INCREMENT,
  categoryID        INT            NOT NULL,
  productCode       VARCHAR(10)    NOT NULL,
  productName       VARCHAR(255)   NOT NULL,
  description       TEXT           NOT NULL,
  listPrice         DECIMAL(10,2)  NOT NULL,
  dateAdded         DATETIME       NOT NULL,
  image             blob 	   NOT NULL,
  PRIMARY KEY (productID), 
  INDEX categoryID (categoryID), 
  UNIQUE INDEX productCode (productCode)
);

-- Insert data into the tables
INSERT INTO products (productID, categoryID, productCode, productName, description, listPrice, dateAdded, image) VALUES
(1,  1, 'KEN-001', 'Kenzo -  Embroidered Black', 'Embroidered cotton T-shirt If you want to make a statement and warn anyone against getting on your bad side, Kenzo\'s T-shirt is just the ticket. It looks pretty cool too. The model is also styled with: Versace Chain Reaction sneakers, Marine Serre Moire track pants, Maison Margiela 4-stitches crossbody bag, Off-White arrow print face mask. Let us handle the legwork. \r\n\r\nDelivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Brazil, Guernsey, Isle of Man, San Marino, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay.\r\n( Black\r\n- Cotton \r\n- Crew neck\r\n- Embroidered logo\rn- Short sleeves )', '300.00', '2020-11-01 02:13:00', 0x4b656e7a6f202d20456d62726f69646572656420243138332e6a7067),
(2,  1, 'KEN-002', 'Kenzo - Tiger motif short - sleeved', 'Tiger motif short-sleeved T-shirt You know what they say; sun\'s out guns out. This short-sleeved T-shirt by Kenzo, punctuated with the brand\'s signature tiger motif, is the perfect opportunity to show off your impressive work at the gym. Nice biceps.\r\nLet us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan,  Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay. ( Yale-blue\r\n- Cotton and viscose-blend\r\n- Round neck\r\n- Signature Tiger motif\r\n- Short sleeves\r\n- Straight hem )', '325.00', '2020-11-02 21:32:00', 0x4b656e7a6f202d2054696765722e6a7067),
(3,  1, 'KEN-003', 'Kenzo - Horse print short - sleeved', 'Horse print short-sleeved T-shirt Don\'t be a neigh-sayer. Boasting a soft cotton construction, this statement horse-print T-shirt from Kenzo will inject some equestrian-themed style into your daytime wardrobe. Ride on. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay. ( Black - Cotton - Round neck - Horse print - Short sleeves - Straight hem )', '350.00', '2020-11-03 21:33:00', 0x4b656e7a6f202d20486f7273652e6a7067),
(4,  1, 'KEN-004', 'Kenzo - Contrast-stitch T-shirt',     'Contrast-stitch T-shirt Introduce Kenzo\'s tiger emblem to your wardrobe in a subtle way. This navy blue cotton contrast-stitch T-shirt has the roaring animal embroidered onto the chest of this laid-back style. Your style is roar-some. Featuring a round neck, dropped shoulders, short sleeves, contrast stitching and an embroidered tiger motif to the chest. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay.', '288.00', '2020-11-04 21:31:00', 0x4b656e7a6f202d20436f6e7472617374202d207374697463682e6a7067),
(5,  1, 'KEN-005', 'Kenzo - Cross logo crew - neck',      'Cross logo crew-neck T-shirt If you doubted it was possible for a relationship to stay in the honeymoon stage forever, just take a look at our love affair with this Kenzo Cross Logo T-shirt: we will be together forever. Cross our hearts and hope to die. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay. dark khaki\r\n( Cotton - Logo print to the front - Logo print to the rear - straight hem - Crew neck - short sleeves )', '250.00', '2020-11-05 02:33:00', 0x4b656e7a6f202d204c6f676f2063726577202d206e65636b2e6a7067),
(6,  1, 'KEN-006', 'Kenzo - Logo shape T-shirt',          'Logo shape T-shirt Brighter days call for lighter looks. So stay fresh throughout the stickiest of days in this logo shape T-shirt from Kenzo that has been crafted with breathable cotton. Wear a little less and go out a lot more. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay. ( Blue - Cotton\r\n- Round neck - Straight hem - Short sleeves - boxy fit )', '300.00', '2020-11-06 02:37:00', 0x4b656e7a6f202d2053686170652e6a7067),
(7,  2, 'DOL-001', 'Dolce & Gabbana - Shepherd print',    'Shepherd print T-shirt The perfect T-shirt exists, and Dolce & Gabbana is responsible for it. Made from breathable cotton and boasting a graphic print on its entirety, this one is fit for a Sunday brunch or a Friday night dinner with friends. Just fab. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay. ( Multicolour\r\n- Cotton\r\n- Graphic print\r\n- Round neck\r\n- Short sleeves\r\n- Straight hem)', '550.00', '2020-11-07 02:43:00', 0x446f6c636520242047616262616e612073686570686572642e6a7067),
(8,  2, 'DOL-002', 'Dolce & Gabbana - Mojito print',      'Mojito print T-shirt It\'s is already cocktail o\'clock? Crafted from pure cotton, this mojito print T-shirt from Dolce&Gabbana sets the mood for happy hour. Enough talking, let\'s grab some drinks. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay.\r\n( Light yellow - Cotton - Round neck - Short sleeves - Straight hem - Mojito print )', '439.00', '2020-11-08 02:49:00', 0x446f6c636520242047616262616e61202d206d6f6a69746f202e6a7067),
(9,  2, 'DOL-003', 'Dolce & Gabbana DG logo patch',       'DG logo patch T-shirt Brighter days call for lighter looks. So embrace sunnier weather in this Dolce & Gabbana DG logo patch T-shirt that has a jersey knit which keeps you feeling fresh through the stickiest of days. Wear less and go out more. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay.\r\n( Black - Cotton\r\n- Round neck\r\n- Jersey knit\r\n- Straight hem\r\n- Short sleeves\r\n- Relaxed fit )', '418.00', '2020-11-09 03:02:00', 0x446f6c636520242047616262616e612e6a7067),
(10, 2, 'DOL-004', 'Dolce & Gabbana - Heritage print',    'Heritage print T-shirt You can\'t beat a classic T-shirt. This black and white cotton T-shirt from Dolce & Gabbana boasts a heritage print and round neck. Make a statement. Featuring a round neck and short sleeves. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay.', '328.00', '2020-11-10 02:55:00', 0x446f6c636520242047616262616e61202d2068657269746167652e6a7067),
(11, 2, 'DOL-005', 'Dolce & Gabbana - Tailor polo',       'Tailor-print polo shirt It\'s time to show off that polo shirt. Made from cotton and boasting a signature tailor-print on its entirety, this Dolce & Gabbana piece will surely make an impression when you step foot into the world. Props to you.	Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay. multicolour\r\n( Cotton\r\n- Graphic tailor-print\r\n- Polo collar\r\n- Front button placket\r\n- Short sleeves - Straight hem )', '611.00', '2020-11-11 03:03:00', 0x446f6c636520242047616262616e61207461696c6f722e6a7067),
(12, 2, 'DOL-006', 'Dolce & Gabbana - Embroidered White', 'Embroidered White. There are two letters that can\'t help but make us go weak at the knees. D and G. Handy then, that they are the exact same letters embroidered on this white cotton Dolce & Gabbana T-shirt. What are the chances. Featuring a round neck, short sleeves, an embroidered logo to the chest, a straight hem and a relaxed shape. Let us handle the legwork. Delivery duties are included in the item price when shipping to all EU countries plus The United Kingdom, USA, Canada, China Mainland, Australia, New Zealand, Israel, Puerto Rico, Switzerland, Singapore, Republic Of Korea, Kuwait, Mexico, Qatar, India, Norway, Saudi Arabia, Taiwan Region, Thailand, U.A.E., Japan, Colombia, Lebanon, Hong Kong SAR, the Canary Islands and Bahrain. All import duties are included in your order – the price you see is the price you pay.', '328.00', '2020-11-12 03:05:00', 0x446f6c636520242047616262616e61202d20656d62726f696465726564202d20626c616e6b2e6a7067);

INSERT INTO orders (orderID, customerID, orderDate, shipDate, name, phone, shipAddress) VALUES
(1, 1, '2020-11-01 16:05:00', '2020-11-03 16:05:00', 'Thi', '0935560935', 'H73/06, K356 Hoàng Diệu'),
(2, 2, '2020-11-07 16:50:00', '2020-11-08 16:50:00', 'Loc', '0935560935', '93 Hàm Ng93'),
(3, 3, '2020-11-07 16:51:00', '2020-11-09 16:51:00', 'Thanh', '0914242411', '185 Nguyễn Tri Phương'),
(4, 4, '2020-11-12 17:02:00', '2020-11-15 17:02:00', 'Thắng', '09127873439', '216 Đặng Thai Mai'),
(5, 5, '2020-11-08 17:05:00', '2020-11-10 17:05:00', 'Nhi', '0923232358', '81 Nguyễn Công Trứ');

INSERT INTO orderitems (itemID, orderID, productID, quantity) VALUES
(1, 1, 1, 2);

INSERT INTO customers (customerID, emailAddress, password, firstName, lastName, shipAddress) VALUES
(1, 'Tranquynhthi1999@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Thi', 'Tran', 'H73/06, K356 Hoàng Diệu');

INSERT INTO administrators (adminID, emailAddress, password, firstName, lastName) VALUES
(2, 'Tranquynhthi1999@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Thi', 'Tran');

INSERT INTO addresses (addressID, customerID, city, phone, shipAddress) VALUES
(1, 1, 'Đà Nẵng', '0935568114', 'H73/06, K356 Hoàng Diệu');





