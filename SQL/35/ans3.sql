use Music_01;

-- q3
SELECT
    Venue,
    CASE
        WHEN Other_names IS NULL THEN 0
        ELSE LEN(Other_names) - LEN(REPLACE(Other_names, ';', '')) + 1
    END AS NumberOfFormerNames,
    Other_names
FROM Venue