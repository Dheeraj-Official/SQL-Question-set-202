USE Music_01;

-- query 1

SELECT TOP 5 WITH TIES
    Title,
    Release_date,
    [US_sales_(m)],
    Wiki_URL
FROM 
    dbo.Album
ORDER BY
    [US_sales_(m)] DESC;

-- query 2

SELECT TOP 3 WITH TIES
    Title,
    Release_date,
    Wiki_URL
FROM 
    dbo.Album
ORDER BY
    Release_date DESC;

-- query 3

SELECT TOP 10 
    Title,
    Album_mins,
    Album_secs,
    Wiki_URL
FROM
    dbo.Album
ORDER BY 
    (Album_mins * 60 + Album_secs) DESC

-- query 4

SELECT TOP 10 
    Title,
    Album_mins,
    Album_secs,
    Wiki_URL
FROM
    dbo.Album
ORDER BY 
    (Album_mins * 60 + Album_secs) ASC;