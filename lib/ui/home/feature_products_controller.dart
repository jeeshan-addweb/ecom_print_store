import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class FeatureProductsController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;

  final GraphQLClient _client = Get.find<GraphQLClient>();



  final String queryFeatureProducts = """
  query GetFeaturedProducts {
    products(first: 10, where: { featured: true }) {
      nodes {
        id
        name
        slug
        image {
          sourceUrl
          altText
        }
        ... on SimpleProduct {
          price
          regularPrice
          salePrice
        }
        ... on VariableProduct {
          price
          regularPrice
          salePrice
        }
      }
    }
  }
""";






  void fetchFeaturedProducts() async {
    isLoading.value = true;

    final result = await _client.query(
      QueryOptions(document: gql(queryFeatureProducts)),
    );

    if (!result.hasException) {
      products.value = result.data?['products']?['nodes'] ?? [];
    } else {
      print("GraphQL Error: ${result.exception.toString()}");
    }

    isLoading.value = false;
  }


}