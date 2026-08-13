USE WorldEvents;

-- 1 Wales ≈ 20,761 km²
DECLARE @Wales_KM INT = 20761;

SELECT 
    Country,
    KmSquared,
    KmSquared / @Wales_KM AS 'Wales Units',
    KmSquared % @Wales_KM AS 'Area Left Out',
    CAST(KmSquared / @Wales_KM AS VARCHAR(20)) 
        + ' x Wales plus ' 
        + CAST(KmSquared % @Wales_KM AS VARCHAR(20)) 
        + ' sq. km' AS 'Description'
FROM 
    CountriesByArea
order by
    abs(KmSquared - @Wales_KM) asc;