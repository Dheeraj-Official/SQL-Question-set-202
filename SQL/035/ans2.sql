use Music_01;

-- q2
SELECT
    Venue,
    Address,
    CASE
        WHEN CHARINDEX(',', Address) = 0 THEN Address
        ELSE LEFT(Address, CHARINDEX(',', Address) - 1)
    END AS Street_address
FROM Venue;
GO
