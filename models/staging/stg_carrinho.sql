with source as (

    Select * from {{ source ('ecommerce','carrinho')}}
)

Select * from source

