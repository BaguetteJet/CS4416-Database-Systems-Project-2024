delimiter // 
CREATE VIEW concert_stats AS
SELECT a.artist_id,
       a.artist_name,
       (SELECT SUM(DISTINCT s.length)
        FROM artist_to_song ats
        JOIN songs s ON ats.song_id = s.song_id
        WHERE ats.artist_id = a.artist_id) AS time_played_for,
       
       (SELECT SUM(DISTINCT ct.ticket_price)
        FROM artist_to_concert atc
        JOIN concert_tickets ct ON atc.concert_id = ct.concert_id
        WHERE atc.artist_id = a.artist_id) AS total_revenue

FROM artists a
JOIN artist_to_concert atc ON a.artist_id = atc.artist_id
GROUP BY a.artist_id, a.artist_name
HAVING time_played_for > 11.5;

-- Task 6: Procedure
DELIMITER //
CREATE PROCEDURE AddSongAlbumAssoc(IN this_song_id INTEGER(10), IN this_album_id INTEGER(10))
BEGIN
    -- create variables
	DECLARE assocExists INTEGER;
    DECLARE song_release_date DATE;
    DECLARE album_release_date DATE;
    
    -- check if the association already exists
    SELECT COUNT(*) INTO assocExists
    FROM song_to_album
    WHERE song_id = this_song_id AND album_id = this_album_id;
    
    -- if it doesn't exist, then assocExists = 0
    IF assocExists = 0 THEN
        -- create the association
        INSERT INTO song_to_album(song_id, album_id)
        VALUES(this_song_id, this_album_id);
        
        -- get the song's release date
        SELECT release_date INTO song_release_date
        FROM songs
        WHERE song_id = this_song_id;
        
        -- get the album's release date
        SELECT release_date INTO album_release_date
        FROM albums
        WHERE album_id = this_album_id;
        
        -- if the song was released after the album, 
        -- set the song's release date to the album's release date
        IF song_release_date > album_release_date
        THEN UPDATE songs
        	SET release_date = album_release_date
            WHERE song_id = this_song_id;
        END IF;
	END IF;
END//
