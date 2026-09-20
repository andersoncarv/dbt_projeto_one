{{
    config(
        tags='[vendas]'
    )

}}


with Pedidos as (

    Select * from {{ref ('stg_pedidos')}}

),


Clientes as (

    Select * from {{ref('stg_clientes')}}
),


Itens_Pedidos as (

    Select * from {{ ref ('stg_itens_pedidos')}}
),



Produtos as (

    Select * from {{ ref ('stg_produtos')}}

),

Pagamentos as (

    Select * from {{ ref ('stg_pagamentos')}}
),

Categorias as 
(
    Select * from {{ ref ('stg_categorias')}}

),

joined as (

        Select 
            Pedidos.data_pedido as dt_pedido,
            Clientes.nome as nome_cliente,
            Clientes.email as email_cliente,
            Clientes.telefone as fone_cliente,
            Pagamentos.valor as valor_pgto,
            Pagamentos.metodo as metodo_pgto,
            Pagamentos.status as status_pgto,
            Pagamentos.data_pagamento as dt_pgto,
            Itens_Pedidos.quantidade as qtd_itens,
            Itens_Pedidos.preco_unitario as valor_unitario,
            Itens_Pedidos.subtotal as subtotal_pedido,
            Produtos.nome as nome_produto,
            Produtos.descricao as descricao_produto,
            Produtos.marca as marca_produto,
            Categorias.nome as categoria_produto,
            Produtos.estoque as estoque_produto,
            Produtos.preco as preco_produto


        from Pedidos
        left join Clientes   on Pedidos.cliente_id = Clientes.id
        left join Pagamentos on Pedidos.id = Pagamentos.pedido_id   
        left join Itens_Pedidos on Pedidos.id = Itens_Pedidos.pedido_id
        left join Produtos on Produtos.id = Itens_Pedidos.produto_id
        left join Categorias on Categorias.id = Produtos.categoria_id       

)


Select * from joined

