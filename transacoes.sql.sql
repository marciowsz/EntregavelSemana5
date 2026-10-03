-- ============================================================================
-- SPRINT 5 - 05_TRANSACOES.SQL: TRANSAÇÕES ACID COM ROLLBACK/SAVEPOINT
-- ============================================================================

-- Transação 1: Processamento e Criação de Novo Pedido com Atualização de Estoque
BEGIN;

    -- Inserir Pedido
    INSERT INTO pedidos (cliente_id, cupom_id, status, valor_total)
    VALUES (1, NULL, 'PENDENTE', 250.00)
    RETURNING pedido_id INTO TEMP TABLE tmp_ped;

    -- Inserir Item
    INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
    SELECT pedido_id, 2, 1, 250.00 FROM tmp_ped;

    -- Baixar Estoque
    UPDATE estoque
    SET quantidade = quantidade - 1
    WHERE produto_id = 2;

    DROP TABLE tmp_ped;

COMMIT;

-- Transação 2: Atualização de Pagamento com Uso de SAVEPOINT
BEGIN;

    SAVEPOINT sp_antes_pagamento;

    -- Atualiza status do pedido
    UPDATE pedidos
    SET status = 'PAGO'
    WHERE pedido_id = 12;

    -- Registrar Pagamento
    INSERT INTO pagamentos (pedido_id, metodo, valor)
    VALUES (12, 'PIX', 45.00);

    -- Simulação de verificação: se houvesse erro, faríamos ROLLBACK TO SAVEPOINT sp_antes_pagamento;

COMMIT;