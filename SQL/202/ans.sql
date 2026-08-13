use worldEvents;
go

create or alter trigger trg_Event_PreventUKDelete
on tblEvent
instead of delete
as
begin
    declare @EventId   int;
    declare @CountryId int;

    select
        @EventId   = EventId,
        @CountryId = CountryId
    from
        deleted;

    -- if country is not UK (7), allow deletion
    if @CountryId <> 7
    begin
        delete from tblEvent
        where EventId = @EventId;
    end
end
go


-- should be blocked (UK event)
delete from tblEvent where CountryId = 7;
select * from tblEvent where CountryId = 7;   -- still there

-- should succeed (non-UK event)
delete from tblEvent where EventId = 2;
select * from tblEvent where EventId = 2;   -- gone