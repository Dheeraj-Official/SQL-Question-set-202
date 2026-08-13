USE Music_01;
GO

-- Function 1: clean track name
CREATE OR ALTER FUNCTION dbo.fnCleanTrackName (@track VARCHAR(200))
RETURNS VARCHAR(200)
AS
BEGIN
    RETURN TRIM(REPLACE(@track, '"', ''));
END;
GO

-- Function 2: format track time as mm:ss
CREATE OR ALTER FUNCTION dbo.fn_trackTime (@mins SMALLINT, @secs SMALLINT)
RETURNS VARCHAR(6)
AS
BEGIN
    RETURN CONCAT(FORMAT(@mins, '00'), ':', FORMAT(@secs, '00'));
END;
GO