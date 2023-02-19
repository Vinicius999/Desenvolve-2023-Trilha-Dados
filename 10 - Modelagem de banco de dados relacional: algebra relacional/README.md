# 09 - Modelagem de banco de dadsos realacional: normalização

## Aula 01 - Apresentação

#### 00 - Objetivos

- Compreender a importância da Álgebra Relacional;
- Instalar a ferramenta Relational;
- Importar a base de dados no Relational.

#### 1 - **Álgebra Relacional e sua importância**

**Álgebra relacional** é uma forma teórica de manipular os dados em bancos de dados relacionais. E ela oferece um suporte para operações dentro de bancos de dados relacionais e serve de base para o SQL. Em outras palavras, o SQL é derivado da álgebra relacional.

Ela pode ser dividida em 2 partes:

- **Teoria dos conjuntos**
  - **União**, **Interseção**, **Diferença** e **Produto Cartesiano**.
- **Operações específicas para bancos de dados relacionais**
  - **Seleção**, **Projeção** e **Junção**.

#### 2 - Ferramenta: Relational

Link para download da ferramenta: [Relational](https://ltworf.github.io/relational/)

## Aula 02 - Seleção e Projeção

#### 00 - Objetivos

- Diferenciar os conceitos da Seleção e Projeção;
- Colocar em prática os conceitos da Seleção e Projeção;
- Conhecer a origem da Álgebra Relacional.

#### 01 - Seleção

A **seleção** seleciona algumas **linhas** e remove outras. A seleção não traz tuplas repetidas.

Sintaxe da **fórmula da operação de seleção**:

```sql
σ <condicao_selecao>(R)
```

O símbolo sigma `σ` é usado para representar a seleção. A `<condicao_selecao>` é onde colocaremos a condição para que as tuplas sejam retornadas. Já o `(R)` é onde informaremos a tabela em que buscaremos a condição de seleção.

Como exemplo de seleção, temos:

```sql
 σ nome_livro == 'Percy Jackson e o Ladrao de Raios' or nome_livro == 'Sangue de Lobo' (livros)
```

Para as condições, podemos usar os seguintes operadores:

`>`,  `<` ,  `>=` ,  `<=` ,  `=` ,  `!=`

#### 02 - Projeção

A **projeção** seleciona algumas **colunas** e remove outras. A projeção não traz tuplas repetidas.

Sintaxe da **fórmula da operação de projeção**:

```sql
π <lista_atributos> (R)
```

Como exemplo de projeção, temos:

```sql
π nome_livro, preco, qtd_estoque (livros)
```

#### 03 - Consulta com Seleção e Projeção

Exemplo de seleção dentro da projeção para encontrar a quantidade de estoque maior ou igual a cinco.

```sql
π nome_livro, qtd_estoque (σ qtd_estoque >= 5 (livros))
```

## Aula 03 - União, Interseção e Diferença

#### 00 - Objetivos

- Aplicar as funções **União**, **Interseção** e **Diferença entre conjuntos** no Relational.

#### 01 - União

A operação de **união** é a junção de duas relações, independentemente do que esteja na relação 1 e na relação 2.

Como exemplo de união, temos a união dos nomes dos livros das tabelas `livros` e `livros_novo`:

```sql
 π nome_livro (livros) U π nome_livro (livros_novo)
```

#### 02 - Interseção

A operação **interseção**, que faz uma união, com a diferença que ela trará todas as tuplas que existem na relação R e na relação S ao mesmo tempo. 

Como exemplo de união, atribuiremos a consulta de união feita anteriormente a uma variável temporária chamada `livros_estoque`:

```
livros_estoque = π nome_livro (livros) ∪ π nome_livro (livros_novo)
```

E faremos a interseção entre `livros_estoque` e a projeção `π nome_livro (vendas)`

```sql
livros_estoque ∩ π nome_livro (vendas)
```

#### 03 - **Diferença de conjuntos**

A **diferença de conjuntos** nos permite encontrar tuplas que estão em uma relação, mas não em outra.

Como exemplo de diferença de conjuntos, também usamos a variável temporária `livros_estoque`.

```sql
livros_estoque - π nome_livro (vendas)
```

Assim, teremos os livros do esqque não estão na tabela de `vendas`.

#### 04 - Consulta composta

**Objetivo:** Trazer o nome e o preço dos livros que tenham o valor maior ou igual a 30,00 reais na base de dados.

Podemos realizar primeiro a seleção do preço e inserir a projeção trazendo os campos solicitados:

```sql
maior_30 = σ preco >= 30 (π nome_livro, preco (livros))
```

E por fim, a união com os livros novos:

```scss
maior_30 = σ preco >= 30 (π nome_livro, preco (livros) ∪ π nome_livro, preco(livros_novos))
```

## Aula 04 - Produto Cartesiano e Junção

#### 00 - Objetivos

- Implementar Produto Cartesiano;
- Diferenciar, Junção; Junção esquerda e direita; e Junção total.

#### 01 - Produto Cartesiano

O **produto cartesiano** é representado pela letra "X" que é o símbolo da multiplicação. Faz sentido, se pensarmos que ele realiza combinações possíveis das tuplas, isto é, pega uma tupla e multiplica por outra. O resultado do produto cartesiano, entre as relações R e S, é de quatro tuplas.

Como exemplo de produto cartesiano, temos:

```sql
vendedores * vendas
```

#### 02 - Junção

A **junção **é representada pelo símbolo da gravata borboleta, **⋈**. Ela realiza um produto cartesiano, depois uma seleção das tuplas de interesse e, por fim, uma projeção, para remoção das colunas duplicadas.

Como exemplo de junção, temos:

```sql
vendedores ⋈ vendas
```

#### 05 -  Junção esquerda e direita

A **junção à esquerda** pega todas as tuplas da entidade à esquerda que não encontraram par entre as tuplas da entidade à direita e adiciona, desta maneira, valores nulos nas tuplas da entidade da tabela à direita. Também adiciona o resultado. Ou seja, a junção esquerda traz todas as tuplas da entidade à esquerda no resultado.

Como exemplo da junção à esquerda, temos:

```sql
livros_estoque ⧑ vendas_novo
```

A **junção à direita** é basicamente a mesma coisa que a junção à esquerda. A diferença é que ela priorizará as tuplas da tabela à direita, isto é, trará todas as tuplas da tabela à direita e complementará com nulo as tuplas da tabela à esquerda se não tiverem dados. Nós usaremos essa mesma consulta e trocaremos apenas o símbolo de gravata para a junção direita.

Como exemplo da junção à direita, temos:

```sql
livros_estoque ⧒ vendas_novo
```

A **junção total** é representada pelo símbolo ⧓ e faz ambas as operações. Preenche as tuplas da entidade da esquerda que não encontram par na entidade da direita, assim como também preenche as tuplas da entidade da direita que não encontraram par na entidade da esquerda, adicionando-as ao resultado da junção. Ou seja, a junção total é a junção esquerda e direita juntas.

Como exemplo de junção total, temos:

```scss
π id_pedido, nome_livro (livros_estoque ⧓ vendas_novo)
```

## Aula 05 - Outras consultas

#### 00 - Objetivos

- Elaborar funções com atribuição;
- Utilizar a opção renomear.

#### 01 - Atribuição

A **atribuição** é utilizada para designar a consulta a uma variável temporária. As variáveis temporárias ajudam na compreensão das consultas, fazendo-as parecer uma programação sequencial.

Exemplos de atribuição e variáveis temporárias para facilitar a compreensão de uma consulta complexa:

A consulta de união está atribuída como R.

```scss
R =  π nome_livro(livros) U  π nome_livro(livros_novo)
```

Como S, nós atribuiremos o `nome_livro` na tabela de vendas.

```scss
S =  π nome_livro (vendas)
```

Então, faremos R diferença S.

```scss
R - S
```

#### 02 - Renomear

A operação **renomear** nos permite alterar nomes de atributos de uma relação. 

Exemplo da aplicação da operaçao renomear:
```scss
ρ autor ➡ autor_livro (livros_estoque)
```

Exemplo de como renomear mais de uma coluna e salvar a alteração:

```scss
livros_estoque = ρ nome_livro ➡ nome_do_livro, qtd_estoque ➡ quantidade_estoque (livros_estoque) 
```

#### 03 - Desafio - Consulta complexa

**Objetivo:** Recuperar o nome do vendedor, a quantidade vendida, nome e preço dos livros que tiveram vendas menores que oito e depois renomear os campos do resultado final.

1. Unir as duas tabelas de livros. Essa ação é necessária para podermos ter todos os livros cadastrados.

   ```scss
   livros_estoque = livros ∪ livros_novo
   ```

2. Depois disso, juntamos a relação de livros com vendas para encontrarmos os livros vendidos.

   ```scss
   livros_venda = livros_estoque ⋈ vendas_novo
   ```

3. Realizamos a mesma ação com as informações de vendedores.

   ```scss
   vendas_vendedores = vendas_novo ⋈ vendedores
   ```

4. Depois desses passos, podemos obter o resultado final incluindo a seguinte fórmula no Relational:

   ```scss
   resultado = σ qtd_vendida < 8 (π nome, qtd_vendida, nome_livro, preco (livros_venda ⋈ vendas_vendedores))
   ```

   
