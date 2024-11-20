DELIMITER //
-- check for minimum age
CREATE TRIGGER CheckAge
BEFORE INSERT ON fans 
FOR EACH ROW 
BEGIN
    -- if age of new fan is under 16
    IF NEW.age < 16 
    THEN 
        -- throw error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'TRIGGER: Age below 16.';
    END IF;
END//

-- delete ticket info
CREATE TRIGGER DeleteTicket
AFTER DELETE ON concert_tickets
FOR EACH ROW
BEGIN
    -- delete entries in ticket_to_fan for matching ticket_id
    DELETE FROM ticket_to_fan
    WHERE ticket_id = OLD.ticket_id;
END //

DELIMITER ;