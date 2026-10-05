-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Aula 02 - Primeiras consultas com SQL
-- MAGIC
-- MAGIC Nesta aula vamos começar a explorar a base de viagens do Governo Federal utilizando SQL no Databricks.
-- MAGIC
-- MAGIC ## Conteúdos da aula
-- MAGIC
-- MAGIC - `SELECT`
-- MAGIC - seleção de colunas
-- MAGIC - `LIMIT`
-- MAGIC - `ORDER BY`
-- MAGIC - `DISTINCT`
-- MAGIC - introdução ao `WHERE`
-- MAGIC
-- MAGIC **Tabela utilizada:** `workspace.default.2026_viagem`

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 1. Primeiro SELECT
-- MAGIC
-- MAGIC O `SELECT` é utilizado para consultar dados de uma tabela.
-- MAGIC
-- MAGIC O caractere `*` indica que queremos retornar todas as colunas.

-- COMMAND ----------

SELECT *
FROM workspace.default.`2026_viagem`;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 2. Limitando a quantidade de registros
-- MAGIC
-- MAGIC O `LIMIT` controla quantas linhas serão retornadas pela consulta.
-- MAGIC
-- MAGIC Aqui vamos visualizar apenas os 10 primeiros registros.

-- COMMAND ----------

SELECT *
FROM workspace.default.`2026_viagem`
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 3. Selecionando colunas específicas
-- MAGIC
-- MAGIC Nem sempre precisamos retornar todas as colunas da tabela.
-- MAGIC
-- MAGIC Podemos informar no `SELECT` apenas as colunas que queremos analisar.

-- COMMAND ----------

SELECT
    nome,
    cargo,
    nome_orgao_solicitante,
    destinos,
    valor_passagens,
    valor_diarias
FROM workspace.default.`2026_viagem`
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 4. Ordenando os dados
-- MAGIC
-- MAGIC O `ORDER BY` permite ordenar o resultado de uma consulta.
-- MAGIC
-- MAGIC Com `DESC`, os valores são apresentados do maior para o menor.
-- MAGIC
-- MAGIC **Pergunta:** quais registros possuem os maiores valores de passagens?

-- COMMAND ----------

SELECT
    nome,
    destinos,
    valor_passagens
FROM workspace.default.`2026_viagem`
ORDER BY valor_passagens DESC
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 5. Quais foram os destinos?
-- MAGIC
-- MAGIC O `DISTINCT` remove valores duplicados do resultado.
-- MAGIC
-- MAGIC Dessa forma, podemos identificar quais destinos aparecem na base.

-- COMMAND ----------

SELECT DISTINCT
    destinos
FROM workspace.default.`2026_viagem`
ORDER BY destinos DESC;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6. Quais foram os cargos?
-- MAGIC
-- MAGIC Também podemos usar `DISTINCT` para conhecer os diferentes cargos registrados na base.

-- COMMAND ----------

SELECT DISTINCT
    cargo
FROM workspace.default.`2026_viagem`
ORDER BY cargo;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 7. Filtrando registros
-- MAGIC
-- MAGIC O `WHERE` permite retornar apenas os registros que atendem a uma condição.
-- MAGIC
-- MAGIC Neste exemplo, buscamos viagens cujo destino está registrado como **Sem informação**.
-- MAGIC
-- MAGIC Este é apenas um primeiro contato com filtros. O `WHERE` será aprofundado nas próximas aulas.

-- COMMAND ----------

SELECT
    destinos,
    valor_passagens
FROM workspace.default.`2026_viagem`
WHERE destinos = 'Sem informação'
ORDER BY valor_passagens DESC;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Resumo da aula
-- MAGIC
-- MAGIC Nesta aula utilizamos SQL para:
-- MAGIC
-- MAGIC - consultar uma tabela com `SELECT`;
-- MAGIC - limitar resultados com `LIMIT`;
-- MAGIC - selecionar colunas específicas;
-- MAGIC - ordenar registros com `ORDER BY`;
-- MAGIC - identificar valores únicos com `DISTINCT`;
-- MAGIC - fazer um primeiro filtro com `WHERE`.