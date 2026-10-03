-- ============================================================================
-- SPRINT 5 - 07_EXPLAIN.SQL: ANÁLISE DE DESEMPENHO
-- ============================================================================

-- Analisar o uso do índice idx_pedidos_status_data
EXPLAIN ANALYZE
SELECT pedido_id, cliente_id, valor_total
FROM pedidos
WHERE status = 'PAGO'
ORDER BY data_pedido DESC;

-- Analisar o desempenho dos JOINs e o uso de índices em chaves estrangeiras
EXPLAIN ANALYZE
SELECT c.nome, p.pedido_id, p.valor_total
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
WHERE c.cliente_id = 1;