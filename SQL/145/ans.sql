USE Music_01
GO

BEGIN TRANSACTION

BEGIN TRY

	insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
	values('The Boys', '2017-06-07', '40:11', 11)

	insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
	values('Jumbanji', '2017-11-12', '108:53', 6)

	commit transaction

end try
begin catch

	select 
		ERROR_MESSAGE() as [Error_Message]
		,ERROR_NUMBER() as [Error_Number]

	rollback transaction

end catch

--Select data from Soundtrack table
select
	st.Soundtrack_ID
	,st.Title
	,st.Release_Date
	,st.[Length]
	,st.Volume
from
	dbo.Soundtrack as st