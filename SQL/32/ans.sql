use Music_01

select 
    track_name,
    replace(trim(track_name), '"', '') as Replaced_trimmed_track 
from track
where
    replace(trim(track_name), '"', '') like 'A%';