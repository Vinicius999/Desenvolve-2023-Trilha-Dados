 

# OLAP com SQL Server: construção do Data Warehouse

## Aula 01 - Apresentação e Configuração

- Onde se aplica este treinamento;
- Como configurar o ambiente de trabalho caso sua máquina esteja limpa;
- A carregar o Data Warehouse para 3 anos de dados;
- A mudar o usuário padrão que gerencia o serviço do Analysis Services.

## Aula 02 - Configurando DW e criando primeiras dimensões
- Acessar o Analysis Services pelo SQL Management Studio;
- Criar um novo projeto de Analysis Services;
- Configurar uma exibição de dados e a importância de colocar nomes amigáveis para as entidades;
- Criar uma dimensão baseada em uma única tabela;
- Criar hierarquias e navegar por elas;
- Processar o modelo para que ele seja criado e refletido no servidor OLAP no Analysis Services.

## Aula 03 - Snow Flake, Tempo e Pai-Filho

- Criar uma dimensão usando mais de uma tabela como fonte (Modelo Snow Flake);
- Montar uma dimensão irregular no Analysis Services e os cuidados que temos que tomar para não apresentar membros repetidos;
- Criar uma dimensão tempo, como associar a inteligência de negócio à dimensão (Business Intelligence) e finalmente os cuidados para que os identificadores de tempo sejam mostrados na navegação da dimensão por sua ordem correta.
