 

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
## Aula 04 - Criação de OLAPs
- Criar uma base OLAP baseada em uma ou mais tabelas de fato do Data Warehouse.
- Criar indicadores calculados.
## Aula 05 - Desnormalização base de dados
- Que temos que ter cuidado quando cruzamos indicadores que não cruzam com as mesmas dimensões.
- Que, para resolver este problema, devemos ratear os indicadores usando um único critério.
- Como criamos uma consulta nomeada baseado em um comando SQL e como transformá-la em um OLAP.
## Aula 06 - Carga Final
- A fazer a carga do OLAP pelo Integration Services
- A carregar os OLAPs após a atualização das fatos do Data Warehouse.