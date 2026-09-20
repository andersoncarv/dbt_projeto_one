with source as (

    Select * from {{ source ('ecommerce', 'produtos')}}
)

Select * from source

