import 'package:ecom_print_store/constants/assets.dart';
import 'package:ecom_print_store/ui/auth/register/register.dart';
import 'package:ecom_print_store/ui/global_widgets/footer_widget.dart';
import 'package:ecom_print_store/ui/home/feature_products_controller.dart';
import 'package:ecom_print_store/ui/home/widgets/client_review_card.dart';
import 'package:ecom_print_store/ui/home/widgets/feature_product_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/featured_in_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/home_banner_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/most_loved_product_widget.dart';
import 'package:ecom_print_store/ui/shop/shop_screen.dart';

import '../shop/controller.dart';
import 'most_loved_products_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MostLovedProductsController mostLovedProductsController = Get.put(MostLovedProductsController());
  final FeatureProductsController featureProductsController = Get.put(FeatureProductsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    featureProductsController.fetchFeaturedProducts();
    mostLovedProductsController.fetchMostLovedProducts();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const SizedBox(
                  width: 40,
                  child: Divider(
                    height: 40,
                    thickness: 3,
                    color: AppColors.redFF5151,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  Strings.bestQualityProducts,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.title415161,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  Strings.wePrintWhat,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: AppColors.title415161,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  Strings.homeqoute,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.title415161,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  Strings.homeqoute2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.title415161,
                  ),
                ),
                const SizedBox(height: 20),

                CustomButtonWithArrow(
                  buttonColor: AppColors.redFF5151,
                  textValue: Strings.getStarted,
                  textColor: AppColors.white,
                  onClick: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ShopScreen()));


                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Image.asset(Assets.homeDisplayImage),
              const SizedBox(height: 16),

              const Text(
                Strings.ourfeatureProduct,
                style: TextStyle(
                  color: AppColors.title415161,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Container(height: 3, width: 30, color: AppColors.redFF5151),
              const SizedBox(height: 30),
            ],
          ),

          Obx(() {
            if (featureProductsController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (featureProductsController.products.isEmpty) {
              return const Center(child: Text("No featured products found"));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: featureProductsController.products.length,
              itemBuilder: (context, index) {
                final product = featureProductsController.products[index];

                return FeatureProductWidgets(
                  productName: product['name'] ?? '',
                  description: product['slug'] ?? '',
                  price: product['price'] ??
                      product['regularPrice'] ??
                      '₹0.00', // Fallback if both are null
                  cuttedPrice: product['regularPrice'] ?? '',
                  imageUrl: product['image']?['sourceUrl'] ?? '',
                );
              },
            );
          }),
          const SizedBox(height: 30),
          const HomeBannerWidget(
            firstText: 'Hurry Up!',
            secondText: "Deal of the Day!",
            thirdText: "Buy This T-shirt At 20% Discount, Use Code Off20",
          ),
          const SizedBox(height: 16),

          Column(
            children: [
              const Text(
                Strings.mostLovedProducts,
                style: TextStyle(
                  color: AppColors.title415161,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Container(height: 3, width: 30, color: AppColors.redFF5151),
              const SizedBox(height: 30),
            ],
          ),

          Obx(() {
            if (mostLovedProductsController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (mostLovedProductsController.products.isEmpty) {
              return const Center(child: Text("No most loved products found"));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mostLovedProductsController.products.length,
              itemBuilder: (context, index) {
                final product = mostLovedProductsController.products[index];

                return MostLovedProductWidgets(
                  productName: product['name'] ?? '',
                  description: product['slug'] ?? '',
                  price: product['price'] ??
                      product['regularPrice'] ??
                      '₹0.00', // Fallback if both are null
                  cuttedPrice: product['regularPrice'] ?? '',
                  imageUrl: product['image']?['sourceUrl'] ?? '',
                );
              },
            );
          }),

          const SizedBox(height: 16),

          Column(
            children: [
              const Text(
                Strings.ourHappyClients,
                style: TextStyle(
                  color: AppColors.title415161,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Container(height: 3, width: 30, color: AppColors.redFF5151),
              const SizedBox(height: 30),
            ],
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const ClientReviewCard(
                rating: 5,
                reviewText:
                    "“Lectus, nonummy et. Occaecat delectus erat, minima dapibus ornare nunc, autem.”",
                clientName: "Diana Burnwood",
                clientImageUrl: "https://avatar.iran.liara.run/public/22",
              );
            },
          ),

          const SizedBox(height: 20),

          const Column(
            children: [
              Text(
                Strings.featuredIn,
                style: TextStyle(
                  color: AppColors.title415161,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
             SizedBox(height: 30),
            ],
          ),

          FeaturedInWidget(),
        const  CustomFooter()
        ],
      ),
    );
  }
}
