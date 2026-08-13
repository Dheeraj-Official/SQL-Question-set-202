USE Music_01;

SELECT
    ISNULL(pc.Parent_Company, 'Total') AS 'Parent Company',
    ISNULL(rl.Record_Label, 'Subtotal') AS 'Record Label',
    COUNT(*) AS 'Count of Albums',
    SUM(a.[US_sales_(m)]) AS 'Total sales',
    ROUND(AVG(a.[US_sales_(m)]), 2) AS 'Avg_sales_(m)'
FROM
    dbo.Album AS a
JOIN
    dbo.Record_Label AS rl ON rl.Record_Label_ID = a.Record_Label_ID
JOIN
    dbo.Parent_Company AS pc ON pc.Parent_Company_ID = rl.Parent_Company_ID
GROUP BY
    pc.Parent_Company, rl.Record_Label WITH ROLLUP;