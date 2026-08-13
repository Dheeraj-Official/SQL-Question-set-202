use Music_01;

SELECT Title,[US_Billboard_200_peak], [US_sales_(m)]
FROM Album
WHERE [US_Billboard_200_peak] = 1
    AND [US_sales_(m)] >= 10000000
ORDER BY Title ASC;

SELECT Title,[US_Billboard_200_peak], [US_sales_(m)]
FROM Album
WHERE [US_Billboard_200_peak] = 1
    OR [US_sales_(m)] >= 10000000
ORDER BY Title ASC;

SELECT Title,[US_Billboard_200_peak], [US_sales_(m)]
FROM Album
WHERE [US_sales_(m)] >= 500000
    AND [US_sales_(m)] < 1000000
ORDER BY Title ASC;

SELECT Title,[US_Billboard_200_peak], [US_sales_(m)]
FROM Album
WHERE [US_sales_(m)] >= 500000
    AND [US_sales_(m)] < 1000000
    AND [US_Billboard_200_peak] = 1
ORDER BY Title ASC;

SELECT Title,[US_Billboard_200_peak], [US_sales_(m)]
FROM Album
WHERE [US_sales_(m)] >= 1000000
    AND [US_sales_(m)] < 2000000
    AND [US_Billboard_200_peak] <= 10
ORDER BY Title ASC;

SELECT Title,[US_Billboard_200_peak], [US_sales_(m)]
FROM Album
WHERE [US_sales_(m)] >= 2000000
    AND [US_sales_(m)] < 10000000
    AND [US_Billboard_200_peak] > 10
ORDER BY Title ASC;