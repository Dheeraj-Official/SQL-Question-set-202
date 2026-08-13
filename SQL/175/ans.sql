USE WorldEvents;
GO

CREATE OR ALTER FUNCTION dbo.fnVowelSearch (@Vowel CHAR(1))
RETURNS @Results TABLE
(
    ItemType VARCHAR(20),
    Name     VARCHAR(100)
)
AS
BEGIN

    INSERT INTO @Results
    SELECT 'Category', CategoryName
    FROM dbo.tblCategory
    WHERE CategoryName LIKE '%' + @Vowel + '%';

    INSERT INTO @Results
    SELECT 'Country', CountryName
    FROM dbo.tblCountry
    WHERE CountryName LIKE '%' + @Vowel + '%';

    INSERT INTO @Results
    SELECT 'Continent', ContinentName
    FROM dbo.tblContinent
    WHERE ContinentName LIKE '%' + @Vowel + '%';

    RETURN;

END
GO

select 
(Select count(*) from dbo.fnVowelSearch('a')) As A_result,
(Select count(*) from dbo.fnVowelSearch('e')) As E_result,
(Select count(*) from dbo.fnVowelSearch('o')) As O_result,
(Select count(*) from dbo.fnVowelSearch('i')) As I_result,
(Select count(*) from dbo.fnVowelSearch('u')) As U_result


SELECT v.Vowel, COUNT(*) AS ItemCount
FROM (VALUES ('a'),('e'),('i'),('o'),('u')) AS v(Vowel)
CROSS APPLY dbo.fnVowelSearch(v.Vowel)
GROUP BY v.Vowel
ORDER BY v.Vowel;