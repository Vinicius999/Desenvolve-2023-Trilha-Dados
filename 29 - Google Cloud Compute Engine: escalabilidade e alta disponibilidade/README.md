# Google Cloud Compute Engine: escalabilidade e alta disponibilidade

## Aula 01 - Provisionando uma aplicação
- Como criar uma instância no ***Google Cloud Platform***
  - As configurações iniciais: imagem, firewall, etc
- Como automatizar a criação da instância (script de inicialização)
- A testar a nossa instância
- Como ajustar o permissionamento do Apache

## Aula 02 - Utilizando a CLI cloud
- O SSH além do console
  - Como gerar as chaves
  - Como incluir as chaves na instância
  - Como acessar via linha de comando
- Como criar um bucket no ***Google Cloud Storage***
- Por que utilizar a linha de comando
- Como instalar e configurar o ***Google Cloud SDK***
- Como enviar arquivos através do **gsutil**

## Aula 03 - Preparando o front-end
- Uma forma inteligente do gsutil, enviando somente as alterações (rsync)
- Como remover objetos
- Como ajustando as permissões
- Como ajustar o HTML no Google Storage
- Como copiar o diretório html para a instância

## Aula 04 - Escalando o site
- Como reservar um IP
- Como criar uma imagem para a instância
- Detach IP
- Como criar um instance template
- Como criar um instance group

## Aula 05 - Alta disponibilidade
- Como reservar um IP global, configurando o DNS
- Como configurar o Load Balancer DNS
- Health Check
- Como customizar o Health Check
- Como configurar o CDN
- Como criar regras no firewall