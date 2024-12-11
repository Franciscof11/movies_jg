### **Documentação Completa: API Node.js com GraphQL e Neo4j**

---

## **Introdução ao Backend e Tecnologias Utilizadas**

Este projeto consiste na criação de uma API GraphQL utilizando **Node.js**, **TypeScript**, **Apollo Server**, e **Neo4j** como banco de dados. A API é projetada para gerenciar dados relacionados a filmes e pessoas (como atores e diretores) e fornece um modelo inicial para trabalhar com bancos de grafos.  

### **Principais Tecnologias**

- **Node.js**: Ambiente de execução JavaScript para o backend.
- **TypeScript**: Superset do JavaScript com tipagem estática opcional.
- **GraphQL**: Linguagem de consulta para APIs que permite buscar e manipular dados de forma eficiente.
- **Apollo Server**: Biblioteca para criar servidores GraphQL.
- **Neo4j**: Banco de dados orientado a grafos, ideal para modelar conexões entre entidades.
- **neo4j-driver**: Driver oficial para interagir com bancos de dados Neo4j usando Node.js.

---

## **Instruções de Instalação e Configuração**

### **1. Instalar o Neo4j**

#### Usando o **Neo4j Sandbox** (recomendado para testes)
1. Acesse o [Neo4j Sandbox](https://sandbox.neo4j.com/) e crie um projeto gratuito.
2. Escolha a opção **Blank Sandbox**.
3. Copie as credenciais fornecidas:
   - **Bolt URL**
   - **Username** (geralmente `neo4j`)
   - **Password**.

#### Usando o **Neo4j Desktop** (opção local) ou basta utilizar a versão web
1. Baixe e instale o Neo4j Desktop em [neo4j.com/download](https://neo4j.com/download/).
2. Crie um banco de dados local.
3. Anote a URL Bolt, o nome de usuário e a senha.

---

### **2. Configurar a API GraphQL**

#### **2.1. Clonar o Repositório**
Clone o repositório do projeto:

```bash
git clone https://github.com/seu-usuario/api-graphql-neo4j.git
cd api-graphql-neo4j
```

#### **2.2. Instalar Dependências**
Instale as dependências do projeto:

```bash
npm install
```

#### **2.3. Estrutura do Projeto**
A estrutura do projeto é organizada da seguinte forma:

```
├── src
│   ├── resolvers.ts      # Resolvers do GraphQL
│   ├── schema.ts         # Schema GraphQL
│   ├── server.ts         # Configuração do servidor
│   └── types.ts          # Tipos TypeScript
├── .env                  # Variáveis de ambiente
├── package.json          # Dependências do projeto
├── tsconfig.json         # Configuração do TypeScript
```

---

## **Instruções para Executar o Backend**

1. **Compilar o código TypeScript para JavaScript:**

```bash
npm run build
```

2. **Iniciar o servidor:**

```bash
npm start
```

3. **Acessar o Playground GraphQL:**
   Após iniciar o servidor, abra o navegador e acesse:  
   [http://localhost:4000/graphql](http://localhost:4000/graphql)

---

## **Exemplos de Queries para Testar no Playground**

Após configurar e iniciar a API, você pode usar o playground GraphQL para testar as seguintes queries e mutations.

### **1. Buscar todos os filmes**
```graphql
query {
  getMovies {
    identity
    labels
    properties {
      title
      tagline
      released
    }
    elementId
  }
}
```

### **2. Buscar um filme por ID**
```graphql
query {
  getMovieById(identity: "0") {
    identity
    properties {
      title
      released
    }
  }
}
```

---

## **Como Funciona o Backend**

### **Schema GraphQL**
O schema é definido no arquivo `schema.ts` e contém os seguintes tipos e operações:

- **Tipos:**
  - `Movie`: Representa um filme com os campos `identity`, `labels`, `properties` e `elementId`.
  - `Person`: Representa uma pessoa com os campos `identity`, `labels`, `properties` e `elementId`.

- **Queries:**
  - `getMovies`: Retorna todos os filmes.
  - `getMovieById(identity: String!)`: Busca um filme pelo seu ID.

- **Mutations:**
  - `createMovie(title: String!, tagline: String, released: Int!)`: Cria um novo filme.
  - `updateMovie(identity: String!, title: String)`: Atualiza o título de um filme.
  - `deleteMovie(identity: String!)`: Remove um filme pelo ID.

---

## **Considerações Finais**

Este projeto é uma introdução prática à integração de GraphQL com Neo4j em um backend Node.js. Ele pode ser expandido para incluir funcionalidades mais avançadas, como autenticação, relacionamentos complexos no banco de grafos, e otimizações de performance.

