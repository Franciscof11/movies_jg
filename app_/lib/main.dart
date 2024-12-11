import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:moviesjg/data/graphql_client.dart';
import 'package:moviesjg/presentation/home_page/home_page.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfig.initializeClient(),
      child: const CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movies JG',
          home: HomePage(),
        ),
      ),
    );
  }
}
