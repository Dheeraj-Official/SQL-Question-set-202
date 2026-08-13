USE WorldEvents;

DECLARE @OddCountries TABLE
(
    OddName    VARCHAR(100),
    OddNumber  INT
);

INSERT INTO @OddCountries (OddName, OddNumber)
SELECT CountryName, CountryID
FROM tblCountry
WHERE CountryID % 2 <> 0;

SELECT
    e.EventName,
    oc.OddName
FROM tblEvent e
JOIN @OddCountries oc ON e.CountryID = oc.OddNumber
WHERE
    e.EventName NOT LIKE '%' + oc.OddName + '%'
    AND RIGHT(e.EventName, 1) = RIGHT(oc.OddName, 1);