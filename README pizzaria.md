# reataurante-db

Este é mais um projeto acadêmico de um banco de dados# pizzaria-database

Este é mais um projeto acadêmico de um banco de dados (POSTGRESQL) usado para gerenciar operações em um pizzaria fictícia. Ele inclui tabelas para cadastro de clientes, pedidos, entregas e etc. permitindo rastrear e manipular a situação da pizzaria além de melhora a organização.

## Tecnologias Usadas
- banco de dados POSTGRESQL
- linguagem SQL
- ferramenta de gerenciamento: DBeaver

## Funcionalidades
- Cadastro de novos clientes
- cadastro de novos pedidos
- controle de estoque
- gerenciamneto de entregas e horario e etc.

## Estrutura do banco de dados

tabelas principais:

  - `Cliente`: Gerencia os dados dos clientes.
  - `Pizza`: Armazena informações sobre as pizzas.
  - `Pedido`: Armazena os pedidos de cada cliente.
  - `ItemPedido`: Contém informações sobre quantidade de pizzas pedidas, qual cliente fez o pedido.
  - `Entrega`: Armazena informações como a data da entrega, horario e esatus
  - `Exames`: Cadastro de exames disponíveis no posto de saúde.
  - `Pagamento`: Tabela usada para armazenar o tipo de pagamento e a data do pagamento e o total.

## Como usar
1. clone o repositório
  ```bash
  git clone https://github.com/Emanoellima-dev/pizzaria-database/tree/main
```
2. importe o arquivo [pizzaria.sql](https://github.com/Emanoellima-dev/pizzaria-database/blob/main/pizzaria.sql) em seu banco de dados postgresql usando o software de sua preferencia.
3. acesse o banco de dados e realize as consultas.

## Observações
este é mais um projeto acadêmico feito apenas para aprimorar meus conhecimento em sql usando postgresql por isso não estou aceitando contribuições ao projeto no momento.
