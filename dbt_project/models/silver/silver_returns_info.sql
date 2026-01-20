with returns as (
    select *
    from {{ ref("bronze_returns") }}
),
prod as(
    select product_sk,
            category
    from {{ ref("bronze_product") }}
),
sales as(
    select sales_id,
            product_sk,
            customer_sk,
            gross_amount,
            payment_method
    from {{ ref("bronze_sales") }}
),
cust as(
    select customer_sk,
            gender
    from {{ ref("bronze_customer") }}
),
joined_data as (
select * 
from returns
join sales on returns.sales_id = sales.sales_id
join prod on returns.product_sk = prod.product_sk
join cust on sales.customer_sk = cust.customer_sk
)

select
       category,
       sum(gross_amount) as gross_amount,
       sum(refund_amount) as refund_amount,
       {{ calculate_percentage("sum(refund_amount)", "sum(gross_amount)") }} as refund_percentage

from joined_data
group by 1
order by 2,3
