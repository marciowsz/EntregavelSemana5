-- ============================================================================
-- SPRINT 5 - 01_DDL.SQL: CRIAÇÃO DO SCHEMA E TABELAS (10 TABELAS)
-- ============================================================================

DROP TABLE IF EXISTS avaliacoes CASCADE;
DROP TABLE IF EXISTS itens_pedido CASCADE;
DROP TABLE IF EXISTS pagamentos CASCADE;
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS cupons CASCADE;
DROP TABLE IF EXISTS estoque CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS enderecos CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

-- 1. Clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    data_cadastro TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- 2. Endereços
CREATE TABLE enderecos (
    endereco_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    CONSTRAINT fk_enderecos_cliente FOREIGN KEY (cliente_id) 
        REFERENCES clientes(cliente_id) ON DELETE CASCADE
);

-- 3. Categorias
CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL UNIQUE,
    descricao TEXT
);

-- 4. Produtos
CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    categoria_id INT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    preco NUMERIC(10, 2) NOT NULL CHECK (preco >= 0),
    ativo BOOLEAN DEFAULT TRUE NOT NULL,
    criado_em TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_produtos_categoria FOREIGN KEY (categoria_id) 
        REFERENCES categorias(categoria_id) ON DELETE RESTRICT
);

-- 5. Estoque
CREATE TABLE estoque (
    estoque_id SERIAL PRIMARY KEY,
    produto_id INT NOT NULL UNIQUE,
    quantidade INT NOT NULL CHECK (quantidade >= 0),
    ultima_atualizacao TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_estoque_produto FOREIGN KEY (produto_id) 
        REFERENCES produtos(produto_id) ON DELETE CASCADE
);

-- 6. Cupons
CREATE TABLE cupons (
    cupom_id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    desconto_percentual NUMERIC(5, 2) NOT NULL CHECK (desconto_percentual > 0 AND desconto_percentual <= 100),
    validade TIMESTAMPTZ NOT NULL,
    ativo BOOLEAN DEFAULT TRUE NOT NULL
);

-- 7. Pedidos
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    cupom_id INT,
    data_pedido TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDENTE' CHECK (status IN ('PENDENTE', 'PAGO', 'ENVIADO', 'CANCELADO')),
    valor_total NUMERIC(10, 2) DEFAULT 0.00 CHECK (valor_total >= 0),
    CONSTRAINT fk_pedidos_cliente FOREIGN KEY (cliente_id) 
        REFERENCES clientes(cliente_id) ON DELETE RESTRICT,
    CONSTRAINT fk_pedidos_cupom FOREIGN KEY (cupom_id) 
        REFERENCES cupons(cupom_id) ON DELETE SET NULL
);

-- 8. Itens Pedido
CREATE TABLE itens_pedido (
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10, 2) NOT NULL CHECK (preco_unitario >= 0),
    PRIMARY KEY (pedido_id, produto_id),
    CONSTRAINT fk_ip_pedido FOREIGN KEY (pedido_id) 
        REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    CONSTRAINT fk_ip_produto FOREIGN KEY (produto_id) 
        REFERENCES produtos(produto_id) ON DELETE RESTRICT
);

-- 9. Pagamentos
CREATE TABLE pagamentos (
    pagamento_id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL UNIQUE,
    metodo VARCHAR(20) NOT NULL CHECK (metodo IN ('PIX', 'CARTAO_CREDITO', 'BOLETO')),
    valor NUMERIC(10, 2) NOT NULL CHECK (valor >= 0),
    data_pagamento TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_pagamentos_pedido FOREIGN KEY (pedido_id) 
        REFERENCES pedidos(pedido_id) ON DELETE CASCADE
);

-- 10. Avaliações
CREATE TABLE avaliacoes (
    avaliacao_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_avaliacoes_cliente FOREIGN KEY (cliente_id) 
        REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    CONSTRAINT fk_avaliacoes_produto FOREIGN KEY (produto_id) 
        REFERENCES produtos(produto_id) ON DELETE CASCADE
);