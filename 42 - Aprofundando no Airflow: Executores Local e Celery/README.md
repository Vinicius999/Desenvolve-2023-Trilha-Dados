 

# Aprofundando no Airflow: Executores Local e Celery

### Resumo do Curso

- Crie DAGs para extrair dados do mercado financeiro
- Entenda o que são os executores do Airflow
- Aprenda como confiigurar o Executor Local
- Saiba o que são workers e fila de tarefas
- Aprenda como configurar o Executor Celery
- Conheça diferentes configurações de paralelismo do Airflow

### Aula 01 - Configurando o ambiente

- Instalar o Python 3.9 no Ubuntu;
- Criar um ambiente virtual;
- Ativar um ambiente virtual;
- Instalar o Airflow juntamente com alguns pacotes; e
- Executar o Airflow localmente.

### Aula 02 - Criando e testando o DAG

- Utilizar a biblioteca yfinance;
- Extrair dados de ações da bolsa de valores;
- Criar tarefas utilizando o TaskFlow; e
- Criar um DAG utilizando TaskFlow.

### Aula 03 - Configurando o Executor Local

- Identificar como funciona o processo de execução das tarefas;
- Compreender o que é o Executor Local;
- Instalar o Postgres;
- Configurar o Executor Local; e
- Analisar os parâmetros `max_active_tasks_per_dag` e `max_active_runs_per_dag`.

### Aula 04 - Configurando o Executor Celery

- Reconhecer o Executor Celery;
- Esquematizar o que são os workers e filas de tarefas;
- Instalar o Redis;
- Configurar o Executor Celery; e
- Compreender o que é o Celery Flower.

### Aula 05 - Paralelismo no Celery

- Limitar a quantidade de tarefas que um worker pode executar, utilizando o `worker_concurrency`;
- Identificar como funciona a dinâmica de execução das tarefas com dois DAGs ativos;
- Esquematizar o que é um pool e como podemos utilizá-lo; e
- Criar um novo pool.
