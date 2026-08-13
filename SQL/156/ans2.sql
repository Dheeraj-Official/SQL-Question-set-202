USE WorldEvents;

DROP TABLE IF EXISTS #EventsByLetter;

CREATE TABLE #EventsByLetter (
    [First Letter] VARCHAR(2),
    [Number of Events] INT
);

INSERT INTO #EventsByLetter (
    [First Letter],
    [Number of Events]
)
SELECT
    LEFT(EventName, 1),
    COUNT(*)
FROM
    tblEvent
GROUP BY
    LEFT(EventName, 1);

INSERT INTO #EventsByLetter
VALUES ('xz', 57);

SELECT *
FROM #EventsByLetter
ORDER BY
    [First Letter];