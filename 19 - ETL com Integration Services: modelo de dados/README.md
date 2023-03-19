# ETL com Integration Services: modelo de dados

## Aula 01 - Entendendo o nosso problema

- A revisão de todo o processo de construção de um sistema de BI;
- Que este treinamento se aplicará apenas na construção e carga do Data Warehouse;
- A apresentação da matriz indicador da empresa Suco de Frutas, que será usada como exemplo prático neste treinamento.

## Aula 02 - Instalando os produtos

- Como instalar o **Microsoft SQL Server 2017 Developer**;
- Como instalar o **Microsoft SQL Server Management Studio 2017**;
- Como instalar o **Microsoft SQL Server Data Tools 2017**.

## Aula 03 - O projeto do Data Warehouse
- Como devem ser os formatos das tabelas do Data Warehouse da empresa de Suco de Frutas;
- Como criar um banco de dados vazio no Microsoft SQL Server;
- Como criar um projeto vazio no Visual Studio para criação das tabelas no banco de dados.

## Aula 04 - As dimensões fábrica, cliente e produto
- Como criar uma tabela no Microsoft SQL Server, usando o projeto SQL Server no Visual Studio;
- Como configurar os campos usando diversos tipos;
- Como configurar a chave primária;
- A importância das chaves estrangeiras, no caso de tabelas que se relacionam.

## Aula 05 - Dimensões organizacional e tempo
- A criação de uma tabela Pai-Filho e como fazemos um relacionamento entre a própria tabela;
- Vários exemplos de diferentes atributos na dimensão tempo.

## Aula 06 - As tabelas de fato
- Que na criação das fatos devemos criar várias chaves estrangeiras com todas as tabelas de dimensão que fazem sentido.

## Carregando dados na dimensão
- Como atualizar dados em uma tabela de dimensão através do Microsoft Integration Services;
- Que o tipo de dado é importante e deve ser levado em conta durante a atualização da tabela destino;
- Que deve ser levado em conta se o registro a ser atualizado já existe ou não na tabela e que temos que usar um processo especial para tratar disto durante a carga.
