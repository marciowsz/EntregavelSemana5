# Projeto de Banco de Dados E-Commerce — Sprint 5

Este repositório contém o modelo relacional e scripts físicos para a simulação de um banco de dados completo de e-commerce utilizando **PostgreSQL**.

## 1. Escopo e Modelo Lógico
O banco é composto por **10 tabelas relacionais**:
* `clientes`, `enderecos`, `categorias`, `produtos`, `estoque`, `cupons`, `pedidos`, `itens_pedido`, `pagamentos`, `avaliacoes`.

## 2. Estratégia de Indexação
Índices foram aplicados estritamente em colunas de Chaves Estrangeiras (`cliente_id`, `produto_id`, `categoria_id`) e em colunas amplamente utilizadas em filtros combinados e ordenação (`status`, `data_pedido`), evitando *overhead* excessivo em operações de escrita.

## 3. Controle de Transações
Garantia de propriedades ACID por meio de comandos `BEGIN`, `COMMIT`, `RETURNING` e `SAVEPOINT`. Exemplos incluem a atomicidade no cadastro de pedidos junto à baixa em estoque e registro seguro de pagamentos.

## 4. Análise de Performance (`EXPLAIN ANALYZE`)
A execução de planos de consulta confirmou a otimização de `Seq Scan` para `Index Scan` e `Bitmap Index Scan` em filtros de status e relacionamentos frequentes.

## 5. Segurança e Controle de Acesso (RBAC)
Configuração do Princípio do Menor Privilégio via papéis `role_admin` e `role_gerente_vendas`, restringindo explicitamente permissões destrutivas como `DELETE` em tabelas sensíveis.