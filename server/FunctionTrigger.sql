--Confirm order function
CREATE OR REPLACE FUNCTION confirm_order(amb_id_param INT, user_id_param INT)
RETURNS TABLE(success INT, message TEXT) AS $$
DECLARE
    existing_order_count INT;
BEGIN
    SELECT COUNT(*) INTO existing_order_count
    FROM "Hello_Doc"."Order Ambulance"
    WHERE "Status" = 'Confirmed' AND "Ambulance id" = amb_id_param;

    IF existing_order_count > 0 THEN
        success := 0;
        message := 'You have already confirmed an order.';
    ELSE
     
        UPDATE "Hello_Doc"."Order Ambulance"
        SET "Status" = 'Confirmed'
        WHERE "Ambulance id" = amb_id_param AND "user_id" = user_id_param;

     
        UPDATE  "Hello_Doc"."Order Ambulance"
  SET "Status" = 'Declined'
        WHERE "Status" = 'Pending' AND "user_id" = user_id_param;
  
  UPDATE  "Hello_Doc"."Order Ambulance"
  SET "Status" = 'Declined'
        WHERE "Status" = 'Pending' AND "Ambulance id" = amb_id_param;

       
        DECLARE
            userLocation TEXT;
        BEGIN
            SELECT "Location" INTO userLocation
            FROM "Hello_Doc"."User"
            WHERE "Reg. Number" = user_id_param;

            UPDATE "Hello_Doc"."Ambulance"
            SET "Availability" = false, "Current Location" = userLocation
            WHERE "ID" = amb_id_param;
        END;

        success := 1;
        message := 'Order confirmed.';
    END IF;

    RETURN QUERY SELECT success, message;
EXCEPTION
    WHEN OTHERS THEN
        success := 2;
        message := SQLERRM;
        RETURN QUERY SELECT success, message;
END; $$ LANGUAGE plpgsql;
--Function
CREATE OR REPLACE FUNCTION check_user_status_before_insert()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (SELECT 1 FROM "Hello_Doc"."Order Ambulance" WHERE "user_id"=NEW.user_id AND "Status"='Confirmed') THEN
    RAISE EXCEPTION 'User with id % already has a confirmed status', NEW.user_id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger
CREATE TRIGGER check_status_before_insert
BEFORE INSERT ON "Hello_Doc"."Order Ambulance"
FOR EACH ROW
EXECUTE PROCEDURE check_user_status_before_insert();