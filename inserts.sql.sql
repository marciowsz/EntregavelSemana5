-- ============================================================================
-- SPRINT 5 - 02_INSERTS.SQL: POVOAMENTO (15+ REGISTROS POR TABELA)
-- ============================================================================

-- 1. Clientes (15)
INSERT INTO clientes (nome, cpf, email, telefone) VALUES
('Ana Silva', '111.111.111-01', 'ana@email.com', '(98) 98111-0001'),
('Bruno Costa', '111.111.111-02', 'bruno@email.com', '(98) 98111-0002'),
('Carla Souza', '111.111.111-03', 'carla@email.com', '(98) 98111-0003'),
('Diego Lima', '111.111.111-04', 'diego@email.com', '(98) 98111-0004'),
('Elena Rocha', '111.111.111-05', 'elena@email.com', '(98) 98111-0005'),
('Felipe Alves', '111.111.111-06', 'felipe@email.com', '(98) 98111-0006'),
('Gabriela Melo', '111.111.111-07', 'gabriela@email.com', '(98) 98111-0007'),
('Heitor Nunes', '111.111.111-08', 'heitor@email.com', '(98) 98111-0008'),
('Isabela Dias', '111.111.111-09', 'isabela@email.com', '(98) 98111-0009'),
('João Pedro', '111.111.111-10', 'joao@email.com', '(98) 98111-0010'),
('Kátia Ramos', '111.111.111-11', 'katia@email.com', '(98) 98111-0011'),
('Lucas Mendes', '111.111.111-12', 'lucas@email.com', '(98) 98111-0012'),
('Mariana Freitas', '111.111.111-13', 'mariana@email.com', '(98) 98111-0013'),
('Natan Ribeiro', '111.111.111-14', 'natan@email.com', '(98) 98111-0014'),
('Olivia Martins', '111.111.111-15', 'olivia@email.com', '(98) 98111-0015');

-- 2. Endereços (15)
INSERT INTO enderecos (cliente_id, logradouro, numero, cidade, estado, cep) VALUES
(1, 'Rua das Flores', '10', 'São Luís', 'MA', '65000-001'),
(2, 'Av. dos Holandeses', '500', 'São Luís', 'MA', '65000-002'),
(3, 'Rua do Sol', '12', 'São Luís', 'MA', '65000-003'),
(4, 'Rua da Paz', '45', 'Imperatriz', 'MA', '65900-000'),
(5, 'Av. Colares Moreira', '101', 'São Luís', 'MA', '65000-005'),
(6, 'Rua da Estrela', '88', 'Caxias', 'MA', '65600-000'),
(7, 'Rua Grande', '300', 'São Luís', 'MA', '65000-007'),
(8, 'Av. Litorânea', '1200', 'São Luís', 'MA', '65000-008'),
(9, 'Rua dos Cajueiros', '33', 'Timon', 'MA', '65630-000'),
(10, 'Rua das Palmeiras', '77', 'São Luís', 'MA', '65000-010'),
(11, 'Av. Guajajaras', '404', 'São Luís', 'MA', '65000-011'),
(12, 'Rua dos Sabiás', '19', 'São Luís', 'MA', '65000-012'),
(13, 'Rua das Hortênsias', '62', 'São Luís', 'MA', '65000-013'),
(14, 'Av. Daniel de La Touche', '900', 'São Luís', 'MA', '65000-014'),
(15, 'Rua do Alecrim', '5', 'São Luís', 'MA', '65000-015');

-- 3. Categorias (15)
INSERT INTO categorias (nome, descricao) VALUES
('Periféricos', 'Teclados, mouses, headsets'),
('Monitores', 'Telas e monitores gamer'),
('Hardware', 'Processadores, placas e memórias'),
('Armazenamento', 'SSDs e HDs externos'),
('Cadeiras', 'Cadeiras ergonômicas e gamer'),
('Redes', 'Roteadores e switches'),
('Áudio', 'Caixas de som e fones'),
('Gabinetes', 'Gabinetes ATX e conexos'),
('Fontes', 'Fontes de alimentação'),
('Refrigeração', 'Coolers e watercoolers'),
('Cabos', 'Cabos HDMI, DisplayPort e rede'),
('Consoles', 'Video games e acessórios'),
('Smartphones', 'Celulares e acessórios'),
('Wearables', 'Smartwatches e fones TWS'),
('Móveis', 'Mesas para escritório');

-- 4. Produtos (15)
INSERT INTO produtos (categoria_id, nome, preco) VALUES
(1, 'Mouse Mecânico RGB', 150.00),
(1, 'Teclado Mecânico Switch Blue', 250.00),
(2, 'Monitor 24 IPS 144Hz', 1200.00),
(3, 'Processador Octa-Core', 1500.00),
(4, 'SSD NVMe 1TB', 450.00),
(5, 'Cadeira Gamer Ergonômica', 890.00),
(6, 'Roteador Wi-Fi 6 Gigabit', 320.00),
(7, 'Headset 7.1 Surround', 280.00),
(8, 'Gabinete Mid Tower Vidro', 350.00),
(9, 'Fonte 650W 80 Plus Gold', 420.00),
(10, 'Watercooler 240mm RGB', 380.00),
(11, 'Cabo HDMI 2.1 2m', 45.00),
(12, 'Controlador Sem Fio', 300.00),
(13, 'Smartphone 128GB 8GB RAM', 1800.00),
(14, 'Smartwatch Esportivo', 350.00);

-- 5. Estoque (15)
INSERT INTO estoque (produto_id, quantidade) VALUES
(1, 50), (2, 30), (3, 15), (4, 10), (5, 40),
(6, 8), (7, 25), (8, 20), (9, 12), (10, 18),
(11, 14), (12, 100), (13, 22), (14, 9), (15, 16);

-- 6. Cupons (15)
INSERT INTO cupons (codigo, desconto_percentual, validade) VALUES
('DESCONTO10', 10.00, '2026-12-31'),
('DESCONTO15', 15.00, '2026-12-31'),
('SUMMER20', 20.00, '2026-12-31'),
('TECH5', 5.00, '2026-12-31'),
('BLACKFRIDAY', 30.00, '2026-11-30'),
('PRIMEIRACOMPRA', 10.00, '2026-12-31'),
('OFERTA12', 12.00, '2026-12-31'),
('VIP25', 25.00, '2026-12-31'),
('NATAL15', 15.00, '2026-12-25'),
('CLIENTE10', 10.00, '2026-12-31'),
('PROMO8', 8.00, '2026-12-31'),
('MAIORSALE', 18.00, '2026-12-31'),
('CUPOMEXCLUSIVO', 22.00, '2026-12-31'),
('LOJA10', 10.00, '2026-12-31'),
('BEMVINDO', 5.00, '2026-12-31');

-- 7. Pedidos (15)
INSERT INTO pedidos (cliente_id, cupom_id, status, valor_total) VALUES
(1, 1, 'PAGO', 135.00),
(2, NULL, 'PAGO', 250.00),
(3, 2, 'PAGO', 1020.00),
(4, NULL, 'ENVIADO', 1500.00),
(5, 3, 'PAGO', 360.00),
(6, NULL, 'PENDENTE', 890.00),
(7, NULL, 'CANCELADO', 320.00),
(8, 4, 'PAGO', 266.00),
(9, NULL, 'PAGO', 350.00),
(10, 6, 'ENVIADO', 378.00),
(11, NULL, 'PAGO', 380.00),
(12, NULL, 'PENDENTE', 45.00),
(13, NULL, 'PAGO', 300.00),
(14, NULL, 'PAGO', 1800.00),
(15, 10, 'PAGO', 315.00);

-- 8. Itens Pedido (15)
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 150.00),
(2, 2, 1, 250.00),
(3, 3, 1, 1200.00),
(4, 4, 1, 1500.00),
(5, 5, 1, 450.00),
(6, 6, 1, 890.00),
(7, 7, 1, 320.00),
(8, 8, 1, 280.00),
(9, 9, 1, 350.00),
(10, 10, 1, 420.00),
(11, 11, 1, 380.00),
(12, 12, 1, 45.00),
(13, 13, 1, 300.00),
(14, 14, 1, 1800.00),
(15, 15, 1, 350.00);

-- 9. Pagamentos (15)
INSERT INTO pagamentos (pedido_id, metodo, valor) VALUES
(1, 'PIX', 135.00),
(2, 'CARTAO_CREDITO', 250.00),
(3, 'PIX', 1020.00),
(4, 'BOLETO', 1500.00),
(5, 'PIX', 360.00),
(6, 'BOLETO', 890.00),
(7, 'PIX', 320.00),
(8, 'CARTAO_CREDITO', 266.00),
(9, 'PIX', 350.00),
(10, 'CARTAO_CREDITO', 378.00),
(11, 'PIX', 380.00),
(12, 'BOLETO', 45.00),
(13, 'PIX', 300.00),
(14, 'CARTAO_CREDITO', 1800.00),
(15, 'PIX', 315.00);

-- 10. Avaliações (15)
INSERT INTO avaliacoes (cliente_id, produto_id, nota, comentario) VALUES
(1, 1, 5, 'Excelente mouse!'),
(2, 2, 4, 'Teclado muito bom, barulhento.'),
(3, 3, 5, 'Monitor incrível'),
(4, 4, 5, 'Rápido demais'),
(5, 5, 4, 'Ótimo custo benefício'),
(6, 6, 3, 'Confortável, mas alta'),
(7, 7, 5, 'Sinal forte'),
(8, 8, 4, 'Som claro'),
(9, 9, 5, 'Gabinete muito lindo'),
(10, 10, 5, 'Fonte silenciosa'),
(11, 11, 4, 'Manteve temperaturas baixas'),
(12, 12, 5, 'Funciona perfeitamente'),
(13, 13, 4, 'Controle preciso'),
(14, 14, 5, 'Celular muito rápido'),
(15, 15, 4, 'Bateria dura muito');