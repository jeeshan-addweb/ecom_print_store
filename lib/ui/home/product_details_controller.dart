import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:ecom_print_store/ui/product/controller/fetch_related_products_controller.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class ProductDetailsController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Trigger related product fetch once product is loaded
    ever(products, (_) {
      if (products.isNotEmpty) {
        List categories = products[0]['productCategories']['nodes'];
        List<String> categorySlugs = categories.map((e) => e['slug'].toString()).toList();
        Get.find<FetchRelatedProductsController>().fetchRelatedProducts(categories: categorySlugs);
      }
    });
  }
  final GraphQLClient _client = Get.find<GraphQLClient>();



  final String getProductDetailsQuery = """
 query GetProductDetail(\$slug: ID!) {
  product(id: \$slug, idType: SLUG) {
    id
    name
    slug
    description
    shortDescription
    averageRating
    reviewCount
    ... on SimpleProduct {
      price
      regularPrice
      salePrice
      onSale
    }
    ... on VariableProduct {
      price
      regularPrice
      salePrice
      onSale
      variations(first: 50) {
        nodes {
          id
          name
          price
          regularPrice
          salePrice
          attributes {
            nodes {
              name
              value
            }
          }
        }
      }
    }
    productCategories {
      nodes {
        name
        slug
      }
    }
    image {
      sourceUrl
      altText
    }
    galleryImages {
      nodes {
        sourceUrl
        altText
      }
    }
  }
}
""";




  void fetchProductDetails({required String slug}) async {
    try {
      isLoading.value = true;
      final result = await _client.query(
        QueryOptions(
          document: gql(getProductDetailsQuery),
          variables: {
            "slug": slug  // This will be automatically converted to ID type
          },
        ),
      );

      if (!result.hasException && result.data != null) {
        final fetchedProduct = result.data!['product'];

        if (fetchedProduct != null) {
          products.value = [fetchedProduct]; // or handle as single product
          print("Fetched Product: ${fetchedProduct['name']}");
        } else {
          products.value = [];
          print("No product found with slug: $slug");
        }
      } else {
        print("GraphQL Error: ${result.exception.toString()}");
        products.value = [];
      }
    } catch (e) {
      print("Unexpected Error: $e");
      products.value = [];
    } finally {
      isLoading.value = false;
    }
  }

}