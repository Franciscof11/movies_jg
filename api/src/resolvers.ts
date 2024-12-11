import { session } from "./neo4j";

export const resolvers = {
    Query: {
        getMovies: async () => {
            const result = await session.run(`MATCH (m:Movie) RETURN m`);
            return result.records.map((record) => {
                const movie = record.get("m");
                const properties = movie.properties;

                // Convertemos os valores necessários para o tipo correto
                return {
                    identity: movie.identity.toInt(),
                    labels: movie.labels,
                    properties: {
                        ...properties,
                        released: parseInt(properties.released), // Convertendo para inteiro
                    },
                    elementId: movie.elementId,
                };
            });
        }, getMovieById: async (_: any, { identity }: { identity: string }) => {
            const result = await session.run(
                `MATCH (m:Movie) WHERE id(m) = $identity RETURN m`,
                { identity: parseInt(identity) }
            );
            const record = result.records[0];
            if (record) {
                const movie = record.get("m");
                const properties = movie.properties;

                return {
                    identity: movie.identity.toInt(),
                    labels: movie.labels,
                    properties: {
                        ...properties,
                        released: parseInt(properties.released), // Convertendo para inteiro
                    },
                    elementId: movie.elementId,
                };
            }
            return null;
        },
        getPersons: async () => {
            const result = await session.run(`MATCH (p:Person) RETURN p`);
            return result.records.map((record) => {
                const person = record.get("p");
                return {
                    identity: person.identity.toInt(),
                    labels: person.labels,
                    properties: person.properties,
                    elementId: person.elementId,
                };
            });
        },
    },
};
