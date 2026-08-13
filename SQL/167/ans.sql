
drop table if exists #tables;

SELECT
	'Stored procedure' AS ObjectType,
	[name] AS ObjectName,
	CAST(create_date AS Date) As DateCreated
INTO
	#tables
FROM
	sys.objects
WHERE
	[type] = 'P' AND
	CharIndex('episodes',lower([name])) = 0 AND left([name],3) <> 'sp_'

INSERT INTO #tables (
	ObjectType,
	ObjectName,
	DateCreated
)
SELECT
	'Scalar function',
	[name],
	CAST(create_date AS Date)
FROM
	sys.objects
WHERE
	[type] = 'FN' AND left([name],3) <> 'fn_'

SELECT * FROM #tables;


select * from sys.objects;