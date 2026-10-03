-- ============================================================================
-- SPRINT 5 - 04_CONSULTAS.SQL: 10 CONSULTAS SQL DIVERSAS
-- ============================================================================

-- 1. Listar pedidos pagos com dados do cliente e valor total
SELECT p.pedido_id, c.nome, c.email, p.valor_total, p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE p.status = 'PAGO'
ORDER BY p.data_pedido DESC;

-- 2. Total gasto por cliente (GROUP BY com HAVING)
SELECT c.cliente_id, c.nome, SUM(p.valor_total) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
WHERE p.status = 'PAGO'
GROUP BY c.cliente_id, c.nome
HAVING SUM(p.valor_total) > 300.00
ORDER BY total_gasto DESC;

-- 3. Média de nota por produto com contagem de avaliações
SELECT pr.produto_id, pr.nome, ROUND(AVG(a.nota), 2) AS media_nota, COUNT(a.avaliacao_id) AS total_avaliacoes
FROM produtos pr
LEFT JOIN avaliacoes a ON pr.produto_id = a.produto_id
GROUP BY pr.produto_id, pr.nome;

-- 4. Produtos abaixo do estoque mínimo de 15 unidades
SELECT pr.nome, e.quantidade
FROM produtos pr
JOIN estoque e ON pr.produto_id = e.produto_id
WHERE e.quantidade < 15;

-- 5. Subconsulta: Clientes que gastaram acima da média geral de pedidos
SELECT nome, email 
FROM clientes 
WHERE cliente_id IN (
    SELECT cliente_id 
    FROM pedidos 
    WHERE valor_total > (SELECT AVG(valor_total) FROM pedidos)
);

-- 6. Total arrecadado agrupado por método de pagamento
SELECT metodo, SUM(valor) AS total_recebido, COUNT(*) AS quantidade_transacoes
FROM pagamentos
GROUP BY metodo;

-- 7. Detalhes completos do pedido, produtos comprados e cupons aplicados
SELECT p.pedido_id, c.nome AS cliente, pr.nome AS produto, ip.quantidade, ip.preco_unitario, cp.codigo AS cupom
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN itens_pedido ip ON p.pedido_id = ip.pedido_id
JOIN produtos pr ON ip.produto_id = pr.produto_id
LEFT JOIN cupons cp ON p.cupom_id = cp.cupom_id;

-- 8. Contagem de produtos por categoria
SELECT cat.nome AS categoria, COUNT(pr.produto_id) AS total_produtos
FROM categorias cat
LEFT JOIN produtos pr ON cat.categoria_id = pr.categoria_id
GROUP BY cat.categoria_id, cat.nome;

-- 9. Subconsulta com EXISTS: Clientes que já fizeram avaliações
SELECT c.cliente_id, c.nome
FROM clientes c
WHERE EXISTS (
    SELECT 1 FROM avaliacoes a WHERE a.cliente_id = c.cliente_id
);

-- 10. Top 5 produtos mais caros com nome da categoria
SELECT pr.nome AS produto, pr.preco, cat.nome AS categoria
FROM produtos pr
JOIN categorias cat ON pr.categoria_id = cat.categoria_id
ORDER BY pr.preco DESC
LIMIT 5;