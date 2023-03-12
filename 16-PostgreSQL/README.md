# PostgreSQL: administração e otimização do banco 

## Aula 01 - Papel do DBA

- Entendemos qual o papel do DBA em uma empresa
- Conhecemos o modelo cliente-servidor em que os bancos de dados funcionam
- Vimos que o servidor pode receber conexões de diversos clientes

## Aula 02 - Servidor Postgres

- Entendemos o que é um cluster do PostgreSQL
- Aprendemos a inicializar um cluster com o comando `initdb`
- Entendemos como gerenciar o serviço do servidor PostgreSQL
- Conhecemos o utilitário `pg_ctl`

## Aula 03 - Tuning de banco

- Conversamos sobre Tuning do banco de dados
- Entendemos que a escolha do hardware do servidor é importante, mas que serviços de nuvem abstraem esse detalhe para os DBAs
- Conhecemos a pasta `data` do PostgreSQL onde encontramos o arquivo de configurações
- Falamos sobre o papel do DBA na gestão do sistema operacional

## Aula 04 - Processos de manutenção

- Vimos que há processos de manutenção que podemos / devemos fazer no banco
- Aprendemos como o PostgreSQL mantém alguns dados “inúteis” por questão de performance
- Conhecemos o comando `VACUUM` para limpar espaço em disco
- Vimos como reindexar as tabelas do banco com o comando `REINDEX`

## Aula 05 - Backup e Restauração

- Entendemos que há diferentes tipos de backup e conversamos sobre como fazê-los
- Vimos que há 2 principais formas de fazer backups
  1. Através da linha de comando (usando `pg_dump`)
  2. Através de interfaces gráficas (por exemplo, usando o `PgAdmin`)
- Aprendemos como restaurar backups realizados também de 2 formas diferentes

## Aula 06 - Planejamento de queries

- Conhecemos o conceito do planejador de queries (*Query Planner*) do PostgreSQL
- Aprendemos que o comando `EXPLAIN` pode nos dar informações sobre como uma query é executada
- Aprendemos o que são e como utilizar índices
- Vimos que apesar de serem uma ferramenta muito poderosa, índices nem sempre são a solução
