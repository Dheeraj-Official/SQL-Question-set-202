USE WorldEvents;

DECLARE @Diff INT;

EXEC @Diff = uspNameLengthDifference;

SELECT @Diff;