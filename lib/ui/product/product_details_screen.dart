import 'package:ecom_print_store/ui/home/product_details_controller.dart';
import 'package:ecom_print_store/ui/product/controller/fetch_related_products_controller.dart';
import 'package:ecom_print_store/ui/product/controller/you_may_like_controller.dart';
import 'package:ecom_print_store/ui/product/widgets/related_product_widget.dart';
import 'package:ecom_print_store/ui/product/widgets/you_may_like_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../auth/login/login.dart';
import '../global_widgets/footer_widget.dart';
import '../home/feature_products_controller.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productSlug;
   ProductDetailsScreen({super.key,required this.productSlug});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ProductDetailsController productDetailsController = Get.find<ProductDetailsController>();
  final FeatureProductsController featureProductsController = Get.find<FeatureProductsController>();
  final FetchRelatedProductsController relatedProductsController = Get.find<FetchRelatedProductsController>();
  final YouMayLikeController youMayLikeController = Get.find<YouMayLikeController>();


  @override
  void initState() {
    super.initState();
    productDetailsController.fetchProductDetails(slug: widget.productSlug);
   // featureProductsController.fetchFeaturedProducts();
    youMayLikeController.youMayLikeAlsoProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyEBEDEFDE,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 120,

        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(Assets.appLogo),
                ),
              ),

              const Text(
                Strings.appName,
                style: TextStyle(
                  color: AppColors.title415161,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        actions: [
          const Text(
            "₹0.00",
            style: TextStyle(
              color: AppColors.redFF5151,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: SizedBox(
              height: 30,
              width: 30,
              child: Badge(
                backgroundColor: AppColors.redFF5151,
                // position: badges.BadgePosition.topEnd(top: -4, end: -4),
                alignment: AlignmentDirectional.topEnd,
                label: const Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                child: IconButton(
                  icon: Image.asset(Assets.cartIcon, height: 25, width: 25),
                  onPressed: () {
                    // Handle tap
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () {},
            icon: Image.asset(height: 30, width: 30, Assets.menuIcon),
          ),
        ],
      ),

      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Obx(() {
                if (productDetailsController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (productDetailsController.products.isEmpty) {
                  return const Center(child: Text("No featured products found"));
                }



                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          productDetailsController.products[0]['image']?['sourceUrl'] ?? '',
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                         productDetailsController.products[0]['onSale']=="false"?const Positioned(
                          top: 10,
                          left: 10,
                          child: Chip(
                            label: Text("Sale!", style: TextStyle(color: Colors.black)),
                            backgroundColor: Colors.white,
                          ),
                        ):const SizedBox(),
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.search, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Text(
                        "Home / Tshirts / Printed Tshirt Coffee Black Color",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        productDetailsController.products[0]['name'] ?? '',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            productDetailsController.products[0]['regularPrice'] ?? '',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            productDetailsController.products[0]['price'] ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          const Text("+ Free Shipping", style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                      child: Text(
                        productDetailsController.products[0]['shortDescription'] ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              initialValue: "1",
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {},
                              child: const Text("ADD TO CART"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                        label: const Text("Add to Wishlist"),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text("Category: ",
                              style: TextStyle(color: Colors.grey)),
                          Text( productDetailsController.products[0]['productCategories']['name'] ?? '',
                              style: const TextStyle(color: Colors.redAccent)),
                        ],
                      ),
                    ),
                     const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Guaranteed Safe Checkout",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PaymentIcon(asset: Icons.credit_card),
                              PaymentIcon(asset: Icons.credit_score),
                              PaymentIcon(asset: Icons.account_balance),
                              PaymentIcon(asset: Icons.payment),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Text(
                        productDetailsController.products[0]['description'] ?? '',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("Reviews (${productDetailsController.products[0]['reviewCount'] ?? ''})", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Text(
                        "No reviews yet. Be the first to review this product.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                );
              }),

            ),

            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    Strings.youMayLike,
                    style: TextStyle(
                      color: AppColors.title415161,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),
            ),
            Obx(() {
              if (youMayLikeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (youMayLikeController.products.isEmpty) {
                return const Center(child: Text("No featured products found"));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: youMayLikeController.products.length,
                itemBuilder: (context, index) {
                  final product = youMayLikeController.products[index];

                  return YouMayLikeProductWidget(
                    productName: product['name'] ?? '',
                    description: product['slug'] ?? '',
                    price: product['price'] ??
                        product['regularPrice'] ??
                        '₹0.00', // Fallback if both are null
                    cuttedPrice: product['regularPrice'] ?? '',
                    imageUrl: product['image']?['sourceUrl'] ?? '',
                    productSlag: product['slug'] ?? '',
                  );
                },
              );
            }),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  const Text(
                    Strings.relatedProducts,
                    style: TextStyle(
                      color: AppColors.title415161,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),
            ),
            Obx(() {
              if (relatedProductsController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (relatedProductsController.products.isEmpty) {
                return const Center(child: Text("No related products found"));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: relatedProductsController.products.length,
                itemBuilder: (context, index) {
                  final product = relatedProductsController.products[index];

                  return RelatedProductWidget(
                    productName: product['name'] ?? '',
                    description: product['slug'] ?? '',
                    price: product['price'] ??
                        product['regularPrice'] ??
                        '₹0.00', // Fallback if both are null
                    cuttedPrice: product['regularPrice'] ?? '',
                    imageUrl: product['image']?['sourceUrl'] ?? '',
                    productSlag: product['slug'] ?? '',
                  );
                },
              );
            }),
            const SizedBox(height: 30),
            const  CustomFooter()
          ],
      ),
    );
  }
}

class PaymentIcon extends StatelessWidget {
  final IconData asset;

  const PaymentIcon({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Icon(asset, size: 50),
    );
  }
}
