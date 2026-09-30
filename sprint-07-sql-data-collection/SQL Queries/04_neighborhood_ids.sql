-- =========================================================================
-- Recupere os identificadores dos bairros O'Hare e Loop da tabela neighborhoods.
-- =========================================================================

SELECT neighborhood_id, name
FROM neighborhoods
WHERE name LIKE '%Hare' OR name LIKE 'Loop'