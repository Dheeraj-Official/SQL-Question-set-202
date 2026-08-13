use worldEvents;
go

-- Two CTEs
with SpaceCategories as
(
    select distinct
        c.CategoryName
    from
        tblEvent e
    join
        tblCountry co on e.CountryID = co.CountryID
    join
        tblCategory c on e.CategoryID = c.CategoryID
    where
        co.CountryName = 'Space'
),
NonSpaceEvents as
(
    select
        co.CountryName,
        c.CategoryName
    from
        tblEvent e
    join
        tblCountry co on e.CountryID = co.CountryID
    join
        tblCategory c on e.CategoryID = c.CategoryID
    where
        co.CountryName <> 'Space'
)

select distinct
    ns.CountryName
from
    NonSpaceEvents ns
join
    SpaceCategories sc on ns.CategoryName = sc.CategoryName
order by
    ns.CountryName;