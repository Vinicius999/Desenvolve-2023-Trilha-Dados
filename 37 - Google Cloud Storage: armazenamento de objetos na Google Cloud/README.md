# Google Cloud Storage: armazenamento de objetos na Google Cloud

## Resumo do curso

- Aprenda a gerenciar buckets
- Entenda o versionamento e as permissões
- Publique o site estático
- Utilize o SDK para operar os buckets
- Especifique regras para o ciclo de vida dos objetos
- Compreenda os benefícios do Cloud Storage
- Saiba como transferir dados entre AWS e Cloud Storage

## Aula 01 - O primeiro bucket

- Como criar um *bucket*
- Como subir um arquivo no bucket
  - Como editar as permissões desse arquivo
- Como instalar e configurar o **Google Cloud SDK**

## Aula 02 - Criando um site estático

- Como registrar um domínio no **Freenom**
- Como criar registros no seu domínio
- Como configurar o seu domínio na **Webmaster Central** da Google
- Como criar um *bucket*, copiar arquivos para dentro dele e configurar suas permissões através do console
- Como configure o *bucket* para ele se comportar como um site
- Como alterar localmente o site e enviar as alterações para o *bucket*

#### Passo a passo

- Caso você ainda não tenha um domínio, pode registrar um no [**Freenom**](https://www.freenom.com/pt/index.html)

- No seu domínio, crie um registro do tipo **CNAME**, com nome **www** e apontando para **c.storage.googleapis.com**

- Acesse a **Webmaster Central** da Google

  - Clique em *Add Property*, insira o seu domínio e clique em *Continue*
  - Na aba *Alternate methods*, selecione *Domain name provider* e *Other* em seguida (caso seu domínio esteja registrado no **Freenom**. Copie o texto que será exibido

- Volte ao **Freenom** e, no seu domínio, crie um registro do tipo **TXT**, apontando para o texto copiado acima

- Volte à **Webmaster Central** da Google e clique em *Verify*

- Através do console, criar um bucket que vai se referenciar ao seu site, por exemplo:

  ```bash
  gsutil mb gs://www.rmerceslabs.tk
  ```

- Em seguida, copie os arquivos do site (caso você não tenha baixado, baixe-o [aqui](https://caelum-online-public.s3.amazonaws.com/1046-google-cloud-storage/02/site.zip)) para dentro do bucket, por exemplo:

  ```bash
  gsutil -m cp -R * gs://www.rmerceslabs.tk 
  ```

- Adicione a permissão de leitura para o bucket e todos os seus arquivos:

  ```bash
  gsutil acl ch -R -u AllUsers:R gs://www.rmerceslabs.tk 
  ```

- Configure o bucket para ele se comportar como um site, dizendo qual é a página inicial e a de erro:

  ```bash
  gsutil web set -m index.html -e 404.html gs://www.rmerceslabs.tk 
  ```

- Caso você faça alguma mudança no site, pode enviar as alterações para o bucket com o seguinte comando:

  ```bash
  gsutil -m rsync . gs://www.rmerceslabs.tk 
  ```

## Aula 03 - Ajustando as permissões

- Como configurar, no bucket, a permissão de um membro, grupo ou domínio
  - Através da **Google Cloud Platform** e da CLI
- Como testar o premissionamento dos membros

#### Passo a passo

- Criar três *buckets*, para representar três empresas
- Na Google Cloud Platform, em Browser, no bucket da primeira empresa, configure um membro como *Storage Object Admin e outro membro como*Storage Object Viewer*
  - Em seguida, teste o premissionamento desses membros
- Através do console, no bucket da segunda empresa, configure um membro como *Storage Object Admin* e outro membro como *Storage Object Viewer*
  - Em seguida, teste o premissionamento desses membros
- Através do console, no bucket da terceira empresa, configure um grupo do Google Groups como *Storage Object Viewer*
  - Em seguida, teste o premissionamento dos membros do grupo

## Aula 04 - Ciclo de vida dos objetos

- Como criar um *bucket* em uma determinada região
- Como configurar o ciclo de vida dos objetos de um *bucket*
- Como arquivar objetos de um *bucket*, após um determinado período de dias, alterando a sua classe de armazenamento

#### Passo a passo

- Através do console, crie um novo bucket, na região **us-east1**, por exemplo:

  ```cpp
  gsutil mb -l us-east1 gs://004-ula
  ```

- Configure o ciclo de vida dos objetos desse *bucket*, para que eles sejam deletados após 100 dias

- Através da Google Cloud Platform, configure o ciclo de vida dos objetos de um dos buckets criados na aula passada

  - Arquive objetos com 180 dias ou mais, ou seja, após esse período, a classe de armazenamento dele deve ser a **Nearline**

## Aula 05 - Entendendo o versionamento

- Como habilitar o versionamento de um *bucket*
- Como visualizar os objetos, e suas versões, de um *bucket*
- Como restaurar uma versão antiga de um objeto
- Como arquivar objetos, que já estejam versionados, de um *bucket*, após um determinado período de dias, alterando a sua classe de armazenamento

#### Passo a passo

- Copie algum arquivo para dentro de um *bucket*

- Habilite o versionamento para o bucket utilizado acima, por exemplo:

  ```csharp
  gsutil versioning set on gs://001-spacexCOPIAR CÓDIGO
  ```

- Copie novamente o mesmo arquivo para o mesmo bucket, e repare que haverá dois arquivos de mesmo nome, mas com versões diferentes, executando o seguinte comando, por exemplo:

  ```bash
  gsutil ls -a gs://001-spacexCOPIAR CÓDIGO
  ```

- Você pode restaurar alguma versão antiga de um arquivo, copiando-o, juntamente com o seu identificador, para o próprio bucket, por exemplo:

  ```bash
  gsutil cp gs://001-spacex/arquivo.png#1548267325488499 gs://001-spacex/arquivo.pngCOPIAR CÓDIGO
  ```

- Para o *bucket* utilizado anteriormente, crie uma nova regra, para que objetos com 90 dias, que já estejam versionados, tenham suas classes de armazenamento alteradas para **Nearline**

## Aula 06 - Transferindo dados

- Como fazer, ou agendar, uma transferência dos objetos entre *buckets* da Google Cloud
- Como fazer, ou agendar, uma transferência dos objetos de um *bucket* do S3, da AWS, para um *bucket* da Google Cloud

#### Passo a passo

- Para testes, crie um *bucket* em Hong Kong
- Através do **Transfer**, faça uma transferência dos objetos de um *bucket* dos Estados Unidos para o *bucket* de Hong Kong
- Para fazer uma transferência de dados entre a AWS e a Google Cloud, crie um usuário na AWS, através do IAM, com tipo de acesso Programmatic access e um grupo com a política **AmazonS3ReadOnlyAccess**
  - Além disso, faça o download das credenciais de acesso
- Novamente através do Transfer, agende uma transferência dos objetos de um bucket do S3 para o seu bucket da Google Cloud
  - Será necessário preencher as credenciais de acesso do S3, que você fez download anteriormente