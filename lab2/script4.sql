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

-- Query 3

SELECT first_name, last_name
FROM dv_customer
WHERE address_id IN (
    SELECT address_id
    FROM dv_address
    WHERE district IN (
	    SELECT district
        FROM dv_address
        GROUP BY district
        HAVING COUNT(*) >= ALL (
            SELECT COUNT(*)
            FROM dv_address
            GROUP BY district)
    )
);

-- Query 4

SELECT rating, COUNT(*)
FROM dv_film
GROUP BY rating
HAVING COUNT(*) <= ALL (
    SELECT COUNT(*)
    FROM dv_film
    GROUP BY rating
);

-- Query 5

SELECT first_name, last_name
FROM cb_authors
WHERE author_id IN (
    SELECT author_id
    FROM cb_books
    GROUP BY author_id
    ORDER BY COUNT(*) DESC
    LIMIT 10
);
