-- query 1: list all of the albums , tracks,artists and geners

SELECT
  t.TrackId,
  t.Name AS TrackName,
  al.Title AS AlbumTitle,
  ar.Name AS ArtistName,
  g.Name AS GenreName,
  t.UnitPrice
FROM tracks t
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists ar ON al.ArtistId = ar.ArtistId
JOIN genres g ON t.GenreId = g.GenreId
ORDER BY ar.Name, al.Title, t.TrackId
LIMIT 100;

-- query 2:for every special gener filter
SELECT
  t.TrackId,
  t.Name AS TrackName,
  al.Title AS AlbumTitle,
  ar.Name AS ArtistName,
  g.Name AS GenreName,
  t.UnitPrice
FROM tracks t
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists ar ON al.ArtistId = ar.ArtistId
JOIN genres g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
ORDER BY t.UnitPrice DESC
LIMIT 50;

-- query 3: for every artist and gener

SELECT
  ar.Name AS ArtistName,
  g.Name AS GenreName,
  COUNT(*) AS NumTracks,
  ROUND(AVG(t.UnitPrice), 2) AS AvgPrice
FROM tracks t
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists ar ON al.ArtistId = ar.ArtistId
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY ar.Name, g.Name
HAVING COUNT(*) > 5
ORDER BY NumTracks DESC
LIMIT 20;
