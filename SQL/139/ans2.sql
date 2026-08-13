use Music_01

select 
    dbo.fnCleanTrackName(t.Track_name),
    dbo.fn_trackTime(t.Track_mins, t.Track_secs)
from 
    dbo.Track t