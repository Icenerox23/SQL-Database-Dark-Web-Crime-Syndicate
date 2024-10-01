CREATE OR REPLACE PROCEDURE insert_single_point(min_lat FLOAT, max_lat FLOAT, min_lon FLOAT, max_lon FLOAT)
LANGUAGE plpgsql
AS $$
DECLARE
    random_lat FLOAT;
    random_lon FLOAT;
    point_name TEXT;
BEGIN
    -- Generate random latitude and longitude within specified range
    random_lat := random() * (max_lat - min_lat) + min_lat;
    random_lon := random() * (max_lon - min_lon) + min_lon;

    -- Generate point name using the sequence
    point_name := 'Point ' || nextval('point_name_seq');

    -- Insert the point into the points table with a name and geometry
    INSERT INTO points (name, geom)
    VALUES (
        point_name,
        ST_SetSRID(ST_MakePoint(random_lon, random_lat), 4326)
    );

    -- Log the insertion
    RAISE NOTICE 'Inserted % at (%, %)', point_name, random_lat, random_lon;
END $$;