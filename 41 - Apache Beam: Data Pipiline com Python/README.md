# Apache Beam: Data Pipeline com Python

## Aula 01 - Data Pipeline
**Nessa aula, você aprendeu:**
- Sobre Engenharia de Dados e suas principais atividades;
- A importância da paralelização de processos dentro da Engenharia de Dados;
- Como criar o ambiente virtual para instalarmos as dependências necessárias ao projeto;
- O que é o Apache Beam, como instalá-lo nas dependências do projeto e iniciar a escrita do código;
- A avaliar os dados brutos que serão transformados e de que forma tratá-los, dentro dos processos.

## Aula 02 - Pipeline e transformações
**Nessa aula, você aprendeu:**
- Como o Apache Beam auxilia no desenvolvimento de aplicações para serem executadas em paralelismo.
- A criar a estrutura para definir as etapas de uma pipeline criando nossa pcollection.
- A realizar a leitura de arquivos do tipo texto utilizando o `ReadFromText` da SDK do Apache Beam.
- A criar métodos que tratam etapas específicas de transformações.
- A utilizar o MAP para executar transformações nos dados lidos.
- Aplicar funções específicas do Python e de strings no nosso processo de transformação do dado.

## Aula 03 - Dados de dengue

- Utilizar os métodos dict e zip do Python.
- Criar um dicionário a partir de duas listas.
- Agrupar elementos por uma chave utilizando o GroupByKey do Apache Beam.
- Manipular strings utilizando um conjunto de lista com método `join()`.

## Aula 04 - Dados de chuvas

- Descompactar elementos de uma tupla para tratá-los de forma separada.
- Utilizar o FlatMap do Apache Beam.
- Diferença entre o FlatMap e o Map.
- Implementar combinadores com o CombinePerKey do Apache Beam.

## Aula 05 - Agrupando e retornando tupla

- Reutilizar métodos criados utilizados em outras etapas da pipeline.
- Utilizar o ferramental da linguagem Python para criar transformações dentro do Apache Beam.
- Desenvolver pipelines com resultados na mesma estrutura para convergirem.

## Aula 06 - Analisando e juntando pcollections

- Unir o resultado de pipelines diferentes.
- Empilhar pcollections para processar o resultado de diferentes processos.
- Agrupar pcollections por chave e processar seus dados.
- Utilizar filtros para remover dados do processo de acordo com a regra estabelecida.

## Aula 07 - Persistência dos resultados

- Descompactar elementos de strings e dicionários para prepará-los para persistência em arquivo `csv`.

- Pegar uma lista, transformar em uma string com delimitador no formato do arquivo `csv`, onde persistimos o resultado do processo.

- Utilizar o `WriteToText` para persistir nosso resultado em um arquivo de texto do tipo `csv`.

- Analisar nossos resultados em um Jupyter Notebook com o módulo Pandas do Python.

  
