import 'package:ecom_print_store/constants/colors.dart';
import 'package:ecom_print_store/ui/global_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/strings.dart';

class HomeBannerWidget extends StatelessWidget {
 final firstText;
  final secondText;
  final thirdText;
 
 
  const HomeBannerWidget({super.key,required this.firstText,required this.secondText,required this.thirdText});

  @override
  Widget build(BuildContext context) {
    return  Column(
            children: [
              Container(
                height: 280,
                width: MediaQuery.sizeOf(context).width,
                decoration:const BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(Assets.shopNowBanner),
                    fit: BoxFit.cover,
                  ),
                  
                ),

                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        firstText,
                        style: const TextStyle(
                          color: AppColors.title415161,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                     Text(
                    secondText,
                        style: const TextStyle(
                          color: AppColors.title415161,
                          fontSize:22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                       Text(
                        thirdText,
                        style: const TextStyle(
                          color: AppColors.title415161,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6,),
                      CustomButtonWithArrow(
                        buttonColor: AppColors.redFF5151,
                        textValue: Strings.shopNow,
                        textColor: AppColors.white,
                        onClick: () {},
                      ),
                    ],
                  ),
                ),
            )]);
  }
}