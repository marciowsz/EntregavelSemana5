-- ============================================================================
-- SPRINT 5 - 03_INDICES.SQL: CRIAÇÃO E JUSTIFICATIVA DE ÍNDICES
-- ============================================================================

-- Acelera buscas de pedidos por cliente em JOINs
CREATE INDEX idx_pedidos_cliente_id ON pedidos(cliente_id);

-- Otimiza a consulta de pedidos por status e ordenação por data
CREATE INDEX idx_pedidos_status_data ON pedidos(status, data_pedido);

-- Acelera junção de itens com a tabela de produtos
CREATE INDEX idx_itens_pedido_produto_id ON itens_pedido(produto_id);

-- Otimiza pesquisas e filtros de produtos por categoria
CREATE INDEX idx_produtos_categoria_id ON produtos(categoria_id);

-- Acelera relatórios de avaliações por produto
CREATE INDEX idx_avaliacoes_produto_id ON avaliacoes(produto_id);