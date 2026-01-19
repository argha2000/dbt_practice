with sales as(
    select sales_id,
            product_sk,
            customer_sk,
            {{ multiply("unit_price", "quantity") }} as calculated_gross_amt,
            gross_amount,
            payment_method
    from {{ ref("bronze_sales") }}
),

prod as(
    select product_sk,
            category
    from {{ ref("bronze_product") }}
),

cust as(
    select customer_sk,
            gender
    from {{ ref("bronze_customer") }}
)


select sales.sales_id,
        sales.gross_amount,
        sales.payment_method,
        prod.category,
        cust.gender 

from  sales
join cust on sales.customer_sk = cust.customer_sk
join prod on sales.product_sk = prod.product_sk