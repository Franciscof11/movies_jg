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
      appBar: AppBar(
        title: const Text('Movies'),
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

          // Parse dos dados
          final List movies = result.data?['getMovies'] ?? [];

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie['properties']['title']),
                subtitle: Text(movie['properties']['tagline'] ?? ''),
                trailing: Text(movie['properties']['released'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
