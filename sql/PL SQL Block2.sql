DO $$
DECLARE
    num_points INT := 10;  -- Number of points to insert
    i INT := 1;  -- Counter for the loop

    -- Bounding box coordinates
    min_lat FLOAT := -37.85;
    max_lat FLOAT := -37.75;
    min_lon FLOAT := 144.90;
    max_lon FLOAT := 145.00;

BEGIN
    -- Loop to call the procedure multiple times
    FOR i IN 1..num_points LOOP
        -- Call the stored procedure to insert a single point
        CALL insert_single_point(min_lat, max_lat, min_lon, max_lon);
    END LOOP;

END $$;
