use trainingCourses;
go

create or alter proc spFlexibleSelect
    @Columns    varchar(max),
    @TableName  varchar(max),
    @NumRows    int,
    @SortOrder  varchar(max)
as
begin
    declare @SQL varchar(max) =
        'SELECT TOP ' + cast(@NumRows as varchar(10)) + ' ' +
        @Columns +
        ' FROM ' + @TableName +
        ' ORDER BY ' + @SortOrder

    exec (@SQL)
end
go


exec spFlexibleSelect
    @Columns   = 'FirstName,LastName',
    @TableName = 'tblPerson',
    @NumRows   = 5,
    @SortOrder = 'LastName'