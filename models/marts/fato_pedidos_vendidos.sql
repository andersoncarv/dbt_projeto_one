{{
    config(
        tags='[vendas]'
    )
}}

with pedidos as (

    Select * from {{ ref('int_pedidos_vendidos')}}
)


Select * from pedidos