use Music_01;

SELECT
    ar.Artist,
    t.Tour_name,
    'We''ll have to deliver an on-site training course to see ' + ar.Artist + '!' AS Message
FROM
    Artist AS ar
    LEFT OUTER JOIN Tour AS t ON ar.Artist_ID = t.Artist_ID
WHERE
    t.Tour_ID IS NULL
ORDER BY
    ar.Artist ASC;