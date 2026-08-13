USE WorldEvents;

UPDATE 
    tblCountry 
SET 
    CountryName = CountryName + '(My Country)'
WHERE
    CountryName = 'India';

SELECT * FROM tblCountry;