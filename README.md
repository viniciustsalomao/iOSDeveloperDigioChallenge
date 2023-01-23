# IOS Developer Digio Challenge

[![Swift Version][swift-image]][swift-url] [![License][license-image]][license-url] ![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)

## Requisitos
- Xcode

## Como rodar o projeto
Clone ou faça o Download do projeto e siga esses passos:.
 
#### Cocoapods
Rode o comando `pod install` no seu terminal para fazer a instalação das dependências do projeto.

## Libs
Libs utilizadas:

#### TinyContraints(https://github.com/roberthein/TinyConstraints)
Utilizei a lib TinyContrainsts para diminuir a verbosidade da criação de constraints do UIKit, deixando a leitura do código mais limpo.

## Padrões de projeto

#### MVVM
Utilizei a arquitetura MVVM por ser umas das mais utilizadas por empresas hoje em dia, facilita a criação de testes unitários, por ter seu código dividido em classes com cada uma tendo sua responsabilidade bem definida.

#### ViewCode
Decidi realizar o desenvolvimento da UI do projeto utilizando o ViewCode, uma metodologia em que utilizamos o UIKit para criar o conteúdo de nossas telas inteiramente por código. Uma das razões foi por melhorar o tempo de build do app, além de ser mais pratico de dar manutenção e realizar Code Reviews.

## Obrigado!

Vinícius Tinajero Salomão – LinkedIn(https://www.linkedin.com/in/vinicius-tinajero-salomao/)

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
