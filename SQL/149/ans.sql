USE WorldEvents;

DECLARE @Continent VARCHAR(50) = 'Westeros';

-- SET IDENTITY_INSERT tblContinent ON;

-- INSERT INTO tblContinent (ContinentID, ContinentName)
-- VALUES (9, @Continent);

SET IDENTITY_INSERT tblContinent OFF;

SELECT * FROM tblContinent;

BEGIN TRANSACTION;

DELETE tblContinent
WHERE ContinentName = @Continent;

IF LEFT(@Continent, 1) <> 'W'
BEGIN

    SELECT 'You have died' AS 'Lost the game';
    ROLLBACK TRANSACTION;

    UPDATE tblContinent
    SET ContinentName = 'Seven Kingdoms'
    WHERE ContinentName = @Continent;
    SELECT * FROM tblContinent
    ORDER BY ContinentID DESC;
END
ELSE
BEGIN
    SELECT 'You have won' AS  'you won the game of thrones';
    COMMIT TRANSACTION;

    SELECT * FROM tblContinent
    ORDER BY ContinentID DESC;
END