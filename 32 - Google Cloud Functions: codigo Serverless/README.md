# Google Cloud Functions: código Serverless

## Aula 01 - Trabalhando sem servidor
Google Cloud Functions:
- Não necessitam um provisionamento explicito de servidores na nuvem;
- Escalem e fazem fail-over automaticamente;
- Para interagir com os serviços de nuvem devemos instalar o GCloud SDK;
- Não tem um custo fixo antecipado;

Passos realizados:
- Criar o projeto na Google Cloud (Precisa ter a conta antes)
- Instalar e atualizar o GCloud SDK (`gcloud components update`)
- Vincular o projeto com o cliente na linha de comando (`gcloud init`)

## Aula 02 - Deploy e Testes
- Existem vários triggers para disparar a execução uma função:
    - Um trigger pode ser uma chamada HTTP ou evento em outros serviços;
- O comando do deploy é gcloud functions deploy NomeDaFuncao --runtime NomeRuntime --trigger-http:
    - O comando usa o arquivo index.js (no caso do NodeJs Runtime);
- Todas as informações (URL, Trigger, Logs) podem ser acessados no dashboard do projeto;
- A URL e composta da região, id do projeto e nome da função;

## Aula 03 - Background Functions

- Funções normalmente fazem parte de uma aplicação maior
- Funções do tipo *background* podem se integrar com outros serviços da *Google Cloud Platform*
- Funções podem ser "deployado" pelo SDK ou pela interface gráfica
- Existem vários triggers para acionar a execução como Pub/Sub ou Cloud Storage
  - Cada trigger tem alguns eventos associado
- Existem Logs que mostram a saída de execução das funções

## Aula 04 - Dimensionando os recursos

- Os recursos importantes, como tempo de execução e a memória, pode ser configurados e alteradas
- Cada alteração da função gera uma nova versão e novo deploy
- Uma função pode ser encerrado pelo sucesso, erro ou timeout
- Nos logs encontramos vários infos úteis como tempo de execução, data, hora, nome, plataforma, versão etc
- Nos logs podemos filtrar pelas funções
- No CLI usamos o comando `gcloud functions logs`:
  - `gcloud functions logs read` (os últimos 20 eventos)
  - `gcloud functions logs read helloGET`
  - `gcloud functions logs read info-storage --limit=100`
- Para receber mais detalhes sobre uma função: `gcloud functions describe info-storage`
- Os logs também podem ser baixados pela interface

## Aula 05 - 