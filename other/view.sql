CREATE VIEW concert_stats AS
SELECT a.artist_id,
       a.artist_name,
       (SELECT ROUND(SUM(DISTINCT s.length), 2)
        FROM artist_to_song ats
        JOIN songs s ON ats.song_id = s.song_id
        WHERE ats.artist_id = a.artist_id) AS total_time_played_for,
       
       (SELECT ROUND(SUM(DISTINCT ct.ticket_price), 2)
        FROM artist_to_concert atc
        JOIN concert_tickets ct ON atc.concert_id = ct.concert_id
        WHERE atc.artist_id = a.artist_id) AS total_revenue_made

FROM artists a
JOIN artist_to_concert atc ON a.artist_id = atc.artist_id
GROUP BY a.artist_id, a.artist_name
HAVING time_played_for > 11.5;
