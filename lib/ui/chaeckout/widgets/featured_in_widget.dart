import 'package:ecom_print_store/constants/assets.dart';
import 'package:flutter/material.dart';

class FeaturedInWidget extends StatelessWidget {
   FeaturedInWidget({super.key});
List<String> featuredInLogoList = [
    Assets.featuredInLogo,
    Assets.featuredInLogo1,
    Assets.featuredInLogo2,
    Assets.featuredInLogo3,
    Assets.featuredInLogo4
];
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal:  40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 30,
          mainAxisSpacing: 0,
          childAspectRatio: 1, 
        ),
        itemCount: featuredInLogoList.length, 
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            
            
            
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(featuredInLogoList[index])) 
            ),
            
              
            
          );
        },
      );
  }
}