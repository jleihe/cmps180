-- Query 1

SELECT m.first_name, m.last_name
FROM dv_customer AS m, cb_customers AS c
WHERE m.first_name || m.last_name = c.first_name || c.last_name;

-- Query 2

SELECT phone
FROM dv_address
WHERE address_id IN (
SELECT m.address_id
FROM dv_customer AS m, cb_customers AS c
WHERE m.first_name || m.last_name = c.first_name || c.last_name);

-- Query 3. What are the first and last names of all customers who live in the district having the most customers?

SELECT first_name, last_name
FROM dv_customer
WHERE address_id IN (
	SELECT 

-- Query 4. What rating is the least common among films in the Downtown Video database, and how many films have that rating? (Return both the rating and the number of films in one result.)


-- Query 5. What are the first and last names of the top 10 authors when ranked by the number of books each has written?

