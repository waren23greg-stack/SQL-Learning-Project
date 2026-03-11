-- Practice: aggregations

-- Count all users
SELECT COUNT(*) AS total_users FROM users;

-- Count users by status
SELECT status, COUNT(*) AS total
FROM users
GROUP BY status;

-- Total revenue from paid orders
SELECT SUM(total) AS total_revenue
FROM orders
WHERE status = 'paid';

-- Average order value
SELECT AVG(total) AS avg_order_value FROM orders;

-- Most expensive and cheapest order
SELECT MAX(total) AS most_expensive,
       MIN(total) AS cheapest
FROM orders;

-- Users who spent more than 50 in total
SELECT u.name, SUM(o.total) AS total_spent
FROM users u
INNER JOIN orders o ON o.user_id = u.id
GROUP BY u.name
HAVING total_spent > 50
ORDER BY total_spent DESC;