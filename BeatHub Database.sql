show databases;
create database BeatHub;
use  BeatHub;
show tables;
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    image BLOB, -- Change from VARCHAR to BLOB for storing binary image data
    phone_number VARCHAR(15), -- Use VARCHAR(15) to handle international numbers
    username VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Artists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT,
    image BLOB -- Change from VARCHAR to BLOB
);

CREATE TABLE Albums (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    cover_image BLOB, -- Add if you want album covers as BLOBs
    FOREIGN KEY (artist_id) REFERENCES Artists(id) ON DELETE CASCADE
);

CREATE TABLE Songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year YEAR NOT NULL,
    cover_image BLOB, -- Change from VARCHAR to BLOB for storing binary image data
    duration TIME NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(id) ON DELETE SET NULL
);



-- Create Song_Artists Table (Many-to-Many Relationship Between Songs and Artists)
CREATE TABLE Song_Artists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Songs(id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES Artists(id) ON DELETE CASCADE
);

-- Create Playlists Table
CREATE TABLE Playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    cover_image VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Create Playlist_Songs Table (Many-to-Many Relationship Between Playlists and Songs)
CREATE TABLE Playlist_Songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (playlist_id) REFERENCES Playlists(id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES Songs(id) ON DELETE CASCADE
);
