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
    <img src="https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/09%20-%20Modelagem%20de%20banco%20de%20dados%20relacional:%20entendendo%20SQL/images/01.png?raw=true" height="300"/>
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
    data_venda DATE NOT NULL,
	FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
```

Na linha `id_pedido INT NOT NULL PRIMARY KEY` definimos a chave primária logo na declaração da coluna. Já quanto a chave estrangeira, podemos fazer de 2 maneiras distintas:

- `id_vendedor INT NOT NULL REFERENCES vendedores(id_vendedor)`: na declaração da coluna;
- `FOREIGN KEY (id_livro) REFERENCES livros(id_livro)`: após a declaração das colunas.

## Aula 03 - Inserindo dados

#### 00 - Objetivos

- Inserir dados usando o comando `INSERT`;
- Inserir dados fora da ordem dos campos da tabela;
- Inserir múltiplas linhas em uma execução;
- Desativar e ativar as restrições de chave estrangeira usando o comando `SET FOREIGN_KEY_CHECKS`.

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

#### 02 - Inserindo múltiplas linhas

Podemos inserir múltiplas linhas de uma única vez. Abaixo, temos o exemplo com a tabela `livros`:

```sql
INSERT INTO livros (id_livro, nome_livro, autoria, editora, categoria, preço)
VALUES
	(2, 'A Volta ao Mundo em 80 Dias', 'Júlio Verne', 'Principis', 'Aventura', -21.99),
	(3, 'O Cortiço', 'Aluísio de Azevedo', 'Panda Books', 'Romance', 47.8),
	(4, 'Dom Casmurro', 'Machado de Assis', 'Via Leitura', 'Romance', 19.90),
	(5, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Antofágica', 'Romance', 45),
	(6, 'Quincas Borba', 'Machado de Assis', 'L&PM Editores', 'Romance', 48.5),
	(7, 'Ícaro', 'Gabriel Pedrosa', 'Ateliê', 'Poesia', 36),
	(8, 'Os Lusíadas', 'Luís Vaz de Camões', 'Montecristo', 'Poesia', 18.79),
	(9, 'Outros Jeitos de Usar a Boca', 'Rupi Kaur', 'Planeta', 'Poesia', 34.8);
```

#### 03 - Insindo fora e ordem

Também podemos fazer a inserção de informações em ordem diferente dos campos que foram declarados na tabela. Usando o exemplo anterior, teríamos o seguinte camando:
```sql
#Inserindo valores fora de ordem
INSERT INTO livros (categoria, autoria, nome, editora, id_livro, preço)
VALUES
    ('Biografia', 'Malala Yousafzai', 'Eu sou Malala', 'Companhia das Letras', 11, 22.32),
    ('Biografia', 'Michelle Obama', 'Minha história', 'Objetiva', 12, 57.90),
    ('Biografia', 'Anne Frank', 'Diário de Anne Frank', 'Pe Da Letra', 13, 34.90);
```

## Aula 04 - Consultando e alterando dados

#### 00 - Objetivos

- Selecionar as informações usando o comando `SELECT`;
- Selecionar informações específicas usando o `WHERE` para criar filtros;
- Aplicar os comandos `AND`, `OR` e `NOT` para adicionar condições e personalizar os filtros da consulta;
- Construir uma tabela sem linhas duplicadas com o comando `SELECT DISTINCT`;
- Ordenar a tabela usando o comando `ORDER BY`;
- Deletar e atualizar informações usando o `DELETE` e o `UPDATE` respectivamente.

#### 01 - Consultando dados

Para consultar dados, usamos o comando `SELECT`. No exemplo a seguir, selecionamos todos os registros da tabela `livros`:

```sql
SELECT * FROM livros;
```

Para selecionar uma coluna em específico, explicitamos o nome da coluna no `SELECT`:

```sql
SELECT id_livro FROM livros;
```

Podemos também formatar (dar um apelido) uma coluna usando a cláusula `AS` :

```sql
SELECT id_livro as 'ID do Livro' FROM livros;
```

#### 02 - Filtros no SQL

Para filtrar o resultados das consultas, usamos o comando `WHERE`, onde colocamos a consição ou condições a serem filtradas. No exemplo a seguir, filtramos a consulta da tabela `livros` para retornar somente os livros cuja `categoria` seja `"Biografia"` :

```sql
SELECT * FROM livros
WHERE categoria = "Biografia";
```

##### Identificando parte dos valores

Para procurar por todos os valores que terminam com determinado valor, usamos `LIKE` ` %final_valor`.

No exemplo, buscamos por todas as cidades que terminam com `lândia`.

```sql
SELECT cidade, estado
FROM mapa
WHERE cidade LIKE '%lândia';
```

O operador `%` substitui qualquer valor na procura. Então, caso queira cidades que começam com `A`, basta usar `A%`. Ou para localizar as cidades que contém a sílaba `'ma'`, podemos usar o `%ma%` , então aparecerão todas as cidades que possuem `'ma'` posicionada em qualquer lugar.

#### 03 - Seleção distinta

Para uma seleção única de cada valor (eliminar resultados duplicados), usamos o `DISTINCT`. No exemplo abaixo, buscamos pelos livros que foram vendidos pelo **vendedor 1** e ordenamos o resultado pela coluna `id_livro`, usando `ORDER BY`:

```sql
SELECT DISTINCT id_livro FROM vendas
WHERE id_vendedor = 1
ORDER BY id_livro;
```

#### 04 - Alterando informações

Para **deletar** uma linha da tabela, usamos o comando `DELETE` e passamos a condição com o `WHERE`. 

```sql
DELETE FROM livros
WHERE id_livro = 8;
```

Para atualizar registros na tabela, usamos o comando `UPDATE` e `SET`. No exemplo, aplicamos 10% de desconto no `preco` de todos os livros.

```sql
UPDATE livros
SET preco = 0.9 * preco;
```

#### 05 - Alterando nome ou tipo da coluna

Para alterar o nome ou tipo da coluna, usamos `ALTER TABLE nome_tabela` em conjunto com
`CHANGE nome_atual nome_novo TIPO_COLUNA;` .

```sql
ALTER TABLE vendedores
CHANGE nome_vendedor nome_vendedor_NEW VARCHAR(255) NOT NULL;
```

#### 06 - Excluir tabelas

```sql
DROP TABLE vendedores
```

#### 





