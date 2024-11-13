-- Altered artists table 
CREATE TABLE artists (
    artist_id INTEGER(10) PRIMARY KEY, -- ADDED primary key
    artist_name VARCHAR(128),
    genre VARCHAR(64),
    debut_year YEAR
);

-- Altered albums table
CREATE TABLE albums (
    album_id INTEGER(10) PRIMARY KEY, -- ADDED primary key
    -- artist_id INTEGER(10), -- REMOVED column
    album_title VARCHAR(256),
    release_date DATE
);

-- Created for artists & albums 
-- (to allow multiple artists per album)
CREATE TABLE artist_to_album (
    artist_id INTEGER(10),
    album_id INTEGER(10),
    PRIMARY KEY (artist_id, album_id), -- ensure unique combination
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id), -- link
    FOREIGN KEY (album_id) REFERENCES albums(album_id) -- link
);

-- Altered songs
CREATE TABLE songs (
    song_id INTEGER(10) PRIMARY KEY, -- ADDED primary key
    album_id INTEGER(10), -- can remove this to implement the song_to_album table
    song_title VARCHAR(128),
    length REAL,
    release_date DATE,  
    FOREIGN KEY (album_id) REFERENCES albums(album_id) -- ADDED link
);

-- Created for artists & songs 
-- (to allow multiple artists per song)
CREATE TABLE artist_to_song (
    artist_id INTEGER(10),
    song_id INTEGER(10),
    PRIMARY KEY (artist_id, song_id), -- ensure unique combination
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id), -- link
    FOREIGN KEY (song_id) REFERENCES songs(song_id) -- link
);

/*
-- Created for songs & albums
-- (to allow songs to be on multiple albums)
CREATE TABLE song_to_album (
    song_id INTEGER(10),
    album_id INTEGER(10),
    PRIMARY KEY (song_id, album_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);
*/

-- Altered concerts
CREATE TABLE concerts (
    concert_id INTEGER(10) PRIMARY KEY, -- ADDED primary key
    -- artist_id INTEGER(10), -- REMOVED column
    concert_title VARCHAR(256),
    location VARCHAR(256),
    date_of_concert DATE
);

-- Created table for artists & concerts 
-- (to allow multiple artists per concert)
CREATE TABLE artist_to_concert (
    artist_id INTEGER(10),
    concert_id INTEGER(10),
    PRIMARY KEY (artist_id, concert_id), -- ensure unique combination
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id), -- link
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id) -- link
);

-- ALtered concert songs 
-- (performance order in concerts)
CREATE TABLE concert_to_songs (
    concert_id INTEGER(10),
    song_id INTEGER(10),
    order_performance TINYINT(4),
    PRIMARY KEY (concert_id, song_id), -- ADDED to ensure unique combination
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id), -- ADDED link
    FOREIGN KEY (song_id) REFERENCES songs(song_id) -- ADDED link
);

-- Created table for fans
-- (data removed from concert_tickets)
CREATE TABLE fans (
    fan_id INTEGER(10) PRIMARY KEY, -- ADDED primary key
    fan_name VARCHAR(128),
    fan_email VARCHAR(128),
    age TINYINT(3)
);

-- Created table for fans & favorite artists 
-- (multiple favorite artists per fan)
CREATE TABLE fan_to_favorite_artist_id (
    fan_id INTEGER(10),
    favorite_artist_id INTEGER(10),
    PRIMARY KEY (fan_id, favorite_artist_id), -- ensure unique combination
    FOREIGN KEY (fan_id) REFERENCES fans(fan_id), -- link
    FOREIGN KEY (favorite_artist_id) REFERENCES artists(artist_id) -- link
);

-- Table for tickets (shared tickets)
CREATE TABLE concert_tickets (
    ticket_id INTEGER(10) PRIMARY KEY, -- ADDED primary key
    concert_id INTEGER(10),
    -- fan_id INTEGER(10), -- REMOVED
    -- fan_name VARCHAR(128), -- REMOVED
    -- fan_email VARCHAR(128), -- REMOVED
    -- age TINYINT(3), -- REMOVED
    -- favourite_artist_id INTEGER(10), -- REMOVED
    purchase_date DATE,
    ticket_price DOUBLE,
    -- seat_zone  VARCHAR(16), -- REMOVED
    -- seat_number VARCHAR(16), -- REMOVED
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id) -- link
);

-- Junction table for fans and tickets (multiple fans per ticket)
CREATE TABLE ticket_to_fan (
    ticket_id INTEGER(10),
    fan_id INTEGER(10),
    seat_zone VARCHAR(16),
    seat_number VARCHAR(16),
    PRIMARY KEY (ticket_id, fan_id), -- ensure unique combination
    FOREIGN KEY (ticket_id) REFERENCES concert_tickets(ticket_id), -- link
    FOREIGN KEY (fan_id) REFERENCES fans(fan_id) -- link 
);
