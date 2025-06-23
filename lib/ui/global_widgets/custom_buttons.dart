import 'package:ecom_print_store/constants/colors.dart';
import 'package:ecom_print_store/utils/flutter/utilities/border_radius.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final VoidCallback onClick;

  const CustomPrimaryButton({
    Key? key,
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: FxRadius.all(14.0),
      elevation: 0,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: FxRadius.all(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onClick,
            borderRadius: FxRadius.all(14.0),
            child: Center(
              child: Text(
                textValue,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: textColor, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}







class CustomButtonWithArrow extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final VoidCallback onClick;

  const CustomButtonWithArrow({
    Key? key,
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: FxRadius.all(14.0),
      elevation: 0,
      child: Container(
        height: 42,
        width: MediaQuery.sizeOf(context).width*0.45,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: FxRadius.all(5.0),
        ),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onClick,
              borderRadius: FxRadius.all(5.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textValue,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: textColor, fontSize: 16),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp,color: AppColors.white,size: 16,)



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AddToCartButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final VoidCallback onClick;

  const AddToCartButton({
    Key? key,
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.sizeOf(context).width*0.45,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: FxRadius.all(5.0),
      ),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onClick,
            borderRadius: FxRadius.all(5.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textValue,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: textColor, fontSize: 14),
                  ),
                 
    
    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AddToCartButtonWithRadius extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final VoidCallback onClick;

  const AddToCartButtonWithRadius({
    Key? key,
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.sizeOf(context).width*0.45,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: FxRadius.all(12.0),
      ),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onClick,
            borderRadius: FxRadius.all(5.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textValue,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: textColor, fontSize: 14),
                  ),
                 
    
    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
