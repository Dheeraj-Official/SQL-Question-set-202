use WorldEvents;

select 
    ContinentName,
    summary,
    ISNULL(summary, 'No summary') as [Using ISNULL],
    COALESCE(summary, 'No summary') as [Using COALESCE],
    CASE
        WHEN summary IS NULL THEN 'No summary'
        ELSE summary
    END as [Using CASE]
from 
    tblcontinent;