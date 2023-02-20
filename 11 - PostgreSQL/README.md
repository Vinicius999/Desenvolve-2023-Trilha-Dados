# 11 - PostgreSQL

## Aula 01 - Primeiros passos com PostgreSQL ([arquivos](https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/11%20-%20PostgreSQL/01-Primeios-passos-com-PostgreSQL/))

#### 00 - Objetivos

- Como instalar o **PostgreSQL** e o **pgAdmin**
- Como conectar ao PostgreSQL, utilizando o **terminal** e o **pgAdmin**
- A criar o banco de dados pelo **terminal** e pelo **pgAdmin**
- Como apagar o banco de dados pelo **terminal** e pelo **pgAdmin**
- A criar tabela com os tipos de dados mais comuns:
  - `SERIAL`
  - `VARCHAR`
  - `CHAR`
  - `TEXT`
  - `INTEGER`
  - `NUMERIC`
  - `BOOLEAN`
  - `DATE`
  - `TIME`
  - `TIMESTAMP`

#### 1 - **PostgreSQL** e Instalação

O **PostgreSQL** se auto entitula o banco de dados relacional mais avançado do mundo:

> *"PostgreSQL: The World's Most Advanced Open Source Relational Database"* 

Link para download do PostgreSQL:  [PostgreSQL Download](https://www.postgresql.org/)

#### 2 - Criação e Exclusão de banco de dados

Para verificar se estamos conectados no banco de dados, usamos o comando:

```postgresql
SELECT NOW();
```

Para **criar um banco de dados** via linha de comando, usamos o `CREATE DATABASE`, como no exemplo:

```postgresql
CREATE DATABASE alura;
```

Para visualizar os bancos de dados já estão no nosso postgres, podemos usar o comando `\l`:

Já para criar um banco de dados via pgAdmin, fazemos como na imagem a seguir:

![criando-banco-de-dados](https://caelum-online-public.s3.amazonaws.com/1659-postgreSQL-Primeiros-passos-com-SQL/Transcri%C3%A7%C3%A3o/Aula+1/Imagens/criando_database_pgadmin.png)

Para **apagar um banco de dados**, usamos o comando `DROP DATABASE`, como no exemplo abaixo:

```postgresql
DROP DATABASE teste;
```

Já para criar um banco de dados via pgAdmin, basca clicar em cima do nome dele com o botão direito e clicar na opção "*Delete/Drop*". Uma janela de confirmação vai abrir e você clica no botão "*Yes*".

#### 3 - Criando tabelas no banco de dados

Para criar tabelas, usamos o comando `CREATE TABLE`, onde declaramos o nome da tabela a ser criada, assim como as informações/campos que irão compor tabela. Segue exemplo da criação da tabela `aluno`:

```postgresql
CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observação TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);
```

Podemos encontrar todos os tipos de campos de dados para o postgres neste [link](https://www.postgresql.org/docs/12/datatype.html).

## Aula 02 - Executando operações CRUD ([arquivos](https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/11%20-%20PostgreSQL/01-Primeios-passos-com-PostgreSQL/))
