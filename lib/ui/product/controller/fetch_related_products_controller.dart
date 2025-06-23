import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FetchRelatedProductsController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;


  final GraphQLClient _client = Get.find<GraphQLClient>();



  final String categoryQuery = """
  query GetProductCategories(\$slug: ID!) {
      product(id: \$slug, idType: SLUG) {
        productCategories {
          nodes {
            slug
          }
        }
      }
    }
""";


  final String relatedProducts = """
   query GetRelatedProducts(\$categories: [String]) {
      products(
        first: 8
        where: {
          categoryIn: \$categories
        }
      ) {
        nodes {
          id
          name
          slug
          ... on SimpleProduct {
            price
            salePrice
          }
          ... on VariableProduct {
            price
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



 /* void fetchCategories({required String slug}) async {
    isLoading.value = true;

    final result = await _client.query(
      QueryOptions(
          document: gql(categoryQuery),
          variables: {'slug': slug},
      ),
    );

    if (!result.hasException) {
      products.value = result.data?['products']?['nodes'] ?? [];
    } else {
      print("GraphQL Error: ${result.exception.toString()}");
    }

    isLoading.value = false;
  }*/

  void fetchRelatedProducts({required List<String> categories}) async {

    print("Categories : "+categories.toString());
    try {
      isLoading.value = true;

      final result = await _client.query(
        QueryOptions(document: gql(relatedProducts)),
      );



      if (!result.hasException && result.data != null) {
        // Safely access the products list inside nodes
        final fetchedProducts = result.data!['products']?['nodes'];
        print("RelatedProducts: "+ fetchedProducts.toString());
        if (fetchedProducts is List) {
          products.value = fetchedProducts;
        } else {
          products.value = [];
        }
      } else {
        print("GraphQLError: ${result.exception.toString()}");
      }
    } catch (e) {
      print("Unexpected Error: $e");
    } finally {
      isLoading.value = false;
    }
  }


}