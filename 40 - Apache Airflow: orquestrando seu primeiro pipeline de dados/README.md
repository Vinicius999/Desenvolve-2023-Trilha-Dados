# Apache Airflow: orquestrando seu primeiro pipeline de dados

## Aula 01 - Pipeline de dados

Nessa aula, você aprendeu:

- Utilizar uma API com dados climáticos;

- Extrair dados da previsão do tempo;

- Criar uma pasta utilizando Python;

- Salvar os arquivos extraídos em csv.

## Aula 02 - Conhecendo o Airflow

Nessa aula, você aprendeu:

- Conceituar o Airflow;
- Diferenciar DAGs, Tasks e Operators;
- Listar quais são os principais componentes do Airflow;
- Explicar como é a arquitetura do Airflow.

**Apache Airflow** é um orquestrador de fluxos, ou seja, **com ele você é capaz de decidir em qual momento e em quais condições algum programa seu irá rodar**. Ele é um sistema de gerenciamento de fluxo de trabalho de código aberto (open source) projetado para criar, agendar e monitorar, de forma programática, pipelines de dados e fluxos de trabalho.

Principais conceitos do Apache Airflow:

- **DAG** é basicamente um fluxo de trabalho, um pipeline de dados definido em Python que trata-se de um conjunto de instruções que precisam ser executadas em uma determinada ordem. Ao definirmos um *data pipeline* no *Airflow*, este passa a ser um DAG.

- **Task** ("tarefa" em português) é a unidade mais básica de um DAG e é utilizada para implementar uma determinada lógica no pipeline. Podemos afirmar, portanto, que um DAG também é um conjunto de tasks onde cada uma dessas tarefas corresponde a uma etapa que precisa ser realizada no pipeline de dados.

- **DAG run**, ou "execução de DAG" em português, como o próprio nome sugere, trata-se da execução propriamente dita de um DAG no tempo. Este DAG run inclui algumas informações sobre a execução do DAG, entra elas podemos citar o horário e tempo de execução de cada tarefa. Em suma, trata-se da instância de um DAG no tempo.

- **Task instanece**, ou "instância de tarefa" em português, é a execução de uma tarefa em um ponto específico do DAG. Além disso, quando trabalhamos com DAGs, interagimos principalmente com **operators** (operadores), que são os blocos de construção de um DAG. Esses operators contêm a lógica de como os dados são processados em um *data pipeline* e cada tarefa é definida justamente pela instanciação de um operador.

Principais componentes do Apache Airflow:

- **Webserver**: apresenta uma interface de usuário que nos permite inspecionar, acionar e acompanhar o comportamento dos DAGs e suas tarefas;
- **Pasta de arquivos DAG**: armazena os arquivos DAGs criados. Ela é lida pelo agendador e executor;
- **Scheduler** (agendador): lida com o acionamento dos fluxos de trabalho (DAGs) agendados e o envio de tarefas para o executor;
- **Banco de dados**: usado pelo agendador, executor e webserver para armazenar os metadados e status do DAG e suas tarefas;
- **Executor**: lida com as tarefas em execução. O Airflow possui vários executores, mas apenas um é utilizado por vez.

![Alt text: Esquema da arquitetura do Airflow. Nele temos a representação com ícone e texto dos seguintes componentes: “usuário”, “pasta com DAGs”, “Web Server”, “Scheduler”, “Banco de dados” e “Executor”, da esquerda para a direita. Do “usuário” partem duas setas, sendo uma para a “pasta com DAGs” e outra para o “Web Server”. Da “pasta com DAGs” partem três setas, sendo uma para o “Scheduler”, outra para o banco de dados e outra para o “Web Server”. Do “banco de dados”, parte um seta para o executor. Ainda na esquema, há duas setas duplas: uma entre o “Scheduler” e o “banco de dados”; e outra entre o “web server” e o “banco de dados”.](https://caelum-online-public.s3.amazonaws.com/2665-arquitetura-airflow/02/Aula2-img1.png)



 