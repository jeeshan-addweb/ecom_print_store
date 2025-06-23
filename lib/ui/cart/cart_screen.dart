import 'package:ecom_print_store/ui/chaeckout/checkout_screen.dart';
import 'package:ecom_print_store/ui/global_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cart",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                // Product Card 1
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildProductCard(
                      image: 'https://picsum.photos/seed/picsum/200/300',
                      title: 'Black Printed Coffee Mug - "Yellow", Large',
                      offer: '30%',
                      oldPrice: 60,
                      newPrice: 42,
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Product Card 2
                // _suggetionCard(
                //   image: 'https://picsum.photos/seed/picsum/200/300',
                //   title: 'Dark Teal Printed TShirt',
                //   price: 25,
                // ),
                const SizedBox(height: 16),
                // Coupon Entry
                _buildCouponBox(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: SizedBox(
                        height: 35,
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(12, 8, 8, 12),
                            hintText: 'Coupon code',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    AddToCartButton(
                      buttonColor: AppColors.redFF5151,
                      textValue: "APPLY COUPON",
                      textColor: AppColors.accentTextInputColor,
                      onClick: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                _buildCartTotals(context),
                _suggetionCard(
                  image: "https://picsum.photos/seed/picsum/200/300",
                  title: 'Black Printed Coffee Mug - "Yellow", Large',
                  oldPrice: 42,
                  newPrice: 30,
                  offer: "30%",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String title,
    required String offer,
    required double oldPrice,
    required double newPrice,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),

                image: DecorationImage(image: NetworkImage(image)),
              ),
            ),
            SizedBox(width: 4),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "₹$newPrice",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),

                      Text(
                        "₹$oldPrice",
                        style: const TextStyle(
                          fontSize: 14,
                          decorationColor: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // Text("Offer: $offer",
                  //     style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Quantity: ",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),

                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 30,
                          width: 35,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(Assets.deleteDash),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 35,
                        height: 30,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          controller: TextEditingController(text: "1"),
                        ),
                      ),

                      IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _suggetionCard({
    required String image,
    required String title,
    required String offer,
    required double oldPrice,
    required double newPrice,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),

                image: DecorationImage(image: NetworkImage(image)),
              ),
            ),
            SizedBox(width: 4),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "₹$newPrice",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),

                      Text(
                        "₹$oldPrice",
                        style: const TextStyle(
                          fontSize: 14,
                          decorationColor: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // Text("Offer: $offer",
                  //     style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AddToCartButtonWithRadius(
                      buttonColor: AppColors.yellowF3E141,
                      textValue: "ADD TO CART",
                      textColor: AppColors.black,
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponBox() {
    return Container(
      //  padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.redFF5151),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "10%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors.redFF5151,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Cart discount!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.redFF5151,
                      ),
                    ),
                  ],
                ),
                const Text("Coupon code for first user discount"),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.redFF5151.withOpacity(0.125),
                    borderRadius: BorderRadius.circular(6),
                  ),

                  child: const Center(
                    child: Text(
                      "first10",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: AppColors.redFF5151,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartTotals(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xffDDDDDD))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide.none,left: BorderSide.none,bottom: BorderSide(color: Color(0xffDDDDDD)))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Cart totals",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("Subtotal:"), Text("₹25.00")],
                ),
            const Divider(color: AppColors.greyDEDEDE,),
            const SizedBox(height: 8),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Shipping:"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text("Free shipping"), Text("Shipping to Gujarat")],
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Change address",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            const Divider(color: AppColors.greyDEDEDE,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("₹25.00", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            
            SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckoutPage()));

                          },
                          icon: const Icon(Icons.whatshot, color: Colors.white),
                          label:  Text("PROCEED TO CHECKOUT",style: TextStyle(color: AppColors.white),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            backgroundColor: AppColors.redFF5151,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
