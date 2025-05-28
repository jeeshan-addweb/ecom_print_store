import 'package:ecom_print_store/constants/colors.dart';
import 'package:ecom_print_store/constants/dimens.dart';
import 'package:ecom_print_store/ui/auth/controller.dart';
import 'package:ecom_print_store/ui/auth/login/login.dart';
import 'package:ecom_print_store/ui/global_widgets/custom_buttons.dart';
import 'package:ecom_print_store/ui/global_widgets/input_fields.dart';
import 'package:ecom_print_store/utils/dart_extension/dart_utils.dart';
import 'package:ecom_print_store/utils/flutter/extension.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  // ------------ Controller ------------
  final _authController = Get.find<AuthController>();

  // ------------ Input Controller ---------------
  final _forgotPasswordController = TextEditingController();

  // ------------ Global Keys -----------------
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: Dimens.mobileScreenSize,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "forgotPasswordLabel".tr,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    20.szh(),
                    const Divider()
                  ],
                ),
                10.szh(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        inputController: _forgotPasswordController,
                        hintText: "enterEmailAddress".tr,
                        errorText: "pleaseEnterValidEmail".tr,
                      )
                    ],
                  ),
                ),
                20.szh(),
                CustomPrimaryButton(
                  buttonColor: AppColors.darkBlue,
                  textValue: "submit".tr,
                  textColor: AppColors.white,
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.forgotPassword(
                        email: _forgotPasswordController.text,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ).fromLTRB(24, 40.0, 24.0, 0),
    );
  }
}
