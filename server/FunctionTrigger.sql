--Confirm order function(1)
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



--Trigger(1)
CREATE OR REPLACE FUNCTION check_user_status_before_insert()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (SELECT 1 FROM "Hello_Doc"."Order Ambulance" WHERE "user_id"=NEW.user_id AND "Status"='Confirmed') THEN
    RAISE EXCEPTION 'User with id % already has a confirmed status', NEW.user_id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER check_status_before_insert
BEFORE INSERT ON "Hello_Doc"."Order Ambulance"
FOR EACH ROW
EXECUTE PROCEDURE check_user_status_before_insert();



--Ambulance Function(2)
CREATE OR REPLACE FUNCTION get_available_ambulances()
RETURNS SETOF "Hello_Doc"."Ambulance" AS $$
DECLARE
    ambulance_record "Hello_Doc"."Ambulance"%ROWTYPE;
    ambulance_cursor CURSOR FOR
        SELECT *
        FROM "Hello_Doc"."Ambulance"
        WHERE "Availability" = TRUE
        ORDER BY "Current Location" ASC;
BEGIN
    FOR ambulance_record IN ambulance_cursor LOOP
        -- Return each ambulance record
        RETURN NEXT ambulance_record;
    END LOOP;

    RETURN;
END;
$$ LANGUAGE plpgsql;

-- PROCEDURE(1)
CREATE OR REPLACE PROCEDURE "Hello_Doc"."get_ambulance_req"("hospital_id" int4)
 AS $$
DECLARE
  ambulance_id INT;
  dri_id INT;
  problem TEXT;
  amount NUMERIC;
  status TEXT;
BEGIN
  -- Drop the temporary table if it exists
  BEGIN
    EXECUTE 'DROP TABLE IF EXISTS temp_driver_request';
  EXCEPTION
    WHEN others THEN
      NULL;
  END;

  -- Create the temporary table
  CREATE TEMPORARY TABLE temp_driver_request (
    ambulance_id INT,
    dri_id INT,
    problem TEXT,
    amount NUMERIC,
    status TEXT
  );

  -- Retrieve all ambulance IDs associated with the hospital ID
  FOR ambulance_id IN
    SELECT "Hello_Doc"."Manage Ambulance".ambulance_id
    FROM "Hello_Doc"."Manage Ambulance"
    WHERE "Hello_Doc"."Manage Ambulance"."hos_id" = hospital_id
  LOOP
    -- Retrieve dri_id, problem, amount, and status for each ambulance
    FOR dri_id, problem, amount, status IN
      SELECT "Hello_Doc"."Driver request for money"."Dri_id",
             "Hello_Doc"."Driver request for money"."Problem",
             "Hello_Doc"."Driver request for money"."Amount",
             "Hello_Doc"."Driver request for money"."Status"
      FROM "Hello_Doc"."Driver request for money"
      WHERE "Hello_Doc"."Driver request for money"."Amb_ID" = ambulance_id
    LOOP
      -- Insert retrieved data into temp_driver_request
      INSERT INTO temp_driver_request (ambulance_id, dri_id, problem, amount, status)
      VALUES (ambulance_id, dri_id, problem, amount, status);
    END LOOP;
  END LOOP;

END;
$$
  LANGUAGE plpgsql