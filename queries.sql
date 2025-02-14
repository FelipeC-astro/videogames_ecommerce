-- SQL Queries

SELECT title, genre, platform, printf('$%.2f', price) as price_Brazilian_Real, stock, release_year FROM games;

-- View all clients
SELECT * FROM customers;

-- View orders with formatted items and prices
SELECT orders.order_id, customers.name, games.title, order_items.quantity, printf('R$%.2f', order_items.price) as price_Brazilian_Real
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN games ON order_items.game_id = games.game_id;
