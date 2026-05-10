-- =====================================================
-- SISTEMA DE GERENCIAMENTO DE FUNCIONÁRIOS E PROJETOS
-- PostgreSQL
-- =====================================================

-- =====================================================
-- REMOÇÃO DAS TABELAS (caso já existam)
-- =====================================================

DROP TABLE IF EXISTS equipamento CASCADE;
DROP TABLE IF EXISTS alocacao CASCADE;
DROP TABLE IF EXISTS dependente CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS funcionario CASCADE;

-- =====================================================
-- CRIAÇÃO DAS TABELAS
-- =====================================================

-- ==========================================
-- TABELA FUNCIONARIO
-- Autorelacionamento (supervisor)
-- ==========================================

CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    supervisor_id INTEGER,

    CONSTRAINT fk_supervisor
        FOREIGN KEY (supervisor_id)
        REFERENCES funcionario(id)
);

-- ==========================================
-- TABELA DEPENDENTE
-- Entidade Fraca
-- ==========================================

CREATE TABLE dependente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    funcionario_id INTEGER NOT NULL,

    CONSTRAINT fk_funcionario
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id)
        ON DELETE CASCADE
);

-- ==========================================
-- TABELA PROJETO
-- ==========================================

CREATE TABLE projeto (
    id SERIAL PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL
);

-- ==========================================
-- TABELA ALOCACAO
-- Relacionamento N:N
-- entre FUNCIONARIO e PROJETO
-- ==========================================

CREATE TABLE alocacao (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER NOT NULL,
    projeto_id INTEGER NOT NULL,

    CONSTRAINT fk_alocacao_funcionario
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id),

    CONSTRAINT fk_alocacao_projeto
        FOREIGN KEY (projeto_id)
        REFERENCES projeto(id)
);

-- ==========================================
-- TABELA EQUIPAMENTO
-- Agregação
-- Equipamento ligado à ALOCACAO
-- ==========================================

CREATE TABLE equipamento (
    id SERIAL PRIMARY KEY,
    nome_equipamento VARCHAR(100) NOT NULL,
    alocacao_id INTEGER NOT NULL,

    CONSTRAINT fk_equipamento_alocacao
        FOREIGN KEY (alocacao_id)
        REFERENCES alocacao(id)
);

-- =====================================================
-- INSERTS
-- =====================================================

-- ==========================================
-- FUNCIONARIOS
-- ==========================================

INSERT INTO funcionario (nome, supervisor_id)
VALUES
('Carlos', NULL),
('Ana', 1),
('João', 1);

-- ==========================================
-- DEPENDENTES
-- ==========================================

INSERT INTO dependente (nome, funcionario_id)
VALUES
('Marina', 2),
('Pedro', 3);

-- ==========================================
-- PROJETOS
-- ==========================================

INSERT INTO projeto (nome_projeto)
VALUES
('Sistema ERP'),
('Aplicativo Mobile');

-- ==========================================
-- ALOCACOES
-- ==========================================

INSERT INTO alocacao (funcionario_id, projeto_id)
VALUES
(2, 1),
(3, 2);

-- ==========================================
-- EQUIPAMENTOS
-- ==========================================

INSERT INTO equipamento (nome_equipamento, alocacao_id)
VALUES
('Notebook Dell', 1),
('Tablet Samsung', 2);

-- =====================================================
-- CONSULTAS SELECT
-- =====================================================

-- ==========================================
-- FUNCIONARIOS
-- ==========================================

SELECT * FROM funcionario;

-- ==========================================
-- DEPENDENTES
-- ==========================================

SELECT * FROM dependente;

-- ==========================================
-- PROJETOS
-- ==========================================

SELECT * FROM projeto;

-- ==========================================
-- ALOCACOES
-- ==========================================

SELECT * FROM alocacao;

-- ==========================================
-- EQUIPAMENTOS
-- ==========================================

SELECT * FROM equipamento;

-- =====================================================
-- CONSULTA COM JOIN
-- Demonstra a agregação
-- =====================================================

SELECT
    f.nome AS funcionario,
    p.nome_projeto,
    e.nome_equipamento
FROM alocacao a

INNER JOIN funcionario f
    ON a.funcionario_id = f.id

INNER JOIN projeto p
    ON a.projeto_id = p.id

INNER JOIN equipamento e
    ON e.alocacao_id = a.id;

-- =====================================================
-- TESTE DO ON DELETE CASCADE
-- =====================================================

-- Excluindo funcionário Ana (id = 2)

-- DELETE FROM funcionario
-- WHERE id = 2;

-- Após executar o DELETE acima,
-- os dependentes relacionados
-- também serão removidos automaticamente.

-- Verificar:
-- SELECT * FROM dependente;
-- =====================================================
