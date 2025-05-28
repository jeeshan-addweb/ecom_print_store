import 'package:ecom_print_store/ui/auth/bindings.dart';
import 'package:ecom_print_store/ui/auth/forgot_password/forgot_password_page.dart';
import 'package:ecom_print_store/ui/auth/login/login_page.dart';
import 'package:ecom_print_store/ui/auth/register/register_page.dart';
import 'package:ecom_print_store/ui/auth/reset_password/reset_password_page.dart';
import 'package:ecom_print_store/ui/home/binding.dart';
import 'package:ecom_print_store/ui/home/home_page.dart';
import 'package:ecom_print_store/ui/onboard/on_board_page.dart';
import 'package:ecom_print_store/utils/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => ResetPasswordPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnBoard(),
      binding: AuthBindings(),
    ),
  ];
}
