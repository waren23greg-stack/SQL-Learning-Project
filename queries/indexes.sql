-- Practice: Indexes

-- View existing indexes on a table
SHOW INDEX FROM users;
SHOW INDEX FROM orders;

-- Add an index on email (speeds up WHERE email = ...)
CREATE INDEX idx_users_email ON users (email);

-- Add an index on status (speeds up WHERE status = ...)
CREATE INDEX idx_users_status ON users (status);

-- Composite index on orders (speeds up WHERE user_id = ... AND status = ...)
CREATE INDEX idx_orders_user_status ON orders (user_id, status);

-- Check how MySQL uses an index with EXPLAIN
EXPLAIN SELECT * FROM users WHERE email = 'alice@example.com';
EXPLAIN SELECT * FROM orders WHERE user_id = 1 AND status = 'paid';

-- Remove an index
DROP INDEX idx_users_status ON users;