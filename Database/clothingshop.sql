create database clothingshop
go

use clothingshop
go

-- Bảng User
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    role_id INT,
    address VARCHAR(255),
    phone_no VARCHAR(20),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Bảng Role
CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    name_role VARCHAR(50) NOT NULL
);

-- Bảng User_payment_method
CREATE TABLE User_payment_method (
    id INT PRIMARY KEY,
    payment_type_id INT,
    expiry_date DATE,
    account_num VARCHAR(50),
    provider VARCHAR(50),
    user_id INT,
    FOREIGN KEY (payment_type_id) REFERENCES Payment_type(payment_type_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Bảng Payment_type
CREATE TABLE Payment_type (
    payment_type_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Bảng User_review
CREATE TABLE User_review (
    review_id INT PRIMARY KEY,
    user_id INT,
    rating_value INT,
    comment TEXT,
    ordered_product_id INT, 
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (ordered_product_id) REFERENCES Order_line(id) 
);

-- Bảng Shop_order
CREATE TABLE Shop_order (
    id INT PRIMARY KEY,
    order_total DECIMAL(10, 2) NOT NULL,
    address_id INT,
    user_id INT, 
    order_status_id INT,
    shipping_method_id INT,
    payment_method_id INT, 
    order_date DATE,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (order_status_id) REFERENCES Order_status(id),
    FOREIGN KEY (shipping_method_id) REFERENCES Shipping_method(id),
    FOREIGN KEY (payment_method_id) REFERENCES User_payment_method(id) 
);

-- Bảng Order_status
CREATE TABLE Order_status (
    id INT PRIMARY KEY,
    status VARCHAR(50) NOT NULL
);

-- Bảng Shipping_method
CREATE TABLE Shipping_method (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Bảng Address
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Bảng User_address
CREATE TABLE User_address (
    address_id INT,
    user_id INT,
    is_default tinyint,
    PRIMARY KEY (address_id, user_id), 
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Bảng Order_line
CREATE TABLE Order_line (
    id INT PRIMARY KEY,
    order_id INT,
    product_item_id INT,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Shop_order(id),
    FOREIGN KEY (product_item_id) REFERENCES Product_item(id)
);

-- Bảng Product_item
CREATE TABLE Product_item (
    id INT PRIMARY KEY,
	category_id INT NOT NULL,
	name VARCHAR(255),
	description VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    qty_in_stock INT NOT NULL,
    product_image VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES Product_category(id)
);

-- Bảng Product_category
CREATE TABLE Product_category (
    id INT PRIMARY KEY NOT NULL,
    category_name VARCHAR(100) NOT NULL
);

-- Bảng Variation
CREATE TABLE Variation (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Product_category(id)
);

-- Bảng Variation_option
CREATE TABLE Variation_option (
    id INT PRIMARY KEY,
    variation_id INT,
    value VARCHAR(100) NOT NULL,
    FOREIGN KEY (variation_id) REFERENCES Variation(id)
);

-- Bảng Product_configuration 
CREATE TABLE Product_configuration (
    product_item_id INT,
    variation_option_id INT,
    PRIMARY KEY (product_item_id, variation_option_id),
    FOREIGN KEY (product_item_id) REFERENCES Product_item(id),
    FOREIGN KEY (variation_option_id) REFERENCES Variation_option(id)
);

-- Bảng Promotion
CREATE TABLE Promotion (
    id INT PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    discount_rate DECIMAL(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Bảng Category_promotion 
CREATE TABLE Category_promotion (
    category_id INT,
    promotion_id INT,
    PRIMARY KEY (category_id, promotion_id),
    FOREIGN KEY (category_id) REFERENCES Product_category(id),
    FOREIGN KEY (promotion_id) REFERENCES Promotion(id)
);

-- Bảng Shopping_cart
CREATE TABLE Shopping_cart (
    cart_id INT PRIMARY KEY,
    user_id INT UNIQUE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Bảng Shopping_cart_item
CREATE TABLE Shopping_cart_item (
    cart_id INT,
    product_item_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (cart_id, product_item_id),
    FOREIGN KEY (cart_id) REFERENCES Shopping_cart(cart_id),
    FOREIGN KEY (product_item_id) REFERENCES Product_item(id)
);

-- Bảng Country
CREATE TABLE Country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

