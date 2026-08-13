use Music_01;


with cteCertificate as
(
    select
        case 
            when [US_sales_(m)] >= 10 then 'Diamond'
            when [US_sales_(m)] >= 2 then 'Multi-Platinum'
            when [US_sales_(m)] >= 1 then 'Platinum'
            when [US_sales_(m)] >= 0.5 then 'Gold'
            else
                'NA'
        end as [sales_certification],
        album_ID,
        [US_Billboard_200_peak]

    from
        album
)

select
    [sales_certification],
    count(*) as Number_of_Albums,
    avg([US_Billboard_200_peak]) as Average_US_Billboard_200_peak
from 
    cteCertificate
group by 
    [sales_certification];