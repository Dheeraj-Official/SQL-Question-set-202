USE MUSIC_01;

SELECT
    v.Artist,
    COUNT(*) AS Number_of_Albums,
    SUM(v.[US_sales_(m)]) AS Total_US_Sales
FROM 
    Number_1_Albums AS v
GROUP BY 
    v.Artist;