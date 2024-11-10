-- int(10), varchar(128), varchar(64), year(4)
INSERT INTO artists (artist_id, artist_name, genre, debut_year) VALUES
(213700, 'Lady Gaga', 'Pop', 2008),
(270503, 'Eminem', 'Rap', 1999),
(202854, 'Daft Punk', 'Electronic', 1994),
(290065, 'Pharrell Williams', 'Hip-Hop', 2003),
(290934, 'Paul Williams', 'Blues', 1965);

-- int(10), varchar(128), date(yyy-mm-dd)
INSERT INTO albums (album_id, album_title, release_date) VALUES
(623490, 'The Fame', '2008-08-19'),
(632759, 'The Marshall Mathers LP', '2000-05-23'),
(617654, 'Music to Be Murdered By', '2020-01-31'),
(653956, 'Kamikaze', '2018-08-31'),
(683219, 'Random Access Memories', '2013-05-17'),
(645935, 'Homework', '1997-01-20');

-- int(10), int(10)
INSERT INTO artist_to_album (artist_id, album_id) VALUES
(213700, 623490), -- Lady Gaga, The Fame
(270503, 632759), -- Eminem, The Marshall Mathers LP
(270503, 617654), -- Eminem, Music to Be Murdered By
(270503, 653956), -- Eminem, Kamikaze
(202854, 683219), -- Daft Punk, Random Access Memories
(202854, 645935); -- Daft Punk, Homework

-- int(10), int(10), varchar(128), double(minutes), date(yyyy-mm-dd)
-- REMEMBER ! convert mm:ss to decimal, NOT mm.ss ! ! ! example 3:58 -> 3.97
INSERT INTO songs (song_id, album_id, song_title, length, release_date) VALUES
(200968, 623490, 'Just Dance', 4.03, '2008-04-08'),
(200456, 623490, 'Poker Face', 3.97, '2008-09-23'),
(200987, 623490, 'Paparazzi', 3.48, '2009-07-06'),
(200353, 632759, 'Remember me?', 3.63, '2000-05-23'),
(200454, 617654, 'Godzilla', 3.50, '2020-01-31'),
(200305, 653956, 'Venom', 4.48, '2018-09-21'),
(200123, 683219, 'Get Lucky', 6.15, '2013-04-19'),
(200374, 683219, 'Beyond', 4.83, '2013-04-30'),
(200047, 683219, 'Touch', 8.32, '2013-05-17'),
(200503, 645935, 'Around the World', 5.15, '1997-04-07');

-- int(10), int(10)
INSERT INTO artist_to_song (artist_id, song_id) VALUES
(213700, 200968), -- Lady Gaga, Just Dance
(213700, 200456), -- Lady Gaga, Poker Face
(213700, 200987), -- Lady Gaga, Paparazzi
(270503, 200353), -- Eminem, Remember me?
(270503, 200454), -- Eminem, Godzilla
(270503, 200305), -- Eminem, Venom
(202854, 200123), -- Daft Punk, Get Lucky
(202854, 200047), -- Daft Punk, Touch
(202854, 200374), -- Daft Punk, Beyond
(202854, 200503), -- Daft Punk, Around the World
(290065, 200123), -- Pharrell Williams, Get Lucky
(290934, 200374), -- Paul Williams, Beyond
(290934, 200047); -- Paul Williams, Touch

-- int(10), varchar(256), varchar(256), date(yyyy-mm-dd)
INSERT INTO concerts (concert_id, concert_title, location, date_of_concert) VALUES
(300458, 'Fortnite x Eminem', 'Worldwide', '2023-12-02'),
(300657, 'The Fame Ball Tour', 'United States', '2009-03-12'),
(300468, 'Daftendirektour', 'WorldWide', '1997-10-02'),
(300173, 'Pharrell Williams', 'England', '2014-07-14');

-- int(10), int(10)
INSERT INTO artist_to_concert (artist_id, concert_id) VALUES
(213700, 300657), -- Lady Gaga, The Fame Ball Tour
(270503, 300458), -- Eminem, Fortnite x Eminem
(290065, 300173), -- Pharrell Williams
(202854, 300468); -- DaftPunk, Daftendirektour

-- int(10), int(10), tinyint(4)
INSERT INTO concert_to_songs (concert_id, song_id, order_performance) VALUES
(300458, 200454, 1), -- Fortnite x Eminem, Godzilla
(300458, 200305, 2), -- Fortnite x Eminem, Venom
(300657, 200968, 1), -- The Fame Ball Tour, Just Dance
(300657, 200456, 2), -- The Fame Ball Tour, Poker Face
(300657, 200987, 3), -- The Fame Ball Tour, Paparazzi
(300173, 200123, 1), -- Pharrell Williams, Get Lucky
(300468, 200047, 1), -- Daftendirektour, Touch
(300468, 200374, 2), -- Daftendirektour, Beyond
(300468, 200503, 3); -- Daftendirektour, Around the World

-- int(10), int(10), date(yyyy-mm-dd), double
INSERT INTO concert_tickets (ticket_id, concert_id, purchase_date, ticket_price) VALUES
(444044, 300458, '2023-12-01', 0.00),
(465087, 300657, '2009-02-12', 450.50),
(467890, 300657, '2009-01-10', 999.99),
(418198, 300173, '2014-07-06', 123.45),
(419870, 300173, '2014-07-03', 415.90),
(420167, 300173, '2014-07-02', 290.10),
(489159, 300468, '1997-09-24', 300.50),
(490127, 300468, '1997-09-27', 67.80);

-- int(10), varchar(128), varchar(128), tinyint(3)
INSERT INTO fans (fan_id, fan_name, fan_email, age) VALUES
(509876, 'Andrew Blair', 'arb95@hotmail.com', 25),
(501234, 'Gavin Water', 'gavinwater45@gmail.com', 55),
(508976, 'Michael French', 'bigj04@outlook.com', 43),
(501967, 'Donald Womp', 'mrpresnr1@mail.us', 78),
(502374, 'Lewis Kubica', 'lew4kub@gmail.com', 36),
(507454, 'David Guilfoyle', 'davidg13@gmail.com', 20);

-- int(10), int(10)
INSERT INTO fan_to_favorite_artist_id (fan_id, favorite_artist_id) VALUES
(509876, 213700), -- Andrew Blair, Lady Gaga
(509876, 270503), -- Andrew Blair, Eminem
(507454, 290065), -- David Guilfoyle, Pharrell Williams
(507454, 290934), -- David Guilfoyle, Paul Williams
(508976, 202854), -- Michael French, Daft Punk
(502374, 213700), -- Lewis Kubica, Lady Gaga
(501234, 213700), -- Gavin Water, Lady Gaga
(501967, 213700), -- Donald Womp, Lady Gaga
(501967, 202854); -- Donald Womp, Lady Gaga

-- int(10), int(10), varchar(16), varchar(16)
INSERT INTO ticket_to_fan (ticket_id, fan_id, seat_zone, seat_number) VALUES
(444044, 509876, 'Center', '436'), -- Andrew Blair, Fortnite x Eminem
(467890, 509876, 'Upper Middle', 'A234'), -- Andrew Blair, The Fame Ball Tour
(467890, 501234, 'Upper Middle', 'A235'), -- Gavin Water, The Fame Ball Tour
(465087, 501967, 'Lower Left', 'B045'), -- Donald Womp, The Fame Ball Tour
(418198, 502374, 'Left Stage', 'L567'), -- Lewis Kubica, Pharrell Williams
(419870, 508976, 'Left Stage', 'L542'), -- Michael French, Pharrell Williams
(420167, 507454, 'Upper Left Stage', 'LU432'), -- David Guillfoyle, Pharrell Williams
(489159, 501967, 'VIP Box', 'V5'), -- Donald Womp, Dafetendirektour
(490127, 501234, 'Upper Middle', 'UM45'); -- Gavin Water, Daftendirektour
