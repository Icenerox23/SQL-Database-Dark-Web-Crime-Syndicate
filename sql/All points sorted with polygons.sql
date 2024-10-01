-- Displays all points with destinquishing between inside respective polygons and outside
SELECT pt.name AS point_name, 
       COALESCE(p.name, 'Outside') AS polygon_name
FROM points pt
LEFT JOIN polygons p
ON ST_Within(pt.geom, p.geom);