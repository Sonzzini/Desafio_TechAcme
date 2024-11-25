## Solução adotada
A solução adotada para o desafio foi a utilização da arquitetura Clean Swift com interface em SwiftUI!

## Libs utilizadas
SwiftUI

WebKit

Testing

## Arquitetura
O projeto utiliza a arquitetura Clean Swift adaptada, com Views, ViewModels, UseCases, Repositories e DataSources. 

A comunicação entre essas camadas é feita 
através de protocols, garantindo:
1. Desacoplamento
2. Flexibilidade
3. Escalabilidade

Esta arquitetura foi escolhida pelos seguintes fatores:
1. Escalabilidade
2. Separação de responsabilidades
3. Integração com API

## Escolhas feitas
Arquitetura escolhida devido ao foco em chamadas de API e adesão aos princípios SOLID, principalmente ao *Single Responsibility Principle*.

Havia implementado os modelos de dados sem a utilização do enum de WebAccess, mas após um estudo realizado durante a implementação deste desafio em [ViewCode](https://github.com/Sonzzini/Desafio_TechAcme_ViewCode) (não finalizado), atualizei este repositório para também implementar esta estrutura de requisição e resposta para o modelo.

Iniciei a implementação deste desafio na segunda-feira, com uma primeira versão concluída na terça. Na quinta, criei um segundo repositório para implementar o desafio utilizando ViewCode e a arquitetura VIP, mas optei por polir este projeto devido à menor prática com ViewCode.

## Instruções para executar o projeto
1. Se certifique de ter o Xcode instalado em seu Mac.
2. Clone/baixe ou clique em Code > Open with Xcode.
3. Abra o arquivo no Xcode.
4. Pressione **Cmd + R** para compilar e executar o projeto no simulador ou em um dispositivo conectado.
