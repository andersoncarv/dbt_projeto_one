with source as (

    Select * from {{source ('ecommerce','pedidos')}}
)

Select * from source

