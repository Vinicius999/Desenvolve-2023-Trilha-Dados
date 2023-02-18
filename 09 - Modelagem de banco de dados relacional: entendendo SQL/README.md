# 09 - Modelagem de banco de dadsos realacional: normalização

## Aula 01 - Introdução e instalação

#### 00 - Objetivos

- Conhecer a importância da linguagem SQL para implementar um modelo relacional;
- Reconhecer as principais SGBD’s disponíveis do mercado;
- Instalar os componentes necessários para utilizar o MySQL.

#### 1 - Instalação do MySQL

Para a instalação do **MySQL** e **MySQL Workbench** no Linux, foi usado o seguinte tutorial:

- https://www.webmundi.com/banco-de-dados/mysql/como-instalar-mysql-mysql-workbench-no-linux/

Para a **conexão do MySQL Workbench com o MySQL**, foi usado o seguinte tutorial:

- https://www.alura.com.br/artigos/conectando-workbench-mysql-linux#:~:text=Baixando%20o%20MySQL%20Workbench,faremos%20o%20download%20do%20primeiro

## Aula 02 - Esquemas e Tabelas

#### 00 - Objetivos

- Construir um esquema usando o comando `CREATE SCHEMA`;
- Criar uma tabela usando o comando `CREATE TABLE`;
- Alterar tabelas para adicionar restrições e estabelecer a integridade referencial;
- Definir a chave primária e a chave estrangeira de uma tabela.

#### 1 - Criando Schema

Logo depois da instalação e configuração do Sistema Gerencial de Banco de Dados, é possível criar um esquema que armazenará todas as tabelas que serão criadas. Criamos o schema `clube_do_livro`  usando o seguinte comando:

````sql
CREATE SCHEMA clube_do_livro;
````

#### 2 - Criando Tabela

Para criar tabelas, primeiramente selecionamos a guia **Schemas** e depois o schema criado anteriormente, pois é nele que iremos criar nossas tabelas, assim como na imagem abaixo:

<p>
    <img scr="https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/09%20-%20Modelagem%20de%20banco%20de%20dados%20relacional:%20entendendo%20SQL/images/01.png?raw=true"/>
</p>

Com o schema selecionado, podemos criar as nossas tabelas. Como exemplo, criamos a tabela `livros`  usando o seguinte comando:

````sql
CREATE TABLE livros (
	id_livro INT NOT NULL,
    nome_livro VARCHAR(100) NOT NULL,
    autora VARCHAR(100) NOT NULL,
    editora VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preço DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (id_livro)
);
````

#### 3 - Alterando tabelas e adicionando chaves estrangeiras

Para adicionar chaves estrangeiras em uma tabela depois de criada, usamos o comando `ALTER TABLE`. No exemplo abaixo, adicionamos a chave estrangeira na tabela `estoque`:

```sql
ALTER TABLE estoque ADD CONSTRAINT ce_estoque_livros
FOREIGN KEY (id_livro) REFERENCES livros (id_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
```

Onde a linha `FOREIGN KEY (id_livro) REFERENCES livros (id_livro)` indica que a coluna `id_livro` da tabela `estoque` é uma chave estrangeira que faz referência a coluna `id_livro` da tabela `livros`.

As linhas `ON DELETE NO ACTION` e `ON UPDATE NO ACTION` irão gerar um erro quando tentar deletar ou alterar qualquer livro que esteja na tabela `estoque` mas não esteja na tabela `livros`.

#### #DICA: Criar tabelas, PRIMARY KEY e FOREIGN KEY

Também podemos criar tabelas e adicionar suas chaves primárias e estrangeiras de uma maneira mais rápida da seguinte forma:

```sql
CREATE TABLE vendas (
	id_pedido INT NOT NULL PRIMARY KEY,
	id_vendedor INT NOT NULL REFERENCES vendedores(id_vendedor),
	id_livro INT NOT NULL,
	qtd_venda INT NOT NULL,
    data_venda INT NOT NULL,
	FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
```

Na linha `id_pedido INT NOT NULL PRIMARY KEY` definimos a chave primária logo na declaração da coluna. Já quanto a chave estrangeira, podemos fazer de 2 maneiras distintas:

- `id_vendedor INT NOT NULL REFERENCES vendedores(id_vendedor)`: na declaração da coluna;
- `FOREIGN KEY (id_livro) REFERENCES livros(id_livro)`: após a declaração das colunas.

## Aula 03 - Inserindo dados

#### 00 - Objetivos

- a
- b
- c

#### 01 - Comando INSERT

Podemos começar por qualquer tabela, desde que a relação entre essas duas tabelas esteja desativada. Ou seja, aquela chave estrangeira não esteja mais ligando uma tabela a outra.

Para isso, usamos o comando:
```sql
SET FOREIGN_KEY_CHECKS = 0;
```

Após desativas as chaves estrangeiras, podemos inserir valores nas tabelas. No exemplo abaixo, inserimos uma linha na tabela `livros`:

```sql
INSERT INTO livros VALUES (
	1, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 'Aventura', 34.45
);
```

Lembrando que cada valor está posicionado na mesma ordem em que as colunas foram criadas na tabela.

Tambem podemos declarar no `INSERT` , juntamente com a tabela, as suas colunas na ordem em que quisermos, mas nesse caso, os valores inseridos devem seguir a mesma ordem. Usando o exemplo anterior, teríamos o seguinte camando:
```sql
INSERT INTO livros (id_livro, nome_livro, autoria, editora, categoria, preço)
VALUES
(1, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 'Aventura', 34.45);
```

