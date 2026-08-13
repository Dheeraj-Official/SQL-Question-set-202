use WorldEvents
go

declare @result varchar(50)


set @result  = (select EventName
                from tblEvent
                where EventName = 'My DOB')

begin TRANSACTION

INSERT INTO tblEvent (EventName, EventDetails, EventDate)
VALUES ('My DOB', 'It is my birthday', '2004-02-26');

if @result is not null
    begin
        print 'Event already exists'
        ROLLBACK
    end
else
    commit