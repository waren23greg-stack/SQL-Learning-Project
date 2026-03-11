-- Practice: CTEs (Common Table Expressions)

-- Basic CTE: active users
WITH active_users AS (
    SELECT * FROM users
    WHERE status = 'active'
)
SELECT * FROM active_users;

-- CTE: total spent per user
WITH user_spending AS (
    SELECT user_id, SUM(total) AS total_spent
    FROM orders
    WHERE status = 'paid'
    GROUP BY user_id
)
SELECT u.name, us.total_spent
FROM users u
INNER JOIN user_spending us ON us.user_id = u.id
ORDER BY us.total_spent DESC;

-- Multiple CTEs: active users with their order count
WITH active_users AS (
    SELECT * FROM users WHERE status = 'active'
),
order_counts AS (
    SELECT user_id, COUNT(*) AS total_orders
    FROM orders
    GROUP BY user_id
)
SELECT u.name, oc.total_orders
FROM active_users u
LEFT JOIN order_counts oc ON oc.user_id = u.id;