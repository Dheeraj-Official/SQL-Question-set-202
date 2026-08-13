use WorldEvents;

select
    EventName,
    EventDetails
From
    tblEvent
where
    CountryID not in (
        select
            top 30 countryid
        from
            tblCountry
        order by
            countryName desc
    )
    and CategoryID not in (
        select
            top 15 categoryid
        from
            tblcategory
        order by
            categoryName desc
    )