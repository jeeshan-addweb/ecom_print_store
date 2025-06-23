
import 'package:ecom_print_store/constants/colors.dart';
import 'package:ecom_print_store/constants/dimens.dart';
import 'package:ecom_print_store/ui/auth/controller.dart';
import 'package:ecom_print_store/ui/global_widgets/custom_buttons.dart';
import 'package:ecom_print_store/ui/global_widgets/custom_checkbox.dart';
import 'package:ecom_print_store/ui/global_widgets/input_fields.dart';
import 'package:ecom_print_store/utils/dart_extension/dart_utils.dart';
import 'package:ecom_print_store/utils/flutter/extension.dart';
import 'package:ecom_print_store/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // --------------------- Controller ---------------------
  final _authController = Get.find<AuthController>();

  // --------------------- Global Keys ---------------------
  final _loginFormKey = GlobalKey<FormState>();

  // --------------------- Input Fields ---------------------
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // --------------------- Variables ---------------------
  bool passwordVisible = false;

  // --------------------- Functions ---------------------
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void _loginRequested() async {
    if (_loginFormKey.currentState!.validate()) {
      // await _authController
      //     .login(emailController.text, passwordController.text)
      //     .then((value) {
      //   Get.offAllNamed(Routes.HOME);
      // });
      Get.offAllNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
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
                        "loginHeading".tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      20.szh(),
                      const Divider()
                    ],
                  ),
                  10.szh(),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        EmailTextField(
                          inputController: emailController,
                        ),
                        14.szh(),
                        PasswordInputField(
                          textEditingController: passwordController,
                        )
                      ],
                    ),
                  ),
                  22.szh(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomCheckbox(),
                      12.szh(),
                      Text("rememberMe".tr,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  32.szh(),
                  CustomPrimaryButton(
                    buttonColor: AppColors.darkBlue,
                    textValue: "loginLabel".tr,
                    textColor: Colors.white,
                    onClick: () {
                      _loginRequested();
                    },
                  ),
                  24.szh(),
                  Center(
                    child: Text(
                      'OR',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.grey),
                    ),
                  ),
                  24.szh(),
                  // Google Sign In
                  CustomPrimaryButton(
                    buttonColor: AppColors.lightGrey,
                    textValue: "loginWithGoogle".tr,
                    textColor: AppColors.black,
                    onClick: () {},
                  ),
                  50.szh(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "dontHaveAccount".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                      Text(
                        "registerLabel".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.darkBlue),
                      ).onTap(() {
                        Navigator.pushNamed(context, Routes.register);
                      }),
                    ],
                  ),
                  10.szh(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgotPassword);
                    },
                    child: Text(
                      "forgotPassword".tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.darkBlue, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ).fromLTRB(24, 40.0, 24.0, 0),
        ),
      ),
    );
  }
}
