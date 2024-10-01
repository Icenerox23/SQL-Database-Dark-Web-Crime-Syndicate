CREATE TRIGGER after_insert_check_bounding_box
AFTER INSERT ON points
FOR EACH ROW
EXECUTE FUNCTION check_point_in_bounding_box();
