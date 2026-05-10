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

```mermaid
erDiagram

    FUNCIONARIO ||--o{ FUNCIONARIO : gerencia
    FUNCIONARIO ||--o{ DEPENDENTE : possui
    FUNCIONARIO ||--o{ ALOCACAO : participa
    PROJETO ||--o{ ALOCACAO : contem
    ALOCACAO ||--o{ EQUIPAMENTO : utiliza

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
```
Explicação do Autorelacionamento

O autorelacionamento foi aplicado na entidade FUNCIONARIO.

Cada funcionário pode possuir um supervisor, que também é um funcionário da empresa. Dessa forma, a tabela referencia a si mesma através do campo supervisor_id.

Esse modelo permite representar hierarquias organizacionais, como:

Gerentes
Supervisores
Coordenadores
Subordinados

Exemplo:
Um gerente pode supervisionar vários funcionários, enquanto cada funcionário possui apenas um supervisor direto.

Explicação da Agregação

A agregação foi utilizada para resolver o relacionamento entre:

Funcionários
Projetos
Equipamentos

Inicialmente, funcionários trabalham em projetos através da entidade ALOCACAO.

Depois disso, os equipamentos são vinculados à alocação, e não diretamente ao funcionário ou ao projeto.

Isso resolve um problema importante:

Um mesmo funcionário pode utilizar equipamentos diferentes dependendo do projeto em que está trabalhando.

Exemplo:

João utiliza um notebook no Projeto A
João utiliza um tablet no Projeto B

Assim, o equipamento fica associado ao contexto da participação do funcionário no projeto.

Tecnologias Utilizadas
PostgreSQL
SQL
Mermaid Diagram
GitHub README
Conceitos Aplicados
Modelagem Entidade-Relacionamento
Chaves Primárias e Estrangeiras
Relacionamentos N:N
Integridade Referencial
Entidade Fraca
Autorelacionamento
Agregação
