-- =========================================================================
-- Imprima o campo company_name.
-- Encontre o número de corridas de táxi para cada empresa de táxi de 15 a 16 de novembro de 2017, nomeie o campo resultante como trips_amount e imprima-o também.
-- Classifique os resultados pelo campo trips_amount em ordem decrescente.
-- =========================================================================

SELECT 
	cb.company_name,
    COUNT(tp.trip_id) AS trips_amount
FROM 
	trips tp 
    INNER JOIN 
    cabs cb 
    ON 
    cb.cab_id = tp.cab_id
WHERE 
	tp.start_ts::date BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY
	cb.company_name
ORDER BY
	trips_amount DESC