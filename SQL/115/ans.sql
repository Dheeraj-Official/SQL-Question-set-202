USE WorldEvents;
GO

CREATE OR ALTER PROCEDURE uspCategoryEvents
    @CategoryName VARCHAR(100) = NULL,
    @After DATETIME = NULL,
    @CategoryId INT = NULL
AS
BEGIN
    SELECT 
        c.CategoryName,
        e.EventDate,
        c.CategoryID
    FROM 
        tblCategory c
    JOIN 
        tblEvent e ON c.CategoryID = e.CategoryID
    WHERE 
        (@CategoryName IS NULL OR c.CategoryName LIKE '%' + @CategoryName + '%')
        AND (@After IS NULL OR e.EventDate >= @After)
        AND (@CategoryId IS NULL OR c.CategoryID = @CategoryId)
    ORDER BY 
        e.EventDate;
END
GO