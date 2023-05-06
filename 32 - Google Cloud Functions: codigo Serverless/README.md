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

## Aula 05 - Mais Triggers

comandos relacionado ao *PubSub*:

- Para listar os tópicos existentes:
  - `gcloud pubsub topics list`
- Para criar um tópico pelo CLI:
  - `gcloud pubsub topics create NOME_TOPICO`
- Para listar todas as funções publicadas:
  - `glcoud functions list`
- Para publicar uma mensagem no tópico:
- `gcloud pubsub topics publish NOME_TOPICO --message "MENSAGEM AQUI"`

Além disso, falamos sobre o agendamento de execução de uma função. Para tal usamos o serviço *Cloud Scheduler* que na verdade envia uma mensagem para um tópico e assim é chamada uma função.

##### Passo a passo:

1) Crie uma nova função pela interface ou console, seguem os dados:

- Nome: `PubSub`
- Trigger: `Cloud Pub/Sub`
- Tópico: `notificacao_pubsub`

O código da função fica como (no arquivo `main.py`):

```python
import base64

def notificacao_pubsub(event, context):
    """Triggered from a message on a Cloud Pub/Sub topic.
    Args:
         event (dict): Event payload.
         context (google.cloud.functions.Context): Metadata for the event.
    """
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    if pubsub_message == 'ALARME':
        print('Alarme Ativado!')
    else:
        print('Alarme Desativado.')COPIAR CÓDIGO
```

Caso queira publicar pelo CLI, segue o comando:

```css
gcloud functions deploy notificacao_pubsub --runtime python37 --trigger-topic notificacao_pubsubCOPIAR CÓDIGO
```

2) Para enviar a mensagem use o comando:

```bash
gcloud pubsub topics publish notificacao_pubsub --message "ALARME"`COPIAR CÓDIGO
```

Verifique os logs da função para ver se a notificação funcionou.

3) Para testar o agendamento crie mais uma nova função com o código abaixo:

```python
#arquivo main.py
import base64

def backup_diario(event, context):
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    if pubsub_message == 'START':
        print('Backup Iniciado')
        #
        # código para realizar backups
        #
    else:
        print('O backup não foi iniciado')COPIAR CÓDIGO
```

4) Depois disso execute os comandos de deploy do tópico e da função no terminal:

```css
gcloud pubsub topics create backup_prod

gcloud functions deploy backup_diario --runtime python37 --trigger-topic backup_prodCOPIAR CÓDIGO
```

5) Use o serviço *Cloud Scheduler* para agendar o envio da mensagem para o tópico:

- Nome: `agendamento_backup`
- Frequência: `*/1 * * * *`
- Target e Tópico: `PubSub` e `backup_prod`
- Payload: `START`

6) Espere um minuto e verifique os logs da função `backup_diario`.

## Aula 06 - 

- como deployar uma função a partir de um bucket

  ```bash
  gcloud functions deploy nome_funcao --source gs://seu_bucket/seu_zip_com_codigo.zip --trigger-bucket=seu_bucket --runtime python37COPIAR CÓDIGO
  ```

- como filtrar os logs

- como ativar uma biblioteca

##### Passo a passo

1) Pela interface do *Google Cloud Platform* procure a biblioteca `vision` e clique nela para ativação.

2) No serviço *Google Cloud Storage* crie um novo bucket, por exemplo `seu_bucket_imageanalysis`

3) No terminal do seu computador use GIT para clonar o repositório.

Obs: *Você também pode baixar o ZIP com o código já modificado [pronto](https://caelum-online-public.s3.amazonaws.com/1189-gcf/06/imageanalysis.zip).*

Seguem o comando para clonar:

```bash
git clone https://github.com/GoogleCloudPlatform/python-docs-samples.gitCOPIAR CÓDIGO
```

4) Agora navegue para a pasta do projeto:

```bash
cd python-docs-samples/functions/imagemagickCOPIAR CÓDIGO
```

E abre o arquivo `main.py` no seu editor de código.

Na função `blur_offensive_images` altere o nivel/nota para `2`:

```yaml
if detected.adult == 2 or detected.violence == 2:COPIAR CÓDIGO
```

Por fim, gere um ZIP `imageanalysis.zip` com o arquivo `main.py`.

*Novamente, você pode baixar o ZIP já [pronto](https://caelum-online-public.s3.amazonaws.com/1189-gcf/06/imageanalysis.zip).*

5) Faço o upload do ZIP para seu seu bucket criado nessa aula:

```bash
gsutil cp imageanalysis.zip gs://seu_bucket_imageanalysisCOPIAR CÓDIGO
```

6) Faça o deploy da função a partir do ZIP (que já está no bucket):

```bash
gcloud functions deploy blur_offensive_images --source gs://seu_bucket_imageanalysis/imageanalysis.zip --trigger-bucket=SEU_NOME_DO_BUCKET_COM_AS_IMAGENS --runtime python37COPIAR CÓDIGO
```

Fique atento ao console para ver se o deploy funcionou.

7) Procure algumas imagens do seu critério na web e faça o upload para o bucket das imagens e coloque numa pasta. Entre nessa pasta pelo terminal e faça o upload:

```bash
gsutil -m cp * gs://SEU_NOME_DO_BUCKET_COM_AS_IMAGENSCOPIAR CÓDIGO
```

8) Verifique o log da função para descobrir como a imagem foi avaliada.

Você também pode listar os arquivos no bucket das imagens:

```bash
gsutil ls  gs://SEU_NOME_DO_BUCKET_COM_AS_IMAGENSCOPIAR CÓDIGO
```