use Music_01;
go

create or alter proc usp_Parameter_Places
    @openAfer Date,
    @minCapacity int,
    @maxCost int,
    @city nvarchar(50)
as
begin
    select 
        Venue,
        Opening_date,
        Capacity,
        Construction_cost_$m,
        City,
        Country
    from
        venue v
    join
        city c on v.city_id = c.city_id
    join 
        country cy on cy.country_id = c.country_id
    where
        Opening_date > @openAfer AND
        Capacity > @minCapacity AND
        Construction_cost_$m < @maxCost AND
        City like '%' +  @city + '%'
end
go

exec usp_Parameter_Places '1050-01-01', 10000, 100, 'chester'
go