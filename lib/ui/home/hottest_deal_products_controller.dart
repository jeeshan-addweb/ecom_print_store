import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class HottestDealProductsController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;

  final GraphQLClient _client = Get.find<GraphQLClient>();



  final String hottestDealProducts = """
  query GetHottestDeals {
  products(
    first: 10
    where: { onSale: true }
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
}""";






  void fetchHottestDealProducts() async {
    isLoading.value = true;

    final result = await _client.query(
      QueryOptions(document: gql(hottestDealProducts)),
    );

    if (!result.hasException) {
      products.value = result.data?['products']?['nodes'] ?? [];
    } else {
      print("GraphQL Error: ${result.exception.toString()}");
    }

    isLoading.value = false;
  }


}