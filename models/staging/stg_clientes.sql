with source as (
    
    Select * from {{ source('ecommerce', 'clientes')}}
)


Select * from source