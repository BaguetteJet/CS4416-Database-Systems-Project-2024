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
