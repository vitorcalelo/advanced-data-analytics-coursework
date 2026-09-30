-- =========================================================================
-- De 1 a 7 de novembro de 2017, as empresas de táxi mais populares foram Flash Cab e Taxi Affiliation Services.
-- Encontre o número de corridas para essas duas empresas e nomeie a variável resultante como trips_amount.
-- Junte as corridas de todas as outras empresas no grupo "Other". Agrupe os dados por nomes de empresas de táxi. Nomeie o campo com os nomes das empresas de táxi company.
-- Ordene o resultado em ordem decrescente por trips_amount.
-- =========================================================================

SELECT 
    CASE 
        WHEN cb.company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN cb.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
        ELSE 'Other'
    END AS company,
    COUNT(tp.trip_id) AS trips_amount
FROM 
    trips tp
    INNER JOIN 
    cabs cb ON cb.cab_id = tp.cab_id
WHERE 
    tp.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY 
    company
ORDER BY 
    trips_amount DESC
