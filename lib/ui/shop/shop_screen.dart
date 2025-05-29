import 'package:ecom_print_store/constants/assets.dart';
import 'package:ecom_print_store/ui/auth/register/register.dart';
import 'package:ecom_print_store/ui/global_widgets/footer_widget.dart';
import 'package:ecom_print_store/ui/home/filter_by_price_product_controller.dart';
import 'package:ecom_print_store/ui/home/hottest_deal_products_controller.dart';
import 'package:ecom_print_store/ui/home/widgets/client_review_card.dart';
import 'package:ecom_print_store/ui/home/widgets/feature_product_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/featured_in_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/home_banner_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/hottest_deal_product_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/price_filter_product_widget.dart';
import 'package:ecom_print_store/ui/home/widgets/shop_slidebar.dart';

import '../home/categories_controller.dart';
import 'controller.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  final ShopScreenController controller = Get.put(ShopScreenController());
  final CategoriesController categoriesController = Get.put(CategoriesController());
  final FilterByPriceProductController filterByPriceProductController = Get.put(FilterByPriceProductController());
  final HottestDealProductsController hottestDealProductsController = Get.put(HottestDealProductsController());

  @override
  void initState() {
    super.initState();
    categoriesController.fetchCategories();
    hottestDealProductsController.fetchHottestDealProducts();
    //controller.fetchFeaturedProducts();
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

          Expanded(
            child: Container(
              height: 600,
              child: ShopSidebar(categoriesController: categoriesController,filterByPriceProductController: filterByPriceProductController,),
            ),
          ),



        const  Padding(
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






              ],
            ),
          ),
          const SizedBox(height: 30),
          // Column(
          //   children: [

          //     const SizedBox(height: 16),

          //     const Text(
          //       Strings.ourfeatureProduct,
          //       style: TextStyle(
          //         color: AppColors.title415161,
          //         fontSize: 18,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     const SizedBox(height: 30),
          //     Container(height: 3, width: 30, color: AppColors.redFF5151),
          //     const SizedBox(height: 30),
          //   ],
          // ),



          Obx(() {
            if (filterByPriceProductController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (filterByPriceProductController.products.isEmpty) {
              return const Center(child: Text("No filter products found"));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filterByPriceProductController.products.length,
              itemBuilder: (context, index) {
                final product = filterByPriceProductController.products[index];

                return PriceFilterProductWidget(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: const Text(
                  Strings.hottestDeals,
                  style: TextStyle(
                    color: AppColors.title415161,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 30),

            ],
          ),

          Obx(() {
            if (hottestDealProductsController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (hottestDealProductsController.products.isEmpty) {
              return const Center(child: Text("No hottest deal products found"));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hottestDealProductsController.products.length,
              itemBuilder: (context, index) {
                final product = hottestDealProductsController.products[index];

                return HottestDealProductWidget(
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
