use Music_01;
go

create or alter function fn_Shows_by_Artist(@ArtistSearch NVARCHAR(255)) returns table
as
return 
(
    select 
        ar.artist,
        t.tour_name,
        count(*) as [Number of shows],
        avg(s.Tickets_sold) as avg_tickets_sold,
        avg(s.Revenue_$) as avg_revenue
    from 
        tour t
    join 
        artist ar on ar.artist_id = t.artist_id
    join 
        show s on s.tour_id = t.tour_id
    where
        ar.Artist like '%' +  @ArtistSearch + '%'
    group by
        tour_name, ar.Artist
)