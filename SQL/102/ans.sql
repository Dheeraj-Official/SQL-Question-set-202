use WorldEvents

DECLARE @EarliestDate DATETIME
DECLARE @LatestDate DATETIME
DECLARE @NumberOfEvents INT
DECLARE @EventInfo	VARCHAR(100)

SELECT
	@EarliestDate= MIN(EventDate),
    @LatestDate = MAX(EventDate),
    @NumberOfEvents = COUNT(*),
    @EventInfo = 'Summary of events'
FROM
	tblEvent AS E 

SELECT
	@EventInfo AS [Title],
    CONVERT(VARCHAR(10),@EarliestDate,103) AS [Earlest Date],
    CONVERT(VARCHAR(10),@LatestDate,103)  AS [Latest Date],
    @NumberOfEvents AS [Number of Events]
