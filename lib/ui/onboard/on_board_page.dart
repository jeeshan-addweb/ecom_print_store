import 'package:ecom_print_store/ui/auth/controller.dart';
import 'package:ecom_print_store/ui/auth/login/login_page.dart';
import 'package:ecom_print_store/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login/login.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Obx(() {
      if (!_authController.isLogged.value) {
        return  LoginScreen();
      } else {
        return const HomePage();
      }
    });
  }
}
