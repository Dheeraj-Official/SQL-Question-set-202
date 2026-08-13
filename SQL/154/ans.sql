use DoctorWho;

-- agar fk hai to phele usko delete kro then table ko delete kro
IF EXISTS (
    SELECT * FROM sys.foreign_keys WHERE name = 'FK_AuthorGenre'
)
    ALTER TABLE tblAuthor DROP CONSTRAINT FK_AuthorGenre;

DROP TABLE IF EXISTS tblGenre;

-- table ko create kro
CREATE TABLE tblGenre (
    GenreId INT IDENTITY(1,1) PRIMARY KEY,
    GenreName VARCHAR(50),
    rating int 
);

INSERT INTO tblGenre (GenreName, rating)
VALUES 
    ('Romance', 3),
    ('Science Fiction', 7),
    ('Thriller', 5),
    ('Humour', 3);


IF EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE Table_Name = 'tblAuthor' AND Column_Name = 'GenreId'
)
    ALTER TABLE tblAuthor DROP COLUMN GenreId;

ALTER TABLE tblAuthor
ADD GenreId INT;

ALTER TABLE tblAuthor
ADD CONSTRAINT FK_AuthorGenre FOREIGN KEY (GenreId)
REFERENCES tblGenre(GenreId);


SELECT * FROM tblGenre;
SELECT * FROM tblAuthor;