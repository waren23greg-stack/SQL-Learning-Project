-- basic SELECT queries

-- Get all users
SELECT * FROM users;

-- Get only active users
SELECT * FROM users WHERE status = 'active';

-- Get users older than 25
SELECT * FROM users WHERE age > 25;

-- Get just names and emails
SELECT name, email FROM users;