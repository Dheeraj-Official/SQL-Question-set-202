DECLARE @current int					
DECLARE @previous int					

DECLARE @HighestFactor decimal(10,4)
DECLARE @HighestFactorInteger int	
DECLARE @IfPrime bit

DECLARE @StartTime datetime
DECLARE @EndTime datetime

SET @StartTime = CURRENT_TIMESTAMP

SET @current=2
WHILE @current < 10000
	BEGIN
		SET @IfPrime=1
		SET @HighestFactor = sqrt(@current)
		SET @HighestFactorInteger = floor(@HighestFactor)
		SET @previous = 2

		WHILE @previous <= @HighestFactorInteger
			BEGIN	
				IF @current % @previous = 0 
					BEGIN
						SET @IfPrime=0
						BREAK
					END

				SET @previous = @previous + 1
			END
			
			IF @IfPrime=1 PRINT CAST(@current AS varchar(10))

		SET @current = @current + 1

	END

SET @EndTime = CURRENT_TIMESTAMP 
PRINT 'Took ' + CAST(DateDiff(ms, @StartTime, @EndTime) AS varchar(10)) + ' milliseconds'