-- Task 6
-- Write a stored procedure that checks whether a given song_id is associated with a given album_id.
-- If not, insert this association into the database. 
-- Additionally, adjust the song's release date if it is later than the album's.

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