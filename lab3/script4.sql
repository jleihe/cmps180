-- The following violates the forein key constrain on mg_customers
DELETE FROM dv_address
WHERE address_id = 1;


-- The following violates the forein key constrain on cb_books
DELETE FROM cb_authors
WHERe author_id = 1;
