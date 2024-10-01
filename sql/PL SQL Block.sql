DO $$
DECLARE
    num_points INT := 10;  -- Number of points to insert
    i INT := 1;  -- Counter for the loop
    random_lat FLOAT;
    random_lon FLOAT;
    point_name TEXT;

    -- Bounding box coordinates (selection criteria)
    min_lat FLOAT := -37.85;
    max_lat FLOAT := -37.75;
    min_lon FLOAT := 144.90;
    max_lon FLOAT := 145.00;

BEGIN
    -- Loop to insert points with sequence-based names and selection conditions
    FOR i IN 1..num_points LOOP
        -- Generate random latitude and longitude within specified range
        random_lat := random() * (max_lat - min_lat) + min_lat;
        random_lon := random() * (max_lon - min_lon) + min_lon;
        -- Generate point name using the sequence
        point_name := 'Point ' || nextval('point_name_seq');

        -- Selection: Check if the point is within a specific bounding box
        IF random_lat >= min_lat AND random_lat <= max_lat
            AND random_lon >= min_lon AND random_lon <= max_lon THEN

            -- Insert the point into the points table with a name and geometry
            INSERT INTO points (name, geom)
            VALUES (
                point_name,
                ST_SetSRID(ST_MakePoint(random_lon, random_lat), 4326)
            );

            -- Corrected RAISE NOTICE with correct placeholders
            RAISE NOTICE 'Inserted % at (%, %)', point_name, random_lat, random_lon;
        ELSE
            -- Corrected RAISE NOTICE for points outside the bounding box
            RAISE NOTICE 'Generated point (%, %) is outside the bounding box', random_lat, random_lon;
        END IF;
    END LOOP;

END $$;
