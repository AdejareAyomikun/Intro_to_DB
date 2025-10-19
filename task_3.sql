-- List all tables in the current database.
-- Provide the database name as an argument to the mysql client.
-- Examples (PowerShell):
--   mysql -u root -p alx_book_store < .\task_3.sql
--   mysql -u root -p -D alx_book_store < .\task_3.sql

SHOW TABLES;

-- Alternative (uses INFORMATION_SCHEMA) if you prefer a SELECT result:
-- SELECT table_name
-- FROM information_schema.tables
-- WHERE table_schema = DATABASE()
-- ORDER BY table_name;

