USE Music_01;

SELECT
    Venue,
    Other_names,
    ISNULL(Other_names, 'Never renamed') AS Other_names_display
FROM Venue;

SELECT
    Show_date,
    Venue_id,
    Cancelled,
    Cancellation_reason,
    ISNULL(Cancellation_reason, 'No reason given') AS Cancellation_reason_display
FROM Show
WHERE Cancelled = 1;