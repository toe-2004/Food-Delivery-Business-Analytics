CREATE DATABASE food_datawarehouse;
USE food_datawarehouse;

CREATE TABLE dim_customer (
    customer_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DOUBLE
);

CREATE TABLE dim_restaurant (
    restaurant_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE dim_time (
    time_id INT NOT NULL PRIMARY KEY,
    order_date DATE,
    day INT,
    month INT,
    year INT
);

CREATE TABLE fact_sales (
    sale_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    restaurant_id INT,
    time_id INT,
    quantity INT,
    total_amount DOUBLE,

    FOREIGN KEY (customer_id)
        REFERENCES dim_customer(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES dim_product(product_id),

    FOREIGN KEY (restaurant_id)
        REFERENCES dim_restaurant(restaurant_id),

    FOREIGN KEY (time_id)
        REFERENCES dim_time(time_id)
);
