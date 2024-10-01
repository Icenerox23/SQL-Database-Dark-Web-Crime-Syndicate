INSERT INTO polygons (name, geom)
SELECT 
    'Intersection of ' || p1.name || ' and ' || p2.name AS name,
    ST_Intersection(p1.geom, p2.geom) AS geom
FROM 
    polygons p1,
    polygons p2
WHERE 
    p1.id < p2.id
    AND ST_Intersects(p1.geom, p2.geom);

