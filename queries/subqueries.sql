-- Practice: Subqueries

-- Users who have placed at least one order
SELECT name FROM users
WHERE id IN (SELECT user_id FROM orders);

-- Users who have never placed an order
SELECT name FROM users
WHERE id NOT IN (SELECT user_id FROM orders);

-- Orders with a total higher than the average order value
SELECT product, total FROM orders
WHERE total > (SELECT AVG(total) FROM orders);

-- Most expensive order per user
SELECT u.name, o.product, o.total
FROM users u
INNER JOIN orders o ON o.user_id = u.id
WHERE o.total = (
    SELECT MAX(total) FROM orders
    WHERE user_id = u.id
);

-- Users who only have paid orders
SELECT name FROM users
WHERE id IN (SELECT user_id FROM orders WHERE status = 'paid')
AND id NOT IN (SELECT user_id FROM orders WHERE status != 'paid');