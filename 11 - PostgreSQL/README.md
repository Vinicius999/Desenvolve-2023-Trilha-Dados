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

## Aula 02 - Executando operações CRUD ([arquivos](https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/11%20-%20PostgreSQL/02-Executando-operacoes-CRUD/))

#### 00 - Objetivos

- Como incluir um registro na tabela, entendendo a sintaxe de inclusão de cada tipo de campo
- A efetuar uma consulta simples, para listar os dados da tabela
- Como alterar um registro na tabela
- Como excluir um registro na tabela

#### 01 - Inserindo dados na tabela

Para inserir dados na tabela, usamos o comando `INSERT INTO`, como no exemplo abaixo:

````postgresql
INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
)
VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);
````

Os valores estão posicionado na mesma ordem de seus respectivos campos declarados na parte de cima. Caso os campos da tabela não fossem declarados, os valores inseridos deveriam seguir a mesma ordem em que foram criados na tabela.

#### 02 - Alterando dados na tabela

Para **alteral/atualizar** dados na tabela, usamos o comando `UPDATE SET`, como no exemplo abaixo:

```postgresql
UPDATE aluno
SET nome = 'Nico',
    cpf = '10987654321',
    observacao = 'Teste',
    idade = 38,
    dinheiro = 15.23,
    altura = 1.90,
    ativo = FALSE,
    data_nascimento = '1980-01-15',
    hora_aula = '13:00:00',
    matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1;    
```

**Sempre usamos o `WHERE` para setar a condição que especifica quais dados serão atualizados**, pois caso não seja especificada uma condição, todos os registros da sua tabela serão atualizados. Também usamos vírgula para separar cada campo que será atualizado.

#### 03 - Excluindo registros na tabela

Para **apagar/deletar** registros na tabela, usamos o comando `DELETE`, como no exemplo abaixo:

```postgresql
DELETE FROM aluno 
WHERE nome = 'Nico';
```

**Sempre usamos o `WHERE` para setar a condição que especifica quais dados serão deletados**, pois caso não seja especificada uma condição, todos os registros da sua tabela serão deletados. 

## Aula 03 - Consultas com filtro ([arquivos](https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/11%20-%20PostgreSQL/03-Consultas-com-filtros/))

#### 00 - Objetivos

- A selecionar campos específicos da tabela
- Como definir um *alias* para os nomes dos campos
- A filtrar registros, utilizando o `WHERE`para campos do tipo de texto:
  - Operadores `=`, `!=`,`<>`, `LIKE` e `NOT LIKE`
  - A diferença entre `=` e `LIKE`
  - O funcionamento do caractere `%` no filtro com `LIKE` e `NOT LIKE`
  - O funcionamento do caractere `_` no filtro com `LIKE` e `NOT LIKE`
- Como filtrar utilizando `IS NULL` e `IS NOT NULL`
- Como filtrar registros para campos do tipos relacionados a números, datas e horas
  - `=`, `!=`, `<>`, `<`, `<=`, `>`, `>=`
  - `BETWEEN`
- Como filtrar registros para campos do tipo booleano
  - `=`, `!=`, `<>`
- Como funciona os operadores lógicos `AND` e `OR`

#### 01 - Selecionando colunas específicas da tabela

Para selecionar campos específicos da tabela, nós esplicitamos esses campos no `SELECT` da seguinte forma:

```postgresql
SELECT nome, idade, matriculado_em
FROM aluno;
```

Caso queriamos personalizar o nome da coluna, usamos a cláusula `AS`, como no exemplo:

```postgresql
SELECT nome AS "Nome do Aluno",
       idade,
       matriculado_em AS quando_se_matriculou
FROM aluno;
```

#### 02 - Filtrando registros de campos do tipo texto

Para usar filtros nas consultas, usamos a cláusula `WHERE`, como no exemplo abaixo:

```postgresql
SELECT *
FROM aluno
WHERE nome = 'Diogo';
```

##### Caracteres especiais

- **`_`** : Começaremos aprendendo o **`_`** *(underline)*, que significa "qualquer caractere naquela posição", ou seja, a posição que ele ocupa substitui um caractere. Para o exmplo abaixo, o filtro ignora o terceiro caractere entre o "**Di**" e o "**go**", ou seja, a tabela retornará tanto o "Diego", quanto o "Diogo". Em resumo, o **`_`** , que pode estar no começo, meio ou final de uma palavra, ocupa o espaço específico de um caractere, que será ignorado na busca.

  Outra forma de usarmos o **`_`** é com o comando `NOT LIKE`, ou seja, "não parece com".

  ```postgresql
  SELECT * 
  FROM aluno
  WHERE nome LIKE 'Di_go';
  ```

- **`%`** :  O caractere **`%`**  substitui todos os caracteres até o espaço que ele ocupa. Por exemplo, para recuperar todos os nomes que comecem com "**D**", usamos o comando:

  ```postgresql
  SELECT * 
  FROM aluno
  WHERE nome LIKE 'D%';
  ```

  Abaixo, vemos outro exemplo de uso  **`%`** , onde irá retornar todos os nomes com espaço em branco

  ```postgresql
  SELECT * 
  FROM aluno
  WHERE nome LIKE '% %';
  ```

  O **`%`** também pode ser usado entre textos, como `%i%a%`.

  ```postgresql
  SELECT * 
  FROM aluno
  WHERE nome LIKE '%i%a%';
  ```

  Esse comando apresenta os dados que tenham "**i\**", em alguma parte do texto, seguido por "**a**", em outra parte do texto.** 

#### 03 - Filtrando registros de campos do tipo numérico, data e booleano

- **`IS NULL`** e **`IS NOT NULL`**:  Esses operadores servem para todos os tipos de dados e retornam dados nulos e não nulos, respectivamente. Abaixo, é mostrado um exempo de uso no `IS NULL`:

  ```postgresql
  SELECT *
  FROM aluno
  WHERE cpf IS NULL;
  ```

- **`= `**  ,  **`!=  `**  ,  **`<>`**  ,  **`<`**  ,  **`> `**  ,  **`<=  `**  ,  **`>=`** : São os operadores de comparação para valores numéricos ou datas. Exemplo de uso:

  ```postgresql
  SELECT *
  FROM aluno
  WHERE idade = 35;
  ```

-  **`BETWEEN`** :  O operador  **`BETWEEN`** procura resultados entre dois valores declarados. Exemplo de uso:

  ```postgresql
  SELECT *
  FROM aluno
  WHERE idade BETWEEN 10 AND 20;
  ```

#### 04 - Filtrando utilizando operadores AND e OR

Os operadores `AND` e `OR` são usados quando queremos um filtro composto, ou seja, com 2 ou mais condições. 

O  `AND` é usado quando queremos retornar os registros que atendem a todas as condições. Já o  `OR` é usado quando queremos retornar os registros que atendem a uma ou mais condições.

Segue exemplo do uso do `AND`:

```postgresql
SELECT *
FROM aluno
WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL;
```

Segue exemplo do uso do `OR`:

```postgresql
SELECT *
FROM aluno
WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL;
```

## Aula 04 - Trabalhando com relacionamentos ([arquivos](https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/11%20-%20PostgreSQL/04-Trabalhando-com-relacionamentos/))

#### 00 - Objetivos

- Como funciona a chave primária
- Como funciona os campos que aceitam `NULL` e que não aceitam `NULL` (`NOT NULL`)
- Como funciona um campo `UNIQUE`
- Como criar uma chave primária
- Como funciona a chave estrangeira
- Como criar uma chave estrangeira
- Como criar consultas com relacionamentos:
  - `INNER JOIN`
  - `LEFT JOIN`
  - `RIGHT JOIN`
  - `FULL JOIN`
  - `CROSS JOIN`

#### 01 - Chave primária

A **chave primária** como "uma coluna, ou grupo de colunas, que pode ser usada para identificar uma linha da tabela". Dessa forma, **chave primária** deve ser um **valor unico** e **não nulo**.

Dessa forma, na criação de uma tabela, devemos escolher um campo que será a chave primária da tabela, usando a cláusula `PRIMARY KEY` na declaração da criação da tabela.

Exemplo de como setar uma chave primária:

```postgresql
CREATE TABLE curso (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);
```

#### 02 - Chave estrangeira

A chave estrangeira é "uma limitação para especificar que o valor de uma coluna (ou múltiplas colunas) precisa corresponder a alguma linha de outra tabela".

Dessa forma, as chaves estrangeiras são necessárias quando temos relação entre tabelas, ou seja, quando um dados em uma tabela faz referência ao dado de outra tabela.

Exemplo de uso da `FOREIGN KEY`:

```postgresql
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),
    FOREIGN KEY (aluno_id) REFERENCES aluno (id),
    FOREIGN KEY (curso_id) REFERENCES curso (id)
);
```

Nesse exemplo, criamos a tabela `aluno_curso` onde referenciamos as tabelas `aluno` e `curso` por meio de chaves estrangeiras com o comando `FOREIGN KEY (aluno_id) REFERENCES aluno (id) ` e `FOREIGN KEY (curso_id) REFERENCES curso (id)`.

E nesse caso temos uma chave primária composta com o comando `PRIMARY KEY (aluno_id, curso_id)`.

#### 03 - Consultas com relacionamentos

Para consultar os dados que estão em duas ou mais tabelas ao mesmo tempo, usamos o **`JOIN`**. 
O comando **`JOIN`** une os dados existentes na tabela "A" com os dados existentes na tabela "B". No exemplo abaixo buscamos pelos dados dos alunos que estão na tabela `aluno_curso`:

```postgresql
SELECT *
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
```

No exemplo abaixo, buscamos pelos alunos que estão cadastrados em algum curso.

```postgresql
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id
```

#### 04 - LEFT, RIGHT, CROSS e FULL JOINS

Comandos para juntar tabelas quando há informações faltando:

- **`LEFT JOIN`** : significa que existe um dado na tabela da esquerda, mas não existe na tabela da direita. Retorna todos os dados da tabela da esquerda e, para os dados faltantes da tabela da direita, retorna `NULL`.

- **`RIGHT JOIN`** : significa que existe um dado na tabela da direita, mas não existe na tabela da esquerda. Retorna todos os dados da tabela da direita e, para os dados faltantes da tabela da esquerda, retorna `NULL`.

  Exemplo de aplicação do `LEFT JOIN`:

  ```postgresql
  SELECT aluno.nome as "Nome do Aluno",
  	curso.nome as "Nome do Curso"
  FROM aluno
  LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  LEFT JOIN curso ON curso.id = aluno_curso.curso_id
  ```

- **`FULL JOIN`** : Irá considerar todos os dados, mesmo que o campo da direita ou o campo da esquerda esteja nulo. Retorna os dados das duas tabelas preenchendo os campos vazios com **`NULL`**:

  ```postgresql
  SELECT aluno.nome as "Nome do Aluno",
  	curso.nome as "Nome do Curso"
  FROM aluno
  FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  FULL JOIN curso ON curso.id = aluno_curso.curso_id
  ```

- **`CROSS JOIN`** : Combina os dados de todas as tabelas. Relaciona todos os dados da tabela "A" com todos os dados da tabela "B".

  ```postgresql
  SELECT aluno.nome as "Nome do Aluno",
      curso.nome as "Nome do Curso"
  FROM aluno
  CROSS JOIN curso
  ```

## Aula 05 - Usando CASCADE ([arquivos](https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/11%20-%20PostgreSQL/05-Usando-CASCADE/))

#### 00 - Objetivos

- Como funciona as restrições de chave estrangeira
- A diferença entre `RESTRICT` e `CASCADE`
- Como aplicar tipos diferentes de restrições de chave estrangeira no `DELETE`
  - `RESTRICT`
  - `CASCADE`
- A aplicar tipos diferentes de restrições de chave estrangeira no `UPDATE`
  - `RESTRICT`
  - `CASCADE`

#### 01 - DELETE CASCADE e UPDATE CASCADE

Quando criamos a nossa `FOREIGN KEY`, o padrão dela é o comando `ON DELETE RETRICT` e `ON DELETE RETRICT`, ou seja, a chave estrangeira restringe o apagamento e atualização de dados que estão em duas tabelas. Ao trocarmos para **`ON DELETE CASCADE`** e **`ON UPDATE CASCADE`** , **sempre que apagarmos ou atualizarmos um dado de um banco, o registro será apagado ou atualizado em todas as tabelas que o contém**, ou seja, quando apagarmos o dado do aluno, ele também será excluído do curso, e quando atualizamos um dados de um aluno, ele também será atualizado no curso.

O `CASCADE` é usado na declaração da chave estrangeira, como mostra o exemplo:

```postgresql
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),
    FOREIGN KEY (aluno_id) REFERENCES aluno (id)
    	ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES curso (id)
    	ON DELETE CASCADE
		ON UPDATE CASCADE
);
```

## Aula 06 - Avançando com consultas ([arquivos](https://github.com/Vinicius999/Desenvolve-2023-Trilha-Dados/blob/main/11%20-%20PostgreSQL/06-Avancando-com-consultas/))

#### 00 - Objetivos

- Como ordenar uma consulta
  - Ordenar utilizando os nomes de campo
  - Ordenar com mais de um campo
  - Ordenar por posição do campo
  - Ordenar por ordem Crescente e Decrescente
  - Ordenar com campos de tabelas diferentes
- Como limitar quantidade e paginar registros de consulta
  - `LIMIT`
  - `OFFSET`
- Como funcionam as funções de agregação
  - `COUNT`
  - `SUM`
  - `MAX`
  - `MIN`
  - `AVG`
- Como funciona a função de arredondamento `ROUND`
- Como funciona o agrupamento de dados
  - A diferença entre `DISTINCT` e `GROUP BY`
  - Onde utilizar o `DISTINCT`
  - Onde utilizar o `GROUP BY`
  - Como utilizar o `GROUP BY` com os nomes de campo
  - Como utilizar o `GROUP BY` por posição
- Como funcionam os filtros por funções de agrupamento, utilizando `HAVING`:
  - A diferença entre `WHERE` e `HAVING`
  - Como utilizar o `HAVING`

#### 01 - Ordenando as consultas

Para ordenas as consultas, usamos o **`ORDER BY`**. A seguir, vemos um exemplo de uso do `ORDER BY`:

```postgresql
SELECT * 
FROM funcionarios
ORDER BY nome;
```

Podemos também ordenar a consulta com base em mais de uma coluna. E podemos usar o nome da coluna ou ordem em que as colunas são declaradas no `SELECT`. Abaixo, ordenamos a consulta com base em 3 colunas, usando o `DESC` para ordenar de forma descendente:

```postgresql
SELECT *
FROM funcionarios
ORDER BY 4 DESC, nome DESC, 2
```

No caso de uma consulta com mais de uma tabela, tabém referenciamos o nome da tabela no `ORDER BY` para evitar ambiguidade:
```postgresql
SELECT 
    aluno.id as aluno_id,
    aluno.nome as "Nome do Aluno",
    curso.id as "curso_id",
    curso.nome as "Nome do Curso"
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id
ORDER BY curso.nome, aluno.nome
```

#### 02 - Limitando a consulta

Para limitar as consultas, usamos o **`LIMIT`**. A seguir, vemos um exemplo de uso do `LIMIT`, onde limitamos a consulta para os 5 primeiros registros:

```postgresql
SELECT *
FROM funcionarios
ORDER BY nome
LIMIT 5;
```

também podemos saltar registros, e para isso, usamos o **`OFFSET`**. A seguir, vemos um exemplo de uso do `OFFSET`, onde saltamos os 5 primeiros registros da consulta para:

```postgresql
SELECT *
FROM funcionarios
ORDER BY id
LIMIT 5
OFFSET 1;
```

#### 03 - Funções de agregação

Além de consultar os valores puramente como foram inseridos na tabela, podemos construir informações com métricas que resumem uma tabela. Isso pode ser feito com as **funções de agregações**. São exemplos de funções de agregação:

- `MAX`: a partir de um conjunto de valores é retornado o maior entre eles;
- `MIN`: analisa um grupo de valores e retorna o menor entre eles;
- `SUM`: calcula o somatório dos valores de um campo específico;
- `AVG`: realiza a média aritmética dos valores de uma determinada coluna; e
- `COUNT`: contabiliza a quantidade de linhas selecionadas.

Abaixo, é mostrado como usamos as gunções de agregação:

```postgresql
SELECT COUNT(id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND( AVG(id),0 )
FROM funcionarios;
```

#### 04 - Agrupando consultas

Usando o `GROUP BY` agrupamos os registros que serão **agregados** em grupos de valores permitindo que a **função de agregação** seja realizada para cada um desses grupos.

Exemplo de uso da função de agregação: 

```postgresql
SELECT
       nome,
       sobrenome,
       COUNT(*)
FROM funcionarios
GROUP BY nome, sobrenome
ORDER BY nome;
```

Um exemplo do uso de `GROUP BY` para consulta em multi tabela:

```postgresql
SELECT curso.nome
        COUNT(aluno.id)
FROM aluno
JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY 1
ORDER BY 1
```

#### 05 - Filtrando consultas agrupadas

Para realizar filtros, normalmente usamos o `WHERE`, mas caso queiramos realizar um filtro passando como parâmetro uma função de agregação, devemos usar um `HAVING`.

No exemplo abaixo, queremos selecionar os cursos que não tem nenhum aluno matriculado. Para isso, quremos filtrar o curso que tenha a contagem de alunos igual a zero:

```postgresql
SELECT *
FROM curso
LEFT JOIN aluno_curso ON aluno.curso_id = curso.id
LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
GROUP BY 1
HAVING COUNT(aluno.id) = 0
```

No outro exemplo, queremos consultar os nomes dos funcionários que aparecem mais de uma vez:

```postgresql
SELECT nome,
       COUNT(id)
FROM funcionarios
GROUP BY nome
HAVING COUNT(id) > 1;
```

