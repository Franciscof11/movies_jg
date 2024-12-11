import neo4j from 'neo4j-driver';

const driver = neo4j.driver(
    "bolt://54.91.96.145:7687",
    neo4j.auth.basic("neo4j", "distortion-racks-tube")
);

export const session = driver.session();
