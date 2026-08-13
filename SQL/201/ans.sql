use worldEvents;
go

drop table if exists tblCountryChangeLog;
-- Log table
create table tblCountryChangeLog
(
    CountryName varchar(100),
    Change      varchar(20)
);
go

-- Trigger 1: handles renames (UPDATE)
create or alter trigger trg_Country_Update
on tblCountry
after update
as
begin
    insert into tblCountryChangeLog (CountryName, Change)
    select CountryName, 'Deleted' from deleted
    union all
    select CountryName, 'Inserted' from inserted;
end
go

-- Trigger 2: handles new countries (INSERT)
create or alter trigger trg_Country_Insert
on tblCountry
after insert
as
begin
    insert into tblCountryChangeLog (CountryName, Change)
    select CountryName, 'Inserted' from inserted;
end
go

-- Trigger 3: handles removed countries (DELETE)
create or alter trigger trg_Country_Delete
on tblCountry
after delete
as
begin
    insert into tblCountryChangeLog (CountryName, Change)
    select CountryName, 'Deleted' from deleted;
end
go

-- Test it
update tblCountry set CountryName = 'Viet Nam' where CountryName = 'Vietnam';
insert into tblCountry (CountryName) values ('OwlLand');
delete from tblCountry where CountryName = 'OwlLand';

select * from tblCountryChangeLog
order by CountryName;