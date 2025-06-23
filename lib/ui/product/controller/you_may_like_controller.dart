import 'package:ecom_print_store/data/models/post/post.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class YouMayLikeController extends GetxController {
  var isLoading = false.obs;
  var products = [].obs;
  
  final GraphQLClient _client = Get.find<GraphQLClient>();



  

  final String queryYouLikeAlsoProducts= """
  query GetProductDetail(\$slug: ID!) {
  product(id: \$slug, idType: SLUG) {
    upsell {
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
          onSale
        }
        ... on VariableProduct {
          price
          regularPrice
          salePrice
          onSale
        }
      }
    }
  }
}
""";



 
  void youMayLikeAlsoProducts() async {
    try {
      isLoading.value = true;

      final result = await _client.query(
        QueryOptions(document: gql(queryYouLikeAlsoProducts)
        ,variables:
         const {
          "slug": "printed-tshirt-coffee-black-color"
        }
        ),
 
      );

      if (!result.hasException && result.data != null) {
        print("Result : "+result.toString());
        // Safely access the products list inside nodes
        final fetchedProducts = result.data!['product']['upsell']?['nodes'];
        if (fetchedProducts is List) {
          products.value = fetchedProducts;
        
        
    print("you may like products ${products}");    
        } else {
          products.value = [];
        }
      } else {
        print("GraphQL Error you may: ${result.exception.toString()}");
      }
    } catch (e) {
      print("Unexpected Error you may: $e");
    } finally {
      isLoading.value = false;
    }
  }


}

