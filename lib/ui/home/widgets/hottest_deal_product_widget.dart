import 'package:ecom_print_store/constants/colors.dart';
import 'package:flutter/material.dart';

class HottestDealProductWidget extends StatefulWidget {
  final productName;
  final description;
  final price;
  final cuttedPrice;
  final imageUrl;

  const HottestDealProductWidget({
    super.key,
    required this.productName,
    required this.description,
    required this.price,
    required this.cuttedPrice,
    required this.imageUrl,
  });

  @override
  State<HottestDealProductWidget> createState() => _HottestDealProductWidgetState();
}

class _HottestDealProductWidgetState extends State<HottestDealProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(widget.imageUrl),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
          ),
          const SizedBox(height: 16),


        ],
      ),
    );
  }
}
