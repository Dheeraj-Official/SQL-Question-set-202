use Music_01;
go

CREATE OR ALTER PROC usp_Rock_and_Roll_Albums
AS
SELECT
    a.Title,
    ar.Artist,
    s.Subgenre
FROM Album a
JOIN Artist ar ON a.Artist_ID = ar.Artist_ID
JOIN Subgenre s ON a.Subgenre_ID = s.Subgenre_ID
WHERE s.Subgenre = 'Rock and roll'
ORDER BY a.Title
go

exec usp_Rock_and_Roll_Albums