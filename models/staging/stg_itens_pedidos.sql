with source as (

    Select * from {{source('ecommerce','itens_pedidos')}}
)

Select * from source