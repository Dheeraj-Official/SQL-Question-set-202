USE Music_01;

SELECT *
FROM
    dbo.Venue;

-- Query 2

SELECT
    TOP 5
    Venue,
    Capacity,
    Opening_date,
    Closing_date,
    Demolition_date,
    [Construction_cost_$m],
    [Address]
FROM
    dbo.Venue
ORDER BY Capacity DESC;


-- Query 3

SELECT
    TOP 6
    Venue,
    Capacity,
    Opening_date,
    Closing_date,
    Demolition_date,
    [Construction_cost_$m],
    [Address]
FROM
    dbo.Venue
ORDER BY Opening_date DESC;


-- Query 4

SELECT
    TOP 21
    Venue,
    Capacity,
    Opening_date,
    Closing_date,
    Demolition_date,
    [Construction_cost_$m],
    [Address]
FROM
    dbo.Venue
ORDER BY Closing_date DESC;

-- Query 5


SELECT
    TOP 5
    Venue,
    Capacity,
    Opening_date,
    Closing_date,
    Demolition_date,
    [Construction_cost_$m],
    [Address]
FROM
    dbo.Venue
ORDER BY demolition_date DESC;


-- Query 6


SELECT
    TOP 5
    Venue,
    Capacity,
    Opening_date,
    Closing_date,
    Demolition_date,
    [Construction_cost_$m],
    [Address]
FROM
    dbo.Venue
ORDER BY Construction_cost_$m DESC;