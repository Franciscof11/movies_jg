<h2 align="center">Movies JG<h2>
<p align="center">
    <img src="https://i.imgur.com/mQyJYdq.png" width="350" height="350" alt="App Banner" />
</p>

## **Sobre o Projeto**

Este repositório contém:
- **Backend**: API GraphQL desenvolvida em Node.js com Apollo Server, conectada ao banco de dados Neo4j.
- **Frontend**: Aplicativo Flutter que consome a API para exibir e gerenciar dados de filmes.

---

## **Tecnologias Utilizadas**

- **Backend**:
  - Node.js
  - Apollo Server
  - GraphQL
  - Neo4j

- **Frontend**:
  - Flutter
  - GraphQL Flutter
  - Dart

---

## **Instruções de Instalação**

### **Backend**
1. Instale o Node.js e o Neo4j.
2. Clone o repositório e instale as dependências:
   ```bash
   npm install
   ```
3. Configure o arquivo `.env` com as credenciais do Neo4j e inicie o servidor:
   ```bash
   npm start
   ```

### **Frontend**
1. Instale o Flutter e configure o ambiente.
2. Clone o repositório do aplicativo e instale as dependências:
   ```bash
   flutter pub get
   ```
3. Configure o arquivo `.env` com a URL da API GraphQL.
4. Execute o aplicativo:
   ```bash
   flutter run
   ```

---

## **Execução**

### **Backend**
Acesse o playground da API em: `http://localhost:4000/graphql`.

### **Frontend**
Execute o app em:
- Android: `flutter run`
- iOS: `flutter run`
- Web: `flutter run -d chrome`

---

## **Exemplos de Queries**

### **Consulta de Filmes**
```graphql
query {
  getMovies {
    properties {
      title
      tagline
      released
    }
  }
}
```
