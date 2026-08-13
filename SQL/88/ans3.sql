USE Music_01;

SELECT
    track_name,
    US_Billboard_Hot_100_peak,
    [US_sales_(m)]
FROM
    Track
Where
    [US_sales_(m)] > (
        SELECT
            MAX([US_sales_(m)])
        FROM
            Track
        WHERE
            track_mins * 60 + track_secs = (
                SELECT
                    top 1 track_mins * 60 + track_secs AS [Track_time]
                FROM
                    Track
                WHERE
                    [US_Billboard_Hot_100_peak] = 1
                ORDER BY
                    [Track_time] DESC
            )
    )
ORDER BY
    [US_sales_(m)];
