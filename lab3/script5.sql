CREATE VIEW customer_city AS
    SELECT first_name, last_name, city_id
    FROM mg_customers AS a, dv_address AS b
    WHERE a.address_id = b.address_id;

CREATE VIEW district_stats AS
    SELECT district, COUNT(*)
    FROM dv_address AS a, dv_customer AS b
    WHERE a.address_id = b.address_id
    GROUP BY district
    ORDER BY COUNT(*);

SELECT district
FROM district_stats
WHERE count <= ALL (SELECT count
                    FROM district_stats)
LIMIT 5;

ALTER VIEW customer_city RENAME TO awesome_name;


