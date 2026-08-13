use Music_01;

SELECT AVG(Capacity)
FROM Venue;

SELECT *
FROM Venue
WHERE Capacity > (SELECT AVG(Capacity) FROM Venue)
ORDER BY Capacity ASC;


SELECT *
FROM Venue
WHERE Capacity < (SELECT AVG(Capacity) FROM Venue)
ORDER BY Capacity DESC;