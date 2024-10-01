-- Finds the nearest polygon for points outside the polygons
SELECT pt.name, p.name, ST_Distance(pt.geom, p.geom) AS distance
FROM points pt, polygons p
WHERE NOT ST_Within(pt.geom, p.geom)
ORDER BY distance
LIMIT 1;