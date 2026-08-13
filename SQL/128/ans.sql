use WorldEvents;
go

CREATE or alter PROC uspInformation 
    @Information varchar(max)
AS
begin
    IF @Information = 'Country' 
		BEGIN
            SELECT top 2
				CountryName
			FROM
				tblCountry
		END

    IF @Information = 'Event'
		BEGIN
			SELECT top 2
				EventName
				,EventDetails
				,EventDate
			FROM
				tblEvent
		END


    IF @Information = 'Continent'
		BEGIN
			SELECT top 2
				ContinentName
			FROM
				tblContinent
		END

    IF @INFORMATION NOT IN ('Event','Country','Continent') 
		BEGIN
			SELECT 'You must enter: Event, Country or Continent' AS 'Nuh uh say the magic word'
		END
end
go

exec uspInformation 'Something else'
exec uspInformation 'Event'  
exec uspInformation 'Country'
exec uspInformation 'Continent'