USE Music_01;

DECLARE @BiggestVenueID INT;

EXEC @BiggestVenueID = usp_Get_Biggest_Venue_ID @StartDate = '1990-01-01', @EndDate = '2020-01-01';

SELECT Venue, Capacity, Opening_date, City_ID
FROM Venue
WHERE Venue_ID = @BiggestVenueID;

SELECT Show_date, Tickets_sold, Tickets_available, Cancelled
FROM Show
WHERE Venue_ID = @BiggestVenueID;