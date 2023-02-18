# 09 - Modelagem de banco de dadsos realacional: normalização

## Aula 01 - Introdução e instalação

#### 00 - Objetivos

- Conhecer a importância da linguagem SQL para implementar um modelo relacional;
- Reconhecer as principais SGBD’s disponíveis do mercado;
- Instalar os componentes necessários para utilizar o MySQL.

#### 1 - Instalação do MySQL

Para a instalação do MySQL e MySQL Workbench no Linux, foi usado o seguinte tutorial:

- https://www.webmundi.com/banco-de-dados/mysql/como-instalar-mysql-mysql-workbench-no-linux/

Para conecxão do MySQL Workbench com o MySQL, foi usado o seguinte tutorial:

- https://www.alura.com.br/artigos/conectando-workbench-mysql-linux#:~:text=Baixando%20o%20MySQL%20Workbench,faremos%20o%20download%20do%20primeiro

## Aula 02 - Esquemas e Tabelas

#### 00 - Objetivos

- Construir um esquema usando o comando `CREATE SCHEMA`;
- Criar uma tabela usando o comando `CREATE TABLE`;
- Alterar tabelas para adicionar restrições e estabelecer a integridade referencial;
- Definir a chave primária e a chave estrangeira de uma tabela.

#### 1 - Criando Schema

Logo depois da instalação e configuração do Sistema Gerencial de Banco de Dados é possível criar um esquema que armazenará todas as tabelas que serão criadas. Criamos schemas usando o comando:

````sql
CREATE SCHEMA NOME_SCHEMA
````

#### 2 - Criando Tabela

