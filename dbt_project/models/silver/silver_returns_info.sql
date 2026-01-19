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
)


select * 
from returns
join sales on returns.sales_id = sales.sales_id
join prod on returns.product_sk = prod.product_sk
join cust on sales.customer_sk = cust.customer_sk;