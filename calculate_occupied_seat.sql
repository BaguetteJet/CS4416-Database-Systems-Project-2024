CREATE FUNCTION calculate_occupied_seats (input_concert_id INT) -- Creates Function
RETURNS INT -- Function gives back an integer
NOT DETERMINISTIC -- Makes the function be able change based on data in the database
BEGIN
    DECLARE total_seats INT DEFAULT	0; -- Initalise local variable to 0

    -- Calculate the number of seats associated with all tickets for the given concert
    SELECT COUNT(tf.seat_number) -- Counts the number of seats in ticket_to_fan
    INTO total_seats -- stores in local variable total_seats
    FROM concert_tickets AS ct JOIN ticket_to_fan AS tf ON ct.ticket_id = sa.ticket_id -- Joins concert_tickets and ticket_to_fan for the corresponding ticket_id
    WHERE ct.concert_id = input_concert_id; -- where the inputted concert_id is equal to the concert_id in concert_tickets

    RETURN total_seats; -- Return the total seat count
END//

-- Change delimiter to ; //
