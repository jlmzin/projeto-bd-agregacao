# Execução SQL — INSERT e SELECT Conforme o Diagrama

## Inserindo Dados na Tabela FUNCIONARIO

```sql
INSERT INTO funcionario (nome, supervisor_id)
VALUES
('Carlos', NULL),
('Ana', 1),
('João', 1);
```

---

## Consultando FUNCIONARIO

```sql
SELECT * FROM funcionario;
```

### Resultado Esperado

| id | nome   | supervisor_id |
|----|--------|---------------|
| 1  | Carlos | NULL          |
| 2  | Ana    | 1             |
| 3  | João   | 1             |

---

# Inserindo Dados na Tabela DEPENDENTE

```sql
INSERT INTO dependente (nome, funcionario_id)
VALUES
('Marina', 2),
('Pedro', 3);
```

---

# Consultando DEPENDENTE

```sql
SELECT * FROM dependente;
```

### Resultado Esperado

| id | nome   | funcionario_id |
|----|--------|----------------|
| 1  | Marina | 2              |
| 2  | Pedro  | 3              |

---

# Inserindo Dados na Tabela PROJETO

```sql
INSERT INTO projeto (nome_projeto)
VALUES
('Sistema ERP'),
('Aplicativo Mobile');
```

---

# Consultando PROJETO

```sql
SELECT * FROM projeto;
```

### Resultado Esperado

| id | nome_projeto       |
|----|-------------------|
| 1  | Sistema ERP       |
| 2  | Aplicativo Mobile |

---

# Inserindo Dados na Tabela ALOCACAO

```sql
INSERT INTO alocacao (funcionario_id, projeto_id)
VALUES
(2, 1),
(3, 2);
```

---

# Consultando ALOCACAO

```sql
SELECT * FROM alocacao;
```

### Resultado Esperado

| id | funcionario_id | projeto_id |
|----|----------------|------------|
| 1  | 2              | 1          |
| 2  | 3              | 2          |

---

# Inserindo Dados na Tabela EQUIPAMENTO

```sql
INSERT INTO equipamento (nome_equipamento, alocacao_id)
VALUES
('Notebook Dell', 1),
('Tablet Samsung', 2);
```

---

# Consultando EQUIPAMENTO

```sql
SELECT * FROM equipamento;
```

### Resultado Esperado

| id | nome_equipamento | alocacao_id |
|----|------------------|-------------|
| 1  | Notebook Dell    | 1           |
| 2  | Tablet Samsung   | 2           |

---

# Consulta Completa Utilizando JOIN

```sql
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
```

### Resultado Esperado

| funcionario | nome_projeto       | nome_equipamento |
|-------------|-------------------|------------------|
| Ana         | Sistema ERP       | Notebook Dell    |
| João        | Aplicativo Mobile | Tablet Samsung   |
