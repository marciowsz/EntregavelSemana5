-- ============================================================================
-- SPRINT 5 - 06_PERMISSOES.SQL: ROLES, USERS E PERMISSÕES (RBAC)
-- ============================================================================

CREATE ROLE role_admin;
CREATE ROLE role_gerente_vendas;

CREATE USER usuario_admin WITH PASSWORD 'Admin#2026Pass';
CREATE USER usuario_gerente WITH PASSWORD 'Gerente#2026Pass';

GRANT role_admin TO usuario_admin;
GRANT role_gerente_vendas TO usuario_gerente;

-- Admin tem acesso pleno
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO role_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO role_admin;

-- Gerente tem leitura total e controle sobre produtos/pedidos, mas sem exclusão de clientes
GRANT SELECT ON ALL TABLES IN SCHEMA public TO role_gerente_vendas;
GRANT INSERT, UPDATE ON produtos, estoque, pedidos, itens_pedido TO role_gerente_vendas;

REVOKE DELETE ON clientes, pedidos FROM role_gerente_vendas;