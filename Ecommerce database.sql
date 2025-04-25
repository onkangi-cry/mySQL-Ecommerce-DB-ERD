-- We create a database for our ecommerce-- 

CREATE DATABASE ecommerce;
USE ecommerce;


-- We then create a brand table-- 
CREATE TABLE brand(
brand_id INT AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(100) NOT NULL);

-- We then create a product_category  table e.g shoes,clothing-- 
CREATE TABLE product_category(
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL);

-- Now we create real products e.g NIKE,ADIDAS--
--  It is a child table-- 
CREATE TABLE products(
products_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
brand_id INT,
category_id INT,
base_price DECIMAL(10,2),
FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
FOREIGN KEY(category_id) REFERENCES product_category(category_id)
-- We are simply saying that the brand and categrry id in the child products' table must match the ones in the parents' table--
 );
 
 -- Now We create an image table that will  have a correlation with products table-- 
 CREATE TABLE product_image(
 image_id INT AUTO_INCREMENT PRIMARY KEY,
 product_id INT,
 image_url VARCHAR(255),
 FOREIGN KEY(product_id) REFERENCES products(products_id));
 
-- Color Table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50)
);

-- Size Category Table
CREATE TABLE size_category (
    size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    size_cat_name VARCHAR(100)
); 
 
 
 -- Size Option Table
CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_label VARCHAR(10),
    size_cat_id INT,
    FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);

-- Product Item Table (specific color/size variants)
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_id INT,
    stock INT,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES products(products_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- Product Attribute Tables
CREATE TABLE attribute_category (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    attr_cat_name VARCHAR(100)
);

-- attribute type-- 

CREATE TABLE attribute_type (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    attr_type_name VARCHAR(50)
);

-- product attribute-- 
CREATE TABLE product_attribute (
    attr_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attr_cat_id INT,
    attr_type_id INT,
    attr_name VARCHAR(100),
    attr_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(products_id),
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);
-- I have also made an EER DIAGRAM-- 
-- ....-- 



