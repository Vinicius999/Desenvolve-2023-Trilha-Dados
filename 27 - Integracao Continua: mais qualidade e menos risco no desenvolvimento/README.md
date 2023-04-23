# Integração Contínua: mais qualidade e menos risco no desenvolvimento

## Aula 01 - O que é integração contínua?

- **Integração Contínua** (CI) significa integrar as alterações no *mainline* (*master* ou *trunk*) diariamente
- Para usar **Integração Contínua**, é necessário usar um sistema de controle de versão (VCS), e no final integramos o código no repositório (usar Git não é obrigatório)
- Aplicando **Integração Contínua** corretamente, diminuímos os problemas de integração (como *merge hell*), melhoramos a comunicação entre desenvolvedores e antecipamos a descoberta de *bugs*
- Os estilos de organização de projeto
  - **Mono-repo** possui todos os projetos em um único repositório
  - **Multi-repo** separa um repositório para cada projeto

## Aula 02 - Estratégias de ramificação

- O Git possui *branches* leves, que causou a criação de *workflows* baseado em *branches*
- Existem vários *flows* ou **modelos de ramificação** (*branching model*)
- Alguns dos modelos conhecidos são:
  - *Trunk-Based*
  - *Feature Branch Flow*
  - *GitHub Flow*
  - *GitLab Flow*
  - *Git Flow*
- Cada um define a semântica e uso da *branch*
- lembre-se, cada **branch** deve ser de **vida curta** para diminuir o risco do *merge hell*
- O comando `rebase` garante um histórico linear dos *commits*
- *Rebase* não deve ser usado em *branches* compartilhadas/públicas

## Aula 03 - Builds e testes automatizados

- Para usar integração contínua com sucesso, é preciso ter **testes automatizados**
  - Esses testes devem verificar a maior parte do código
  - TDD é uma metodologia que pode ajudar na criação dos testes
  - Os testes representam *feedback* sobre a saúde/qualidade do seu projeto
- O desenvolvedor deve rodar os testes antes de enviar as alterações para o repositório
  - Se for impossível executar todos os testes (por causa da infraestrutura ou demora da execução), é possível executar apenas os testes de unidade ou uma suíte de testes mais importantes (*smoke testes*)
- O build do projeto deve ser simples e totalmente automatizado
  - É boa prática o uso de uma ferramenta especializada para o *build* do software
  - Tente usar um "single command build" para executar o *build*
- A execução dos testes e build não deve se tornar uma razão para atrasar o build, para evitar:
  - *Otimize build*
  - Tente respeitar o tempo de *10 minutos para o build* (alguns falam de 5 minutos)
  - Se o *build* for falhar, a ideia é que ele *falhe o mais rápido possível*.

## Aula 04 - Mais feedback com builds contínuas

- O servidor de integração contínua monitora o repositório de código
  - Ao detectar uma alteração, deve iniciar o *build* do projeto
  - O *build* deve acontecer a cada novo *commit*
  - O resultado do *build* deve ser publicado
  - Os desenvolvedores devem ser notificados sobre o status do *build*
- Um build quebrado deve ser arrumado em no máximo 10 minutos, com prioridade máxima
  - É responsabilidade de todos da equipe arrumar um *build* quebrado

## Aula 05 - Um pouco sobre a entrega contínua

- A integração contínua é uma prática que faz parte da **entrega contínua** (*continuous delivery* - *CD*)
- A entrega contínua define uma série de práticas e padrões para construir e deployar a aplicação continuamente
  - Não deve existir nenhum motivo técnico para impedir o *deploy* (apenas um motivo de negócio)
  - Qualquer alteração no *trunk principal* é *releasable* (pode entrar em produção)
- A entrega contínua é uma evolução da integração contínua e envolve todo o ciclo do projeto, incluindo equipes de QA, deploy e operações
  - a diferença entre a entrega contínua e o **deploy contínuo** é, que no *deploy contínuo* todas as alterações realmente entra em produção, o tempo todo
- **DevOps** é um *movimento cultural*, que visa a colaboração entre as equipes envolvidas no desenvolvimento e entrega de software, para melhorar a qualidade e velocidade do software
- DevOps é sobre **colaboração**, **melhoria** e **aprendizagem contínua**
