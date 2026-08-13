USE WorldEvents;

DECLARE @Diff INT;
DECLARE @Message VARCHAR(200);

EXEC @Diff = uspNameLengthDifference;

SET @Message = 'The longest event name is ' + CAST(@Diff AS VARCHAR(10)) + ' characters longer than the shortest.';

SELECT @Message;