#  PokéDex App - Flutter

- **Base de Conhecimento:** Toda a lógica de componentes e consumo de APIs foi construída com base na minha experiência prévia com **React.js** e **C#/.NET** e leitura de documentação e etc... 
- **Curva de Aprendizado:** Por estar em uma fase inicial de estudos em **Dart** e **Flutter**, utilizei este projeto, que é um teste de desenvolvimento para o Grupo Carone, como um laboratório para entender o ciclo de vida de widgets, sistemas de constraints e a sintaxe da linguagem.
- Embora ainda não possua domínio total do ecossistema Flutter, este app demonstra minha capacidade de aplicar conceitos de arquitetura e lógica de programação em uma nova tecnologia de forma funcional.

##  Funcionalidades

- **Listagem Dinâmica:** Exibição de Pokémons com imagens e nomes extraídos da API.
- **Paginação:** Navegação por páginas (20 Pokémons por vez) para garantir performance e controle de dados.
- **Busca em Tempo Real:** Filtra por nome diretamente na página atual.
- **Sistema de Favoritos:** Possibilidade de favoritar Pokémons.
- **Detalhes Completos:** Tela exclusiva para cada Pokémon apresentando Peso, Altura, Habilidades e arte.
- **UI Responsiva:** Implementação de `LayoutBuilder` e `ConstrainedBox` para garantir que o layout preencha a tela inteira, independentemente do dispositivo.

##  Tecnologias e Conceitos Utilizados

- **Linguagem:** Dart
- **Framework:** Flutter
- **Consumo de API:** Package `http` para requisições assíncronas e tratamento de JSON.
- **Widgets e UI:** - `LayoutBuilder` & `ConstrainedBox` para design adaptável.
    - `FutureBuilder` para gerenciar o estado das chamadas de API.
    - `Hero Animation` para transições suaves de imagens entre telas.
- **Arquitetura:** Separação clara de responsabilidades entre `Models`, `Views` e `Services`.


##  Estrutura de Pastas

```text
lib/
├── models/      # Classes de dados (Pokemon Model)
├── services/    # Lógica de integração com a API (ApiService)
├── Views/       # Interfaces do usuário (home.dart e single.dart)
└── main.dart    # Arquivo principal
```

##  Referências e Créditos

Para o desenvolvimento deste projeto, foram utilizadas as seguintes fontes e ferramentas:

- **[PokeAPI](https://pokeapi.co/):** API RESTful utilizada para o consumo de dados dos Pokémons.
- **[Dart Documentation](https://dart.dev/guides):** Documentação oficial da linguagem Dart para consultas sobre sintaxe e boas práticas.
- **[Curso de Flutter - Canal FLutterando](https://www.youtube.com/watch?v=ZupeUUtNaeg&t=265s):** Guia no youtube
- **[Flutter Documentation](https://docs.flutter.dev/):** Referência principal para a construção dos Widgets e lógica de navegação.
- **[Hero Animations](https://docs.flutter.dev/ui/animations/hero-animations): ** Documentação sobre animações hero
- **[FlutterBuilder](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html): ** Documentação do Builder
- **[Flutter Icons](https://api.flutter.dev/flutter/material/Icons-class.html): ** Icones que eu utilizei
- **[StackOverFlow](https://stackoverflow.com/questions/49045393/message-flutter-run-no-connected-devices): **Problemas de configurações
