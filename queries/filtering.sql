-- Practice: filtering with WHERE

-- Users whose name starts with 'A'
SELECT * FROM users WHERE name LIKE 'A%';

-- Users whose email ends with '@example.com'
SELECT * FROM users WHERE email LIKE '%@example.com';

-- Users aged between 20 and 35
SELECT * FROM users WHERE age BETWEEN 20 AND 35;

-- Users who are either inactive or banned
SELECT * FROM users WHERE status IN ('inactive', 'banned');

-- Active users older than 30, sorted by age
SELECT * FROM users
WHERE status = 'active' AND age > 30
ORDER BY age DESC;
