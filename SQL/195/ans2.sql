use worldEvents;
GO

create or alter proc spSelectFromTable
    @TableName varchar(max)
as
begin
    declare @SQL varchar(max) = 'Select * from ' + QUOTENAME(@TableName)

    exec (@SQL)
end
go

exec spSelectFromTable 'tblEvent'