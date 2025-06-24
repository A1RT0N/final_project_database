# Projeto de Banco de Dados

Este repositório contém os scripts em SQL do trabalho final da disciplina de Base de Dados, desenvolvido pelo grupo 19.

Ayrton da Costa Ganem Filho - 14560190
Cauê Paiva Lira - 14675416
Pedro Henrique Ferreira Silva - 14677526
Pedro Lucas Figueiredo Bahiense - 14675458

**Link do Diagrama da modelagem MER**
https://app.diagrams.net/?splash=0#G1eLawar0bZCrlM4QZTSRGWfczY2TK8pjd#%7B%22pageId%22%3A%224B2qsMCtX4W-gn1Z2e9L%22%7D


## Estrutura dos Arquivos

- [`create_tables.sql`](create_tables.sql) — Criação das tabelas do banco de dados.
- [`insert_data.sql`](insert_data.sql) — Inserção dos dados nas tabelas.
- [`index.sql`](index.sql) - Criação de índices.
- [`queries.sql`](queries.sql) — Consultas SQL (SELECT) para obtenção de informações.
- [`queries_views.sql`](queries_views.sql) — Criação de views (visões) no banco.

---

##  Configuração do projeto


### 1 Requisitos
- Docker  
- Imagem Docker do **PostgreSQL** (baixada automaticamente ao iniciar o contêiner)  
- Ambiente de Jupyter Notebooks da disciplina instalados  

---

### 2 Instalação
1. Inicie um contêiner PostgreSQL (substitua senha e nome de usuário conforme desejado):
   ```bash
   docker run --name postgres-default \
     -e POSTGRES_PASSWORD=pgadmin \
     -e POSTGRES_USER=postgres \
     -e POSTGRES_DB=postgres \
     -p 5432:5432 \
     -d postgres
   ```

### 3 Executar comandos




No mesmo ambiente dos Jupyter Notebooks da disciplina (com as bibliotecas necessárias instaladas), crie um novo arquivo .ipynb.
Na primeira célula, carregue as bibliotecas necessárias para executar SQL no notebook:

```bash
%load_ext sql
%config SqlMagic.autocommit = True
%sql postgresql://postgres:pgadmin@localhost:5432/postgres
```
Na segunda célula, execute estes comandos para resolver problemas com a biblioteca em Python:

```bash
%config SqlMagic.style='_DEPRECATED_MARKDOWN'
%reload_ext sql
```
Execute as consultas nas próximas células. Lembre-se de começar as próximas células do notebook com %%sql para que os comandos sejam executados corretamente.







