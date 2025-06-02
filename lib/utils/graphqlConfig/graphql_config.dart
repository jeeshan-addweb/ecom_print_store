import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class GraphQLConfig {
  static final HttpLink httpLink =
  HttpLink('https://ecom360-store.addwebprojects.com/graphql/');

  static GraphQLClient initializeClient() {
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}

