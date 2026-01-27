with dedupe_query as(
select *,
row_number() over(partiton by id order by date_of_addition desc) as 
FROM {{ ref('source','items')}}
where dedupe_key = 1
)

select id,name,category,date_of_addition
from dedupe_query
where dedupe_key = 1