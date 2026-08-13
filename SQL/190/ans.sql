use worldEvents;
go

with TopCountries as
(
    select top 3
        CountryID
    from
        tblEvent
    group by
        CountryID
    order by
        count(*) desc
),
TopCategories as
(
    select top 3
        CategoryID
    from
        tblEvent
    group by
        CategoryID
    order by
        count(*) desc
)


select
    cy.CountryID,
    cg.CategoryID,
    (
        select count(*)
        from tblEvent e
        where e.CountryID = cy.CountryID
        and e.CategoryID = cg.CategoryID
    ) as NumberOfEvents
from
    TopCountries as cy
cross join
    TopCategories as cg
order by
    NumberOfEvents desc;