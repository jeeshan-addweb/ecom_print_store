import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class ShopScreenController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;

  final GraphQLClient _client = Get.find<GraphQLClient>();

  final String query = """
    query {
      products {
        id
        name
        price
      }
    }
  """;

  void fetchProducts() async {
    isLoading.value = true;

    final result = await _client.query(
      QueryOptions(document: gql(query)),
    );

    if (!result.hasException) {
      products.value = result.data?['products'] ?? [];
    } else {
      print("Error: ${result.exception.toString()}");
    }

    isLoading.value = false;
  }
}