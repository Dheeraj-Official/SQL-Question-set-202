USE WorldEvents;

INSERT INTO tblEvent (EventName, EventDetails, EventDate)
VALUES ('My DOB', 'It is my birthday', '2004-02-26');

SELECT * FROM tblEvent
WHERE EventName = 'My DOB';