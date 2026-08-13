use Music_01
go

create or alter proc dbo.usp_Times_Tables
	@Multiplier tinyint
as
begin
	declare @LoopCounter tinyint = 1

	while @LoopCounter <= 10
		begin
			print concat(@Multiplier, ' x ', @LoopCounter, ' = ', @Multiplier * @LoopCounter)
			set @LoopCounter += 1
		end
end
go

exec usp_Times_Tables 5