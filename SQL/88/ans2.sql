USE Music_01;

SELECT
    Venue,
    Opening_date,
    Capacity,
    [Construction_cost_$m]
FROM
    Venue
WHERE
    Capacity >= (
        SELECT
            Capacity
        FROM
            Venue
        WHERE
            [Construction_cost_$m] = (
                SELECT
                    MAX([Construction_cost_$m])
                FROM
                    Venue
            )
    )
ORDER BY
    [Construction_cost_$m] DESC;