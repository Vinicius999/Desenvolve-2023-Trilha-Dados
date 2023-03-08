# PostgreSQL: Triggers, transações, erros e cursores

## Aula 01 - Triggers

- Entendemos o conceito de eventos no banco de dados
- Aprendemos como criar um *Trigger Procedure*
- Definimos um *Trigger* que executa uma *Trigger Procedure* quando um evento ocorre
- Entendemos a fundo detalhes de *triggers* como `FOR EACH ROW|STATEMENT`, etc.

## Aula 02 - Gerenciamento de transações

- Vimos que há 2 sintaxes para iniciar uma transação: `BEGIN` e `START TRANSACTION`
- Entendemos que funções por si só já fazem parte de uma transação
- Aprendemos que erros cancelam as alterações de uma função

## Aula 03 - Erros e Exceções

- Aprendemos o que são os erros (ou exceções) do PostgreSQL
- Aprendemos a gerar erros e mensagens com o `RAISE`
- Aprendemos a usar o `ASSERT` que verifica condições e levanta exceções
- Entendemos que o `RAISE` pode ser usado no processo de depuração

## Aula 04 - Erros e Exceções

- Entendemos o propósito de usar cursores, para poupar uso de memória
- Vimos como abrir cursores, sendo eles *bound* ou *unbound*
- Vimos como manipular cursores com `FETCH` e `MOVE`
- Usamos cursores na prática em um `LOOP`

## Aula 05 - Processo de desenvolvimento

- Aprendemos a usar blocos anônimos com `DO`
- Vimos que blocos anônimos possuem 2 principais propósitos
  - Rodar um script pontual em PLpgSQL
  - Preparar uma função para efetivamente criá-la no futuro
- Entendemos que boas práticas de programação são muito importantes
- Conhecemos algumas outras ferramentas além do PgAdmin como DataGrip e EMS
