CREATE OR REPLACE FUNCTION check_point_in_bounding_box()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    point_lat FLOAT;
    point_lon FLOAT;
BEGIN
    -- Extract the latitude and longitude from the inserted point
    point_lat := ST_Y(NEW.geom);
    point_lon := ST_X(NEW.geom);

    -- Check if the point is within the bounding box
    IF point_lat < -37.85 OR point_lat > -37.75
       OR point_lon < 144.90 OR point_lon > 145.00 THEN
        -- If the point is outside the bounding box, raise a notice
        RAISE NOTICE 'Inserted point is outside the bounding box: (%, %)', point_lat, point_lon;
    ELSE
        -- If the point is inside the bounding box, raise a notice
        RAISE NOTICE 'Inserted point is within the bounding box: (%, %)', point_lat, point_lon;
    END IF;

    -- Return the inserted record unchanged
    RETURN NEW;
END $$;
