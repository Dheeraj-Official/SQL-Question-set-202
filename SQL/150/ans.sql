USE Music_01;

DROP TABLE IF EXISTS Musicians;

-- Create copy table
SELECT *
INTO Musicians
FROM Artist;

SELECT * FROM Musicians
order by Artist_ID;

UPDATE Musicians
SET Year_disbanded = 2024 
WHERE Artist = 'The Wise Owls';


INSERT INTO Musicians (Artist) -- Artist = ArtistName
VALUES 
    ('Andy Brownowl'),
    ('Sam owlne');

SELECT * FROM Musicians
order by Artist_ID;

DELETE FROM Musicians
WHERE Artist = 'Andy Brownowl';

SELECT * FROM Musicians
order by Artist_ID;