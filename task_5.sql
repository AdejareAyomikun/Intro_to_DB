-- Insert a single customer into the Customers table of alx_book_store
-- The database name should be passed to the mysql client, for example:
--   mysql -u root -p alx_book_store < .\task_5.sql

INSERT INTO customer (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');
