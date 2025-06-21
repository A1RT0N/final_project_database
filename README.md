# 📊 Projeto de Banco de Dados

Este repositório contém a definição de um banco de dados relacional, incluindo a criação de tabelas, inserção de dados, views e consultas SQL.

## 🗂️ Estrutura dos Arquivos

- [`create_tables.sql`](create_tables.sql) — Criação das tabelas do banco de dados.
- [`insert_data.sql`](insert_data.sql) — Inserção dos dados nas tabelas.
- [`queries.sql`](queries.sql) — Consultas SQL (SELECT) para obtenção de informações.
- [`queries_views.sql`](queries_views.sql) — Criação de views (visões) no banco.

---

## 🚀 Como Executar

### ✅ Pré-requisitos

- Um Sistema Gerenciador de Banco de Dados (SGBD) instalado, como:
  - MySQL
  - PostgreSQL
  - SQLite
  - (ou outro compatível com SQL padrão)

- Ferramentas recomendadas:
  - DBeaver, MySQL Workbench, pgAdmin, ou linha de comando do seu SGBD.

---

### ⚙️ Passo a passo

1. **Crie o banco de dados:**

No MySQL:

CREATE DATABASE nome_do_banco;
USE nome_do_banco;

No PostgreSQL:
CREATE DATABASE nome_do_banco;
\c nome_do_banco;

2. **Execute o script de criação das tabelas:**
source caminho/create_tables.sql;

3. **Execute o script de inserção dos dados:**
source caminho/insert_data.sql;

4. **(Opcional) Crie as views:**
source caminho/queries_views.sql;

5. **Execute as consultas::**
source caminho/queries.sql;

**Link do Diagrama**
https://app.diagrams.net/?splash=0#G1eLawar0bZCrlM4QZTSRGWfczY2TK8pjd#%7B%22pageId%22%3A%224B2qsMCtX4W-gn1Z2e9L%22%7D






