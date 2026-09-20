with source as (

    Select * from {{ source ('ecommerce','pagamentos')}}

)

Select * from source

