import 'package:ecom_print_store/constants/assets.dart';
import 'package:ecom_print_store/constants/colors.dart';
import 'package:ecom_print_store/constants/strings.dart';
import 'package:ecom_print_store/ui/global_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

import '../product_details_screen.dart';

class YouMayLikeProductWidget extends StatefulWidget {
  final productName;
  final description;
  final price;
  final cuttedPrice;
  final imageUrl;
  final productSlag;

  const YouMayLikeProductWidget({
    super.key,
    required this.productName,
    required this.description,
    required this.price,
    required this.cuttedPrice,
    required this.imageUrl,
    required this.productSlag
  });

  @override
  State<YouMayLikeProductWidget> createState() => _YouMayLikeProductWidgetState();
}

class _YouMayLikeProductWidgetState extends State<YouMayLikeProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailsScreen(productSlug: widget.productSlag,)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(widget.imageUrl),
            const SizedBox(height: 8),
            Text(
              widget.productName,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(
                color: AppColors.title415161,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "s s s s",
              style: TextStyle(
                color: AppColors.orangeText,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.cuttedPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.grey,
                  ),
                ),
                const SizedBox(width: 4),

                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.title415161,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            AddToCartButton(
              buttonColor: AppColors.redFF5151,
              textValue: Strings.addToCart,
              textColor: AppColors.white,
              onClick: () {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                  width: 25,
                  child: Image(image: AssetImage(Assets.heartIcon)),
                ),
                const SizedBox(width: 4),
                Text(
                  Strings.addToWishlist,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.redFF5151,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
