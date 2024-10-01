-- Selects all points outside the polygons
SELECT pt.name
FROM points pt
WHERE NOT EXISTS (
    SELECT 1 FROM polygons p
    WHERE ST_Within(pt.geom, p.geom)
);
