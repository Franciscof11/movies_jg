import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String getMoviesQuery = """
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
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: const Text('MoviesJG'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/logo.png'),
        ),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(getMoviesQuery),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            return Center(
              child: Text(result.exception.toString()),
            );
          }

          final List movies = result.data?['getMovies'] ?? [];

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              final String movieName = movie['properties']['title'];
              final String movieSubtitle = movie['properties']['tagline'] ?? '';
              final String launchDate =
                  movie['properties']['released'].toString();
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Text("Nome do filme: $movieName"),
                        const SizedBox(height: 25),
                        Text("Subtítulo: $movieSubtitle"),
                        const SizedBox(height: 25),
                        Text("Data de lançamento: $launchDate"),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
