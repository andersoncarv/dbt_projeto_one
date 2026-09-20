with source as (

    Select * from {{ source ('ecommerce','categorias')}}
)

select * from source

