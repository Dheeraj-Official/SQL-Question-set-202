use WorldEvents;

select
    EventName,
    case
        when 
            LEFT(EventName, 1) in ('a', 'e', 'i', 'o', 'u') and 
            RIGHT(EventName, 1) in ('a', 'e', 'i', 'o', 'u') 
        then 'Begins and ends with VOWEL'
        when
            LEFT(EventName, 1) = RIGHT(EventName, 1) AND 
            LEFT(EventName, 1) in ('a', 'e', 'i', 'o', 'u')
        then 'Begins and ends with SAME VOWEL'
        ELSE
            'SAME LETTER'
    END as [Verdict]
from 
    tblEvent
where
    LEFT(EventName, 1) = RIGHT(EventName, 1) OR (
        LEFT(EventName, 1) in ('a', 'e', 'i', 'o', 'u') and 
        RIGHT(EventName, 1) in ('a', 'e', 'i', 'o', 'u') 
    )