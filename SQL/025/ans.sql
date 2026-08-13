use Music_01;

SELECT
    Title,
    US_Billboard_200_peak,
    IIF(US_Billboard_200_peak = 1, 'Chart Topper', 'Chart Flopper') AS Chart_status
FROM Album
ORDER BY Title;

