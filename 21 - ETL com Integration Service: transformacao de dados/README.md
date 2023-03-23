# ETL com Integration Service: transformação de dados 

## Aula 01 - Introdução ao treinamento

- Uma breve revisão da Parte 1 do curso.
- Como recuperar a base do Data Warehouse e do projeto, caso você esteja utilizando uma máquina diferente da que foi a utilizada na Parte 1 do curso.

## Aula 02 - Carregando dimensão cliente
- 
- 

**OBS:** No primeiro vídeo aparece o seguinte erro de conexão no componente "Origem do Excel":

```
could not retrieve the table information for the connection manager 'excel connection manager' Failed to connect to the source using the connection manager...
```


Caso a solução dada pelo professor não funcione, realize os seguintes passos:

1. Realize o download do Microsoft.DataTools.AnalysisServices.vsix pelo link: [link](https://marketplace.visualstudio.com/items?itemName=ProBITools.MicrosoftAnalysisServicesModelingProjects);
2. Abriu o arquivo `.visx` com 7Zip ou win-rar, extraia somente o arquivo `Microsoft.DataWarehouse.AS.dll` de aproximadamente 1,37 Mb;
3. Copie o arquivo extraído para o seguinte diretório no seu Windows, mudando apenas o ano (2022) para a versão atual do seu Visual Studio, que seria 2017 no caso do professor: 
`C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\SSIS`
4. Clique 2 vezes sobre o arquivo `AccessDatabaseEngine.exe` baixado pelo professor e escolha a opção para **desisntalar**;
5. Tendo desisntalado, baixe o arquivo `AccessDatabaseEngine_X64.exe` pelo link [aqui](https://www.microsoft.com/en-us/download/details.aspx?id=13255);
6. Instale o arquivo baixado, clicando 2 vezes no mesmo.

Referências:
1. https://developercommunity.visualstudio.com/t/ssis-does-not-allow-to-select-column/736076
2. https://learn.microsoft.com/en-us/answers/questions/1179732/no-tables-or-views-when-connecting-to-excel-file-i
