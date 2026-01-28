with dedupe_query as(
select *,
(row_number() over(partition by product_sk order by date_of_addition desc)) as dedupe_key
FROM {{ source('source','items') }}
)

select product_sk,product_name,category,date_of_addition
from dedupe_query
where dedupe_key = 1