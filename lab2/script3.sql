-- Insert data into the merge table
INSERT INTO mg_customers (customer_id, first_name, last_name, email, address_id, active)
SELECT dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
FROM dv_customer;

-- Create a sequence for the merge table
CREATE SEQUENCE mg_customers_seq START 600;

-- Add sequence to the merge table
ALTER TABLE mg_customers
ALTER COLUMN customer_id
SET DEFAULT NEXTVAL('mg_customers_seq');

-- Insert more data into the merge table
INSERT INTO mg_customers (last_name, first_name)
SELECT cb_customers.last_name, cb_customers.first_name 
FROM cb_customers
EXCEPT
SELECT dv_customer.last_name, dv_customer.first_name
FROM dv_customer;
