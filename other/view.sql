CREATE VIEW concert_stats AS
SELECT a.artist_id, -- Gets artistID
       a.artist_name, -- Gets artist name
       
       SUM( -- Sums all artists' time at concerts together
              (SELECT ROUND(SUM(s.length), 2) -- Calculates the time an artist played for at a concert
               FROM songs s
               JOIN concert_to_songs cts ON s.song_id = cts.song_id -- Join used to find which songs have been played at a concert
               JOIN artist_to_song ats ON s.song_id = ats.song_id -- Finds which artist played each of these songs
               WHERE cts.concert_id = atc.concert_id -- Matches to the current concert 
                 AND ats.artist_id = a.artist_id ) -- Checks the current artist
       ) AS total_time_played_for,
       
       SUM( -- Sums all the revenue each artist made at a concert
              (SELECT ROUND(SUM(DISTINCT ct.ticket_price) / (SELECT COUNT(DISTINCT atc2.artist_id) -- Divides the revenue evenly between each artist
                                                             FROM artist_to_concert atc2
                                                             WHERE atc2.concert_id = atc.concert_id), 2)
               FROM concert_tickets ct
               WHERE atc.concert_id = ct.concert_id ) -- Gets the tickets of the concert
       ) AS total_revenue_made

FROM artists a
JOIN artist_to_concert atc ON a.artist_id = atc.artist_id -- Join artists to their concerts
GROUP BY a.artist_id, a.artist_name -- Separates the values by the artist
HAVING total_time_played_for > 7; -- Only includes artists that have significant playtime
