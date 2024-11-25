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
Arquitetura escolhida devido ao foco em chamadas de API e adesão aos princípios SOLID, principalmente ao *Single Responsibility Principle*.

O projeto teve início na segunda-feira, com uma primeira versão concluída na terça. Na quinta, criei um [segundo repositório](https://github.com/Sonzzini/Desafio_TechAcme_ViewCode) para implementar o desafio utilizando *ViewCode* com a arquitetura VIP (UI não finalizada), mas optei por polir este projeto devido à menor prática com *ViewCode*.

Inicialmente, havia implementado os modelos de dados sem a utilização da estrutura de um enum de WebAccess, mas após um estudo realizado durante a implementação deste desafio em *ViewCode*, atualizei este repositório para também implementar esta estrutura de requisição e resposta para o modelo.

## Instruções para executar o projeto
1. Se certifique de ter o Xcode instalado em seu Mac.
2. Clone/baixe ou clique em Code > Open with Xcode.
3. Abra o arquivo no Xcode.
4. Pressione **Cmd + R** para compilar e executar o projeto no simulador ou em um dispositivo conectado.
