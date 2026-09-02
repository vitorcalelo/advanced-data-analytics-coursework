-- =========================================================================
-- Recupere da tabela trips todas as corridas que começaram no Loop (pickup_location_id: 50) em um sábado e terminaram em O'Hare (dropoff_location_id: 63).
-- Obtenha as condições meteorológicas para cada corrida. Use o método que você aplicou na tarefa anterior.
-- Além disso, recupere a duração de cada corrida. Ignore corridas para as quais os dados sobre as condições meteorológicas não estão disponíveis.
-- As colunas da tabela devem estar na seguinte ordem:
-- start_ts
-- weather_conditions
-- duration_seconds
-- Ordene por trip_id.
-- =========================================================================

SELECT 
    tp.start_ts,
        CASE 
        WHEN description LIKE '%rain%' 
            OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions,
    tp.duration_seconds
FROM 
    trips tp
    INNER JOIN neighborhoods nh ON nh.neighborhood_id = tp.pickup_location_id
    INNER JOIN weather_records wr ON wr.ts = tp.start_ts
WHERE
    EXTRACT(DOW FROM start_ts::date) = 6 AND
    pickup_location_id = '50' AND dropoff_location_id = '63'
ORDER BY 
    tp.trip_id