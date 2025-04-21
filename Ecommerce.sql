-- E-Commerce Database Schema
-- Created by Joseph Onyango
-- Power Learn Project – Cohort VII, April 2025

-- Drop all tables if they already exist (to reset the database)
DROP TABLE IF EXISTS product_attribute, attribute_type, attribute_category,
product_item, product_variation, size_option, size_category,
color, product_image, product, product_category, brand;

-- -----------------------------------------
-- BRANDS: Who makes the products?
-- -----------------------------------------
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- -----------------------------------------
-- PRODUCT CATEGORIES: How do we classify products?
-- -----------------------------------------
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- -----------------------------------------
-- PRODUCTS: Core details of what is being sold
-- -----------------------------------------
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- -----------------------------------------
-- PRODUCT IMAGES: Visuals for each product
-- -----------------------------------------
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- -----------------------------------------
-- COLORS: What color options are available?
-- -----------------------------------------
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- -----------------------------------------
-- SIZE CATEGORIES: Clothing sizes vs Shoe sizes
-- -----------------------------------------
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- -----------------------------------------
-- SIZE OPTIONS: Individual sizes (e.g., S, M, L, 42)
-- -----------------------------------------
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    label VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- -----------------------------------------
-- PRODUCT VARIATIONS: A product's size + color combo
-- -----------------------------------------
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

-- -----------------------------------------
-- PRODUCT ITEMS: Purchasable units (stock, price)
-- -----------------------------------------
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_variation_id INT,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10,2),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);

-- -----------------------------------------
-- ATTRIBUTE CATEGORIES: Physical or Technical?
-- -----------------------------------------
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- -----------------------------------------
-- ATTRIBUTE TYPES: Define custom attributes (e.g. weight)
-- -----------------------------------------
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(100) NOT NULL,
    type ENUM('text', 'number', 'boolean'),
    FOREIGN KEY (category_id) REFERENCES attribute_category(id)
);

-- -----------------------------------------
-- PRODUCT ATTRIBUTES: Actual values for each product
-- -----------------------------------------
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);
