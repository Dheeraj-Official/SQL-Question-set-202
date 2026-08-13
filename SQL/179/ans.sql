USE WorldEvents
GO

-- CTC is used immediately ater the creation of the table
WITH ThisAndThat AS (
	SELECT
		e.EventId,
        CASE
			WHEN e.EventDetails LIKE '%this%' THEN 1
			ELSE 0
		END AS IfThis,
	
		-- does description contain THAT?
		CASE
			WHEN e.EventDetails LIKE '%that%' THEN 1
				ELSE 0
		END AS IfThat

	FROM
		tblEvent AS e
)

SELECT
	t.IfThis,
	t.IfThat,
	COUNT(*) AS 'Number of events'
FROM
	ThisAndThat AS t
GROUP BY
	t.IfThis,
	t.IfThat

-- SELECT
-- 	e.EventName,
-- 	e.EventDetails
-- FROM
-- 	tblEvent AS e
-- 	INNER JOIN ThisAndThat AS t ON e.EventID = t.EventID
-- WHERE
-- 	IfThis = 1 and IfThat = 1
