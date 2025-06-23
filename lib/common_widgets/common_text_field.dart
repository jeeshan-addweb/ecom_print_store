import 'package:ecom_print_store/constants/colors.dart';
import 'package:flutter/material.dart';

class CommonTextField {
  static Widget buildTextField(String label, {Widget? prefixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(color: AppColors.title415161),),
        
        Container(
          decoration: BoxDecoration(
            color:AppColors.white ,
            border: Border.all(color: AppColors.greyDEDEDE,),borderRadius: BorderRadius.circular(1)),
          child: TextField(
            
            decoration: InputDecoration(
          
          
    
          
              prefixIcon: prefixIcon,
              enabledBorder: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }




  
}