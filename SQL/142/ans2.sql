USE Music_01;

SELECT
    Venue,
    "Address",
    dbo.fnAddressFirstLine("Address") AS "First Line"
FROM
    dbo.Venue;