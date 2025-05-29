import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class MostLovedProductsController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;

  final GraphQLClient _client = Get.find<GraphQLClient>();



  final String queryMostLovedProducts = """
  query GetMostLovedProducts {
    products(
      first: 10
      where: {
        orderby: { field: RATING, order: DESC }
      }
    ) {
      nodes {
        id
        name
        slug
        averageRating
        reviewCount
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
        image {
          sourceUrl
          altText
        }
        productCategories {
          nodes {
            name
            slug
          }
        }
      }
    }
  }
""";



  void fetchMostLovedProducts() async {
    try {
      isLoading.value = true;

      final result = await _client.query(
        QueryOptions(document: gql(queryMostLovedProducts)),
      );

      if (!result.hasException && result.data != null) {
        // Safely access the products list inside nodes
        final fetchedProducts = result.data!['products']?['nodes'];
        if (fetchedProducts is List) {
          products.value = fetchedProducts;
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