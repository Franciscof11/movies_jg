### **Documentação Completa: Aplicativo Flutter Consumindo API GraphQL**

---

## **Introdução ao Projeto e Tecnologias Utilizadas**

Este projeto consiste em um aplicativo Flutter que consome uma API GraphQL para exibir e gerenciar dados de filmes. O app permite que os usuários visualizem listas de filmes, detalhes específicos e realizem operações como criar, atualizar ou deletar filmes.

### **Tecnologias Utilizadas**

- **Flutter**: Framework de desenvolvimento multiplataforma para criar interfaces nativas em Android, iOS e Web.
- **GraphQL**: Linguagem de consulta utilizada para buscar e manipular os dados do backend.
- **GraphQL Flutter**: Biblioteca que facilita a integração do Flutter com APIs GraphQL.
- **Dart**: Linguagem de programação utilizada no Flutter.

---

## **Instruções para Instalação e Configuração do Ambiente**

### **1. Instalar o Flutter**

#### **Windows, macOS ou Linux**
1. Baixe o SDK do Flutter em [flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install).
2. Extraia o arquivo em um diretório de sua preferência.
3. Adicione o Flutter ao PATH do sistema:
   - **Windows**: Configure o PATH nas variáveis de ambiente.
   - **macOS/Linux**: Adicione a linha `export PATH=$PATH:/caminho/para/flutter/bin` ao arquivo `.bashrc` ou `.zshrc`.
4. Verifique a instalação:

```bash
flutter doctor
```

Resolva os problemas indicados pelo `flutter doctor`, como instalar o Android Studio ou configurar um emulador.

### **2. Configurar o Projeto Flutter**

#### **Clonar o Repositório**
Clone o repositório do projeto:

```bash
git clone https://github.com/seu-usuario/flutter-graphql-app.git
cd flutter-graphql-app
```

#### **Instalar Dependências**

No diretório do projeto, execute o seguinte comando para instalar as dependências do Flutter:

```bash
flutter pub get
```

#### **Gerar Arquivos Necessários**
Se o projeto usa `build_runner` para gerar códigos automáticos (por exemplo, modelos ou configurações de GraphQL), execute:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## **Descrição dos Principais Componentes do Frontend**

### **1. HomePage**
- **Função:** Exibe uma lista de filmes recuperados da API.
- **Componentes:**
  - **MovieTile:** Widget que exibe informações resumidas de um filme (título e tagline).

### **2. GraphQL Configuration**
- **Função:** Configuração do cliente GraphQL.
- **Biblioteca Utilizada:** `graphql_flutter`.
- **Configuração no Arquivo:** 

```dart
ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    link: HttpLink('http://localhost:4000/graphql'),
    cache: GraphQLCache(),
  ),
);
```

---

## **Instruções para Executar o Frontend**

### **1. Executar no Android**
1. Conecte um dispositivo Android via USB ou inicie um emulador:
   ```bash
   flutter emulators --launch nome_do_emulador
   ```
2. Execute o comando:
   ```bash
   flutter run
   ```

### **2. Executar no iOS**
1. No macOS, inicie o simulador iOS:
   ```bash
   open -a Simulator
   ```
2. Execute o comando:
   ```bash
   flutter run
   ```

> **Nota:** Certifique-se de ter o Xcode instalado e configurado.

### **3. Executar no Web**
1. Certifique-se de que o Flutter Web esteja configurado:
   ```bash
   flutter config --enable-web
   ```
2. Execute o comando:
   ```bash
   flutter run -d chrome
   ```

---

## **Considerações Finais**

Este aplicativo Flutter é uma base robusta para consumir APIs GraphQL e pode ser expandido para incluir funcionalidades como autenticação, paginação e caching mais avançado. Para contribuir ou reportar problemas, entre em contato ou abra um pull request no repositório. 🌐
