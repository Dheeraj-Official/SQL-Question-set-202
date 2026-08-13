USE WorldEvents;

SELECT
    ct.ContinentName AS Continent,
    cy.CountryName AS Country,
    count(*) AS "Number of Events"
FROM
    dbo.tblEvent et
    JOIN dbo.tblCountry cy ON cy.CountryID = et.CountryID
    JOIN dbo.tblContinent ct ON ct.ContinentID = cy.ContinentID
WHERE
    ct.ContinentName != 'Europe'
GROUP BY
    ct.ContinentName,
    cy.CountryName
HAVING
    count(*) > 5
ORDER BY
    cy.CountryName