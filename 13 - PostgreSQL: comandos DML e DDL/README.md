# PostgreSQL: Views, Sub-Consultas e Funções

## Aula 01 - Modelagem de Dados

#### Objetivos:

- Conhecemos o conceito de modelagem de dados;
- Conhecemos sobre schemas no PostgreSQL que nos ajudam a organizar nossas tabelas;
- Conversamos sobre análise de requisitos e sobre modelos utilizados neste processo;

## Aula 02 - Estrutura do banco

#### Objetivos:

- Desmembramos a criação de um banco de dados e aprofundamos esse conhecimento;
- Falamos sobre os detalhes ao criar uma tabela;
- Conhecemos o **`ALTER TABLE`** para alterar a estrutura de uma tabela;
- Vimos a diferença entre comandos **DDL** e **DML**.
  - **DDL**:
    - `CREATE`
    - `ALTER`
    - `DROP`

  - **DML**:
    - `INSERT`
    - `UPDATE`
    - `DELETE`
    - `SELECT`


## Aula 03 - inclusão de Dados

#### Objetivos:

- Entendemos as particularidades da representação de tipos e uso de aspas em SQL;
- Conhecemos o comando `INSERT SELECT` que realiza inserções a partir de uma consulta;
- Falamos sobre importação e exportação de dados em arquivos CSV.

## Aula 04 - Alteração de dados

#### Objetivos:

- Conhecemos a sintaxe do **`UPDATE FROM`**, que atualiza uma tabela baseando-se em dados de uma consulta;
- Vimos os perigos de uma alteração ou remoção incorreta (sem `WHERE`, por exemplo);
- Aprendemos a trabalhar com transações;
- Vimos como confirmar ou cancelar uma transação com **`BEGIN`**, **`ROLLBACK`**, **`COMMIT`**.

## Aula 05 - Particularidades PostgreSQL

- Conhecemos as `SEQUENCE`s do PostgreSQL;
- Aprendemos o que é uma `ENUM`;
- Aprendemos a criar um tipo personalizado no banco de dados;
- Conversamos sobre como bancos de dados são utilizados na vida real.
