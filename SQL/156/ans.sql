USE WorldEvents;

DROP TABLE IF EXISTS #EventsByLetter;

SELECT
    LEFT(EventName, 1) AS [First Letter],
    COUNT(*) AS [Number of Events]
INTO
    #EventsByLetter
FROM
    tblEvent
GROUP BY
    LEFT(EventName, 1);

SELECT * FROM #EventsByLetter;

-- give error 

INSERT INTO #EventsByLetter
VALUES ('xz', 57);