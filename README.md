## Solução adotada
A solução adotada para o desafio foi a utilização da arquitetura Clean Swift com interface em SwiftUI!

## Libs utilizadas
Os frameworks utilizados para este projeto foram:
- SwiftUI
- WebKit
- Testing

## Arquitetura
O projeto utiliza a arquitetura Clean Swift adaptada, com Views, ViewModels, UseCases, Repositories e DataSources. 

A comunicação entre essas camadas é feita através de *protocols*, garantindo:
1. Desacoplamento
2. Flexibilidade
3. Escalabilidade

Esta arquitetura foi escolhida pelos seguintes fatores:
1. Escalabilidade
2. Separação de responsabilidades
3. Integração com API

## Escolhas feitas
O processo de desenvolvimento do desafio teve início na segunda-feira (18/11) com uma primeira versão concluída no dia seguinte. Nela, já estava definida a arquitetura Clean Swift, escolhida devido ao foco em chamadas de API e adesão aos princípios SOLID, principalmente ao *Single Responsibility Principle*.

Com o objetivo de alcançar um diferencial no desafio, na quinta-feira (21/11) criei um [segundo repositório](https://github.com/Sonzzini/Desafio_TechAcme_ViewCode) para implementar o desafio utilizando *ViewCode* e a arquitetura VIP, mas optei por polir este projeto devido à minha menor prática com *ViewCode*.

Apesar de não ter a UI finalizada no projeto em *ViewCode*, através do estudo realizado durante a sua implementação, pude aprimorar a versão em SwiftUI, que inicialmente não contava com modelos de dados com a utilização de uma estrutura de um enum de WebAccess para requisição e resposta da API, mas que foi implementado posteriormente.

Também atualizei a nomenclatura das classes e das Views, além de organizar as pastas para ter foco nas Views, para ter melhor coerência com cada funcionalidade e ser mais descritivo.

## Instruções para executar o projeto
1. Se certifique de ter o Xcode instalado em seu Mac.
2. Clone/baixe ou clique em Code > Open with Xcode.
3. Abra o arquivo no Xcode.
4. Pressione **Cmd + R** para compilar e executar o projeto no simulador ou em um dispositivo conectado.
