USE bke_electronics;

-- 1.
SELECT users.user_id, users.user_name, orders.order_id
FROM users
JOIN orders ON users.user_id = orders.user_id;

-- 2.
SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS total_orders
FROM users
LEFT JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name;

-- 3.
SELECT orders.order_id, COUNT(order_details.product_id) AS total_products
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_id;

-- 4.
SELECT users.user_id, users.user_name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
ORDER BY orders.order_id, users.user_id;

-- 5.
SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS total_orders
FROM users
JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name
ORDER BY total_orders DESC
LIMIT 7;

-- 6.
SELECT users.user_id, users.user_name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
WHERE products.product_name LIKE '%Samsung%' OR products.product_name LIKE '%Apple%'
ORDER BY users.user_id
LIMIT 7;

-- 7.
SELECT users.user_id, users.user_name, orders.order_id, SUM(products.product_price) AS total_price
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
GROUP BY users.user_id, users.user_name, orders.order_id;

-- 8.
SELECT t.user_id, t.user_name, t.order_id, t.total_price
FROM (
    SELECT users.user_id, users.user_name, orders.order_id, 
           SUM(products.product_price) AS total_price,
           RANK() OVER (PARTITION BY users.user_id ORDER BY SUM(products.product_price) DESC) AS rnk
    FROM users
    JOIN orders ON users.user_id = orders.user_id
    JOIN order_details ON orders.order_id = order_details.order_id
    JOIN products ON order_details.product_id = products.product_id
    GROUP BY users.user_id, users.user_name, orders.order_id
) t
WHERE t.rnk = 1;

-- 9.
SELECT t.user_id, t.user_name, t.order_id, t.total_price, t.total_products
FROM (
    SELECT users.user_id, users.user_name, orders.order_id, 
           SUM(products.product_price) AS total_price,
           COUNT(order_details.product_id) AS total_products,
           RANK() OVER (PARTITION BY users.user_id ORDER BY SUM(products.product_price) ASC) AS rnk
    FROM users
    JOIN orders ON users.user_id = orders.user_id
    JOIN order_details ON orders.order_id = order_details.order_id
    JOIN products ON order_details.product_id = products.product_id
    GROUP BY users.user_id, users.user_name, orders.order_id
) t
WHERE t.rnk = 1;

-- 10.
SELECT t.user_id, t.user_name, t.order_id, t.total_price, t.total_products
FROM (
    SELECT users.user_id, users.user_name, orders.order_id, 
           SUM(products.product_price) AS total_price,
           COUNT(order_details.product_id) AS total_products,
           RANK() OVER (PARTITION BY users.user_id ORDER BY COUNT(order_details.product_id) DESC) AS rnk
    FROM users
    JOIN orders ON users.user_id = orders.user_id
    JOIN order_details ON orders.order_id = order_details.order_id
    JOIN products ON order_details.product_id = products.product_id
    GROUP BY users.user_id, users.user_name, orders.order_id
) t
WHERE t.rnk = 1;
