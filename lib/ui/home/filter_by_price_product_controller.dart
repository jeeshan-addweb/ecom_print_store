import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class FilterByPriceProductController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;

  final GraphQLClient _client = Get.find<GraphQLClient>();



  final String getProductsByPriceQuery = """
  query GetProductsByPriceRange(\$minPrice: Float!, \$maxPrice: Float!) {
    products(
      first: 10
      where: {
        minPrice: \$minPrice
        maxPrice: \$maxPrice
      }
    ) {
      nodes {
        id
        name
        slug
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
      }
    }
  }
""";




  void fetchProductsByPriceRange({required double minPrice, required double maxPrice}) async {
    try {
      isLoading.value = true;

      final result = await _client.query(
        QueryOptions(
          document: gql(getProductsByPriceQuery),
          variables: {
            'minPrice': minPrice,
            'maxPrice': maxPrice,
          },
        ),
      );

      if (!result.hasException && result.data != null) {
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