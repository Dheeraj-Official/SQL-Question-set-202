use worldEvents;
go

-- Step 1 — plain stored procedure (works fine, no parameter):
-- create OR ALTER proc spSelectFromTable
-- as
-- begin
--     select * from tblEvent
-- end
-- go

-- exec spSelectFromTable;
-- go

-- Step 2 — the naive attempt that fails:
-- create or alter proc spSelectFromTable
--     @TableName varchar(max)
-- as
-- begin
--     select * from @TableName  -- ERROR: can't parameterize an object name this way
-- end
-- go

-- This fails because SQL Server needs to know the table name (and its schema/columns) at compile time, when the query plan is built — not at runtime. A variable holding a table name is just a string as far as the FROM clause parser is concerned, and T-SQL doesn't allow object identifiers to be substituted from variables directly. This is exactly the "it takes a while to accept that this can't work" moment the page mentions.


-- Step 3 — the working dynamic SQL version:

create or alter proc spSelectFromTable
    @TableName varchar(max)
as
begin
    declare @SQL varchar(max) =
        'SELECT * FROM ' +
        @TableName

    exec (@SQL)
end
go


exec spSelectFromTable 'tblEvent'
exec spSelectFromTable 'tblCountry'
exec spSelectFromTable 'tblContinent'