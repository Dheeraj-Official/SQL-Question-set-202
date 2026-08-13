USE Music_01
GO

CREATE OR ALTER PROC usp_Number_1_Albums AS
SELECT 
    title, 
    Release_date, 
    [US_sales_(m)]
FROM Album
WHERE US_Billboard_200_peak = 1;
GO

ALTER PROC usp_Number_1_Albums AS
SELECT 
    title, 
    Release_date, 
    [US_sales_(m)]
FROM Album
ORDER BY [US_sales_(m)] DESC;
GO

EXEC usp_Number_1_Albums;