use Music_01

select 
    track_id,
    track_name,
    single_release_date,
    [US_Billboard_Hot_100_peak],
    case
        when Single_release_date is null then 'Album track'
        when [US_Billboard_Hot_100_peak] is null then 'Non Charting Single'
        when [US_Billboard_Hot_100_peak] = 1 then 'Top 1 Single'
        when [US_Billboard_Hot_100_peak] <= 10 then 'Top 10 Single'
        else 'Charting Single'
    end as Track_status

from
    track
where
    track_id between 370 and 379