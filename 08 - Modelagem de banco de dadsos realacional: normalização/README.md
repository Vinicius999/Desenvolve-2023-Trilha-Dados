 

# 08 - Modelagem de banco de dadsos realacional: normalização

### Aula 01 - Normalizacao de dados

#### 00 - Objetivos

- Diferenciar relacionamentos identificadores e não identificadores;
- Representar a cardinalidade dos relacionamentos;
- Diferenciar a representação do modelo físico de acordo com o software utilizado;
- Construir um modelo físico.

#### 1 - Diretrizes informais

- Semântica clara com esquemas fáceis de explicar
- Evitar informações redundantes
- Evitar possibilidade de valores NULL nas tuplas
- Evitar o surgimento de tuplas falsas

#### 2 - Anomalias

Anomalias são inconsistências nos dados. Há 3 tipos de anomalias:

- **Anomalia de remoção**: causa a perda de informação associada a um dado registro.

- **Anomalia de inserção**: causa a repetição desnecessária de dados (redundância).

- **Anomalia de alteração**: leva a inconsistência e aumenta o esforço para a atualização dos dados.

### Aula 02 - Dependencias, 1FN e 2FN

#### 00 - Objetivos

- Saber como funciona o processo de normalização;
- Compreender o que é uma Dependência funcional;
- Conhecer a primeira forma normal;
- Reconhecer e distinguir o que é uma Dependência funcional parcial e total;
- Entender e aplicar a segunda forma normal.

#### 1 - Dependências Funcionais e **Primeira Forma Normal - 1FN**

- **Dependências Funcionais**: são restrições aplicadas sobre os atributos da tabela. Ou seja, quando um atributo depende de outro para que a sua existência faça sentido. A dependência funcional estabelece uma relação de atributos na tabela, por exemplo, a chave primária, que é ID, e define outra coluna na tabela.

  Um atributo que determina o valor é chamado de **determinante**, no caso, é o CPF. O outro atributo é chamado de **dependente**. A dependência funcional é representada pelo **hífen** (**`-`**) e o sinal de **maior** (**`>`**).

  ```
  CPF -> nome
  ```

Na **Primeira Forma Normal** não pode existir mais de um assunto em uma mesma tabela, como também não admite repetições ou campos que possuem mais que um valor.

Para aplicar a **1FN**, devemos:

1. **Evitar a mistura de assuntos dentro de uma tabela**, porque isso pode causar **repetições ou campos que tenham mais de um valor**, gerando redundância dos dados.

2. **Identificar a chave primária** da tabela, o **grupo repetitivo** e **removê-lo** da tabela.
3. **Criar uma tabela nova com esse grupo repetitivo** e usar a chave primária da tabela que está sendo quebrada como chave estrangeira dentro da tabela nova com o grupo repetitivo.

#### 2 - Dependências Funcional parcial, Funcional total e Segunda Froma Normal - 2FN

- **Dependência funcional total**: um atributo ou um conjunto de atributos depende de forma completa ou total da chave primária composta.
- **Dependência funcional parcial**: os atributos não-chave não dependem funcionalmente de toda a chave primária quando esta for composta.

Na **Segunda Froma Normal** a tabela tem que estar na primeira forma normal e os atributos na tabela, **que não são chaves**, dependem da chave primária em sua totalidade e não apenas parte dela.

Para aplicar a **2FN**, devemos:

1. Identificar se a tabela tem **chave primária composta**.

2. Distinguir os **atributos que dependem parcialmente da chave primária** e criar uma nova tabela com eles.

#### 3 - Formas normais e suas dependências

A **primeira forma normal** deve satisfazer as propriedades baseadas na **dependência funcional.**

A **segunda forma normal** deve satisfazer as propriedades baseadas na **dependência funcional parcial.**

A **terceira forma normal** deve satisfazer as propriedades baseadas na **dependência transitiva.**

A **forma normal de Boyce-Codd** deve satisfazer as propriedades baseadas na **dependência funcional trivial.**

A **quarta forma normal** deve satisfazer as propriedades baseadas na **dependência Multivalorada**.

A **quinta forma normal** deve satisfazer as propriedades baseadas na **dependência junção**.

### Aula 03 - Terceira Forma Normal e Boyce-Codd

