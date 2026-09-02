-- =========================================================================
-- Encontre o número de corridas para cada empresa de táxi cujo nome contém as palavras "Yellow" ou "Blue" ("Amarelo" ou "Azul", respectivamente) de 1 a 7 de novembro de 2017. 
-- Nomeie a variável resultante como trips_amount. 
-- Agrupe os resultados pelo campo company_name.
-- =========================================================================
SELECT 
    cb.company_name,
	COUNT(tp.trip_id) AS trips_amount
FROM 
	trips tp
INNER JOIN cabs cb ON cb.cab_id = tp.cab_id
WHERE 
	cb.company_name LIKE '%Yellow%'
	AND tp.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
	cb.company_name
UNION ALL
SELECT
    cabs.company_name as company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN 
    trips 
ON 
    trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
    AND cabs.company_name LIKE '%%Blue%%'
GROUP BY company_name;