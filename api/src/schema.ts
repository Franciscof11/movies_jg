import { gql } from "apollo-server";

export const typeDefs = gql`
  type Movie {
    identity: ID!
    labels: [String!]!
    properties: MovieProperties!
    elementId: String!
  }

  type MovieProperties {
    title: String!
    tagline: String
    released: Int!
  }

  type Person {
    identity: ID!
    labels: [String!]!
    properties: PersonProperties!
    elementId: String!
  }

  type PersonProperties {
    name: String!
    born: Int
  }

  type Query {
    getMovies: [Movie!]!
    getMovieById(identity: ID!): Movie
    getPersons: [Person!]!
    getPersonById(identity: ID!): Person
  }

  type Mutation {
    createMovie(title: String!, tagline: String, released: Int!): Movie!
    createPerson(name: String!, born: Int): Person!
    addActorToMovie(personId: ID!, movieId: ID!): Movie!
    addDirectorToMovie(personId: ID!, movieId: ID!): Movie!
  }
`;
