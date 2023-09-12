-- ------------------------------------- --
-- ANALIZING THE MUSIC_OVERLORD DATABASE --
-- ------------------------------------- --
USE music_overlord;
-- HOW MANY ARTISTS ARE IN THE DATABASE
SELECT COUNT(artistID) AS Count
FROM artist;

-- WHICH IS THE MOST RECENT RECORD ON 'RECORD' TABLE?
SELECT Title, Date_Released
FROM Record
WHERE Date_Released >= '2022-12-31'
GROUP BY Title, Date_Released; 

-- HOW MANY SONGS ARE IN 'SONGS' TABLE?
SELECT COUNT(Title) AS Count
FROM songs;

-- HOW MANY USERS REGISTERED IN THE APP ON 2021?
SELECT UserName, RegistrationDate
FROM users
WHERE YEAR(RegistrationDate) = '2021'
GROUP BY UserName, RegistrationDate;

-- WHO'S THE ARTIST WITH MORE SONGS?
SELECT artist.ArtistName, COUNT(songs.Title) AS Count
FROM artist
JOIN songs
ON artist.ArtistID = songs.ArtistID
GROUP BY artist.ArtistName
ORDER BY Count DESC;

-- WHAT'S THE TITLE OF THE OLDEST ALBUM ON 'RECORD' TABLE?
SELECT RecordID, Title, Date_Released
FROM record
GROUP BY RecordID, Title, Date_Released
ORDER BY Date_Released;

-- HOW MANY REPRODUCTIONS ARE IN TOTAL?
SELECT COUNT(Reproduced) AS Count
FROM reproductions;

-- WHICH USER HAS THE MOST REPRODUCTIONS ON RECORD?
SELECT users.UserNAME, COUNT(reproductions.Reproduced) AS ReproductionsCount
FROM users
JOIN reproductions
ON users.UserID = reproductions.UserID
GROUP BY users.UserName
ORDER BY ReproductionsCount DESC;

-- HOW MANY SONG HAS ANY ARTIST ON 'SONGS' TABLE?
SELECT artist.ArtistName, COUNT(songs.SongID) AS SongCount
FROM artist
JOIN songs
ON artist.ArtistID = songs.ArtistID
WHERE artist.ArtistName = 'Adele'
GROUP BY ArtistName;

-- HOW MANY DIFERENT COUNTRIES APPEAR ON DATABASE?
SELECT DISTINCT Country
FROM artist;
-- HOW MANY RECORDS OF ARTISTS ARE ON ANY COUNTRY?
SELECT artist.Country, COUNT(record.RecordID) AS RecordCount
FROM artist
JOIN record
ON record.artistID = artist.artistID
WHERE Country = 'United States'
GROUP BY artist.Country
ORDER BY RecordCount DESC;

SELECT artist.Country, record.Title
FROM artist
JOIN record
ON record.artistID = artist.artistID
WHERE Country = 'United Kingdom'
GROUP BY artist.Country, record.Title;

-- WHAT'S THE MOST COMMON GENRE ON 'SONG'S TABLE?
SELECT artist.Genre, COUNT(artist.Genre) AS GenreCount
FROM artist
GROUP BY artist.Genre
ORDER BY GenreCount DESC;

-- WHAT'S THE LONGEST SONG IN 'SONGS'?
SELECT Title, MAX(Length) As Length
FROM songs
GROUP BY Title
ORDER BY Length DESC;

-- HOW MANY ARTISTS HAS MORE THAN 10 SONGS?

SELECT artist.ArtistName, COUNT(songs.SongID) As SongCount
FROM artist
JOIN songs
ON artist.ArtistID = songs.ArtistID
GROUP BY artist.ArtistName
HAVING COUNT(songs.SongID) = 6
ORDER BY artist.ArtistName;


-- WHAT'S THE MOST PLAYED SONG ON 'REPRODUCTIONS'?
SELECT songs.Title, COUNT(*) AS TotalReproducciones
FROM songs
JOIN reproductions ON songs.SongID = reproductions.SongID
GROUP BY songs.Title
Order BY TotalReproducciones DESC
LIMIT 1;

-- WHAT'S THE ARTIST WITH THE MOST REPRODUCED SONG?
SELECT artist.ArtistName AS ArtistName, COUNT(*) AS TotalReproducciones
FROM artist
JOIN songs ON artist.ArtistID = songs.ArtistID
JOIN reproductions ON songs.SongID = reproductions.SongID
GROUP BY artist.artistName
Order BY TotalReproducciones DESC
Limit 1;

-- HOW MANY USERS HAVE REPRODUCED A SONG AT LEAST ONCE?

SELECT COUNT(DISTINCT UserID) AS TotalUsers
FROM Reproductions;


-- HOW MANY ARTISTS SHARE THE SAME MUSIC GENRE?

SELECT Genre AS Genre, COUNT(*) AS Sum
FROM artist
GROUP BY Genre
HAVING COUNT(*) > 1
ORDER BY Sum DESC;


-- HOW MANY SONGS ON A GIVEN GENRE ARE ON 'SONGS' TABLE?

SELECT COUNT(*) AS TotalSongs
FROM artist
WHERE Genre = 'Pop';


-- HOW MANY ARTIST NAME'S STARTS WITH LETTER 'A'?

SELECT COUNT(*) AS TotalWithA
FROM Artist
WHERE ArtistName LIKE 'A%';

