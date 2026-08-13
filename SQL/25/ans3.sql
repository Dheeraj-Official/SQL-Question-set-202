use Music_01;

SELECT
    Title,
    US_Billboard_200_peak,
    IIF(US_Billboard_200_peak = 1, 'Chart Topper',
        IIF(US_Billboard_200_peak <= 10, 'Top 10', 'Chart Flopper')) AS Chart_status,
    [US_sales_(m)],
    CASE
        WHEN [US_sales_(m)] >= 10  THEN 'Diamond'
        WHEN [US_sales_(m)] >= 2   THEN 'Multi-platinum'
        WHEN [US_sales_(m)] >= 1   THEN 'Platinum'
        WHEN [US_sales_(m)] >= 0.5 THEN 'Gold'
        ELSE 'NA'
    END AS Sales_category
FROM Album
ORDER BY Title;