use music_01;

select
    artist,
    artist_type,
    CONCAT(artist, ' (', artist_type, ')') as Artist_and_type
from
    artist

select 
    track_name,
    track_mins * 60 + track_secs as Track_Length
from
    track;