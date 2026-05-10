# projeto-bd-agregacao
# Sistema de Gerenciamento de Funcionários, Projetos e Equipamentos

## Descrição do Projeto

Este projeto apresenta a modelagem de um banco de dados utilizando PostgreSQL com foco em três conceitos importantes de Banco de Dados:

- Autorelacionamento
- Entidade Fraca (Dependência de Existência)
- Agregação

O sistema foi desenvolvido para representar funcionários, seus dependentes, projetos e os equipamentos utilizados durante as alocações em projetos.

---

# Diagrama Entidade-Relacionamento (Mermaid)

# Sistema de Gerenciamento de Funcionários, Projetos e Equipamentos

## Descrição do Projeto

Este projeto apresenta a modelagem de um banco de dados utilizando PostgreSQL com foco nos conceitos de:

- Entidade Fraca (Dependência de Existência)
- Autorelacionamento
- Agregação

O sistema controla funcionários, seus dependentes, projetos e os equipamentos utilizados durante a participação em projetos.

---

# Diagrama Entidade-Relacionamento

```mermaid
erDiagram

    FUNCIONARIO {
        int id PK
        string nome
        int supervisor_id FK
    }

    DEPENDENTE {
        int id PK
        string nome
        int funcionario_id FK
    }

    PROJETO {
        int id PK
        string nome_projeto
    }

    ALOCACAO {
        int id PK
        int funcionario_id FK
        int projeto_id FK
    }

    EQUIPAMENTO {
        int id PK
        string nome_equipamento
        int alocacao_id FK
    }

    FUNCIONARIO ||--o{ DEPENDENTE : possui

    FUNCIONARIO ||--o{ ALOCACAO : participa
    PROJETO ||--o{ ALOCACAO : recebe

    ALOCACAO ||--o{ EQUIPAMENTO : utiliza

    FUNCIONARIO ||--o{ FUNCIONARIO : supervisiona
```
Explicação do Autorelacionamento

O autorelacionamento foi aplicado na entidade FUNCIONARIO.

Um funcionário pode supervisionar outros funcionários da empresa. Para isso, o atributo supervisor_id referencia a própria tabela FUNCIONARIO.

Dessa forma, é possível representar a hierarquia organizacional da empresa, como gerentes e subordinados.

Explicação da Agregação

A agregação foi aplicada através da entidade ALOCACAO.

A tabela ALOCACAO representa o relacionamento entre FUNCIONARIO e PROJETO, registrando quais funcionários participam de quais projetos.

Os equipamentos não são vinculados diretamente ao funcionário nem ao projeto. Eles são associados à alocação, permitindo identificar qual equipamento foi utilizado por determinado funcionário em um projeto específico.

Isso evita ambiguidades e representa corretamente o contexto de uso dos equipamentos dentro dos projetos.

Tecnologias Utilizadas
PostgreSQL
SQL
Mermaid
GitHub


A mudança principal:

trocar "gerencia" por "supervisiona" melhora entendimento
deixar o autorelacionamento por último melhora o layout automático
o Mermaid organiza melhor as entidades

Outra pegadinha importante:

professor provavelmente espera perceber que:

FUNCIONARIO ↔ PROJETO

é N:N e precisa da entidade associativa ALOCACAO.

O erro anterior era tentar “esconder” a agregação dentro de equipamento, o que quebrava o conceito correto de modelagem.
