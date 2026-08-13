USE Music_01;

-- q1 
SELECT
    Venue,
    Address,
    LEFT(Address, CHARINDEX(',', Address)) AS Street_address
FROM Venue;