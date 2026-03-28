#  PokéDex App - Flutter Project

Este é um projeto desenvolvido em **Flutter** que consome a [PokeAPI](https://pokeapi.co/). O objetivo principal foi colocar em prática conceitos de navegação, consumo de APIs REST e criação de layouts responsivos no ambiente mobile.

Como venho de uma base em **Full-Stack (React/C#)**, este projeto foi minha porta de entrada para entender as diferenças entre o desenvolvimento Web e Mobile.

##  Funcionalidades

- **Listagem Dinâmica:** Exibição de Pokémons com imagens e nomes.
- **Paginação Clássica:** Navegação por páginas (20 Pokémons por vez) para melhor performance e controle de dados.
- **Busca em Tempo Real:** Filtro por nome diretamente na página atual conforme o usuário digita.
- **Detalhes Completos:** Tela exclusiva para cada Pokémon com Peso, Altura e Habilidades.
- **UI Responsiva:** Implementação de `min-height` para garantir que o card de detalhes preencha a tela inteira, independentemente do dispositivo.

##  Tecnologias e Conceitos Utilizados

- **Linguagem:** Dart
- **Framework:** Flutter
- **Consumo de API:** `http` package para requisições assíncronas.
- **Widgets:** - `LayoutBuilder` & `ConstrainedBox` (para o efeito de preenchimento total da tela).
    - `FutureBuilder` para gerenciar o estado das chamadas de API.
    - `Hero Animation` para transições suaves de imagens entre telas.
- **Organização:** Separação de responsabilidades entre `Models`, `Views` e `Services`.


##  Estrutura de Pastas

```text
lib/
├── models/      # Classes de dados (Pokemon Model)
├── services/    # Lógica de integração com a API (ApiService)
├── Views/       # Interfaces do usuário (home.dart e single.dart)
└── main.dart    # Arquivo principal

##  Referências e Créditos

Para o desenvolvimento deste projeto, foram utilizadas as seguintes fontes e ferramentas:

- **[PokeAPI](https://pokeapi.co/):** API RESTful utilizada para o consumo de dados dos Pokémons.
- **[Dart Documentation](https://dart.dev/guides):** Documentação oficial da linguagem Dart para consultas sobre sintaxe e boas práticas.
- **[Curso de Flutter #2 - Ambiente de desenvolvimento](https://www.youtube.com/watch?v=Exemplo):** Guia utilizado para a configuração inicial do Flutter e do emulador.
- **[Flutter Documentation](https://docs.flutter.dev/):** Referência principal para a construção dos Widgets e lógica de navegação.

##  Sobre o Desenvolvimento e Aprendizado

Este projeto faz parte da minha transição e expansão de competências para o desenvolvimento mobile. 

- **Base de Conhecimento:** Toda a lógica de componentes e consumo de APIs foi construída com base na minha experiência prévia com **React.js** e **C#/.NET**. 
- **Curva de Aprendizado:** Por estar em uma fase inicial de estudos em **Dart** e **Flutter**, utilizei este projeto como um laboratório para entender o ciclo de vida de widgets, sistemas de constraints e a sintaxe da linguagem.

Embora ainda não possua domínio total do ecossistema Flutter, este app demonstra minha capacidade de aplicar conceitos de arquitetura e lógica de programação em uma nova tecnologia de forma ágil e funcional.
