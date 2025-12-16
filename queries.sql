SELECT * FROM customers WHERE country='India';

SELECT order_id, total_amount
FROM orders
ORDER BY total_amount DESC;

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

SELECT o.order_id, c.name, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT order_id, total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

SELECT SUM(total_amount) FROM orders;
SELECT AVG(total_amount) FROM orders;

CREATE VIEW customer_sales AS
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT * FROM customer_sales;

CREATE INDEX idx_orders_customer ON orders(customer_id);
