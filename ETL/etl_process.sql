INSERT INTO dim_customer (customer_id, name, city)
SELECT user_id, name, city
FROM food_oltp1.users;

INSERT INTO dim_product (product_id, name, category, price)
SELECT product_id, name, category, price
FROM food_oltp1.products;

INSERT INTO dim_restaurant (restaurant_id, name, city)
SELECT restaurant_id, name, city
FROM food_oltp1.restaurants;

INSERT INTO dim_time (order_date, day, month, year)
SELECT 
    order_date,
    DAY(order_date),
    MONTH(order_date),
    YEAR(order_date)
FROM food_oltp1.orders;


INSERT INTO fact_sales (customer_id, product_id, restaurant_id, time_id, quantity, total_amount)
SELECT 
    o.user_id AS customer_id,
    oi.product_id,
    o.restaurant_id,
    t.time_id,
    oi.quantity,
    (oi.quantity * oi.price) AS total_amount
FROM food_oltp1.order_items oi
JOIN food_oltp1.orders o 
    ON oi.order_id = o.order_id
JOIN dim_time t
    ON o.order_date = t.order_date;