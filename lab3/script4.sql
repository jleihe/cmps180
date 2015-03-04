-- FOREIN KEY CONSTRAINTS

-- The following violates the forein key constrain on mg_customers
DELETE FROM dv_address
WHERE address_id = 1;


-- The following violates the forein key constrain on cb_books
DELETE FROM cb_authors
WHERe author_id = 1;

-- GENERAL CONSTRAINTS

-- This is compliant with the positive_length constraint
INSERT INTO dv_film VALUES (5000, 'fun', 'Fun movie', 20);

-- This vilates the positive_length constraint
INSERT INTO dv_film VALUES (20, 'fun', 'Fun movie', -10);

-- This is compliant with the not null constraint on mg_customers
INSERT INTO mg_customers (address_id) VALUES (1);

-- This violates the not null constraint on mg_customers
INSERT INTO mg_customers (first_name) VALUES('John');

-- This is compliant with the not null constraint on dv_address
INSERT INTO dv_address (address_id, address) VALUES (5000, '123 ucsc way');

-- This violates the not null constraint on dv_address
INSERT INTO dv_address (address_id) VALUES (5000);

