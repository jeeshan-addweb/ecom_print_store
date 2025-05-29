import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class CategoriesController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;

  final GraphQLClient _client = Get.find<GraphQLClient>();



  final String queryCategories = """
  query GetProductCategories {
  productCategories(first: 100) {
    nodes {
      id
      name
      slug
      description
      count
      image {
        sourceUrl
        altText
      }
    }
  }
}
""";



  void fetchCategories() async {
    try {
      isLoading.value = true;

      final result = await _client.query(
        QueryOptions(document: gql(queryCategories)),
      );

      if (!result.hasException && result.data != null) {
        // Safely access the products list inside nodes
        final fetchedCategories = result.data!['productCategories']?['nodes'];
        if (fetchedCategories is List) {
          products.value = fetchedCategories;
        } else {
          products.value = [];
        }
      } else {
        print("GraphQL Error: ${result.exception.toString()}");
      }
    } catch (e) {
      print("Unexpected Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}