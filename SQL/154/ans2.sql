use DoctorWho;

UPDATE tblAuthor
SET GenreId = (SELECT GenreId FROM tblGenre WHERE GenreName = 'Thriller')
WHERE AuthorName = 'Matt Jones';

UPDATE tblAuthor
SET GenreId = (SELECT GenreId FROM tblGenre WHERE GenreName = 'Science Fiction')
WHERE AuthorName = 'James Moran';

UPDATE tblAuthor
SET GenreId = (SELECT GenreId FROM tblGenre WHERE GenreName = 'Romance')
WHERE AuthorName = 'Mark gatiss';

SELECT
    A.AuthorName,
    G.GenreName
FROM tblAuthor AS A
jOIN tblGenre AS G
    ON A.GenreId = G.GenreId;