import 'package:ecom_print_store/ui/auth/register/register.dart';
import 'package:ecom_print_store/utils/dart_extension/dart_utils.dart';
import 'package:ecom_print_store/utils/flutter/extension.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  // ------------ Controller ------------
  final _authController = Get.find<AuthController>();

  // ------------ Input Controller ---------------
  final _oldPasswordCtlr = TextEditingController();
  final _newPasswordCtlr = TextEditingController();

  // ------------ Global Keys ------------
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
                      "resetPasswordLabel".tr,
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
                      PasswordInputField(
                        textEditingController: _oldPasswordCtlr,
                        hintText: "oldPasswordHint".tr,
                      ),
                      20.szh(),
                      PasswordInputField(
                        textEditingController: _newPasswordCtlr,
                        hintText: "newPasswordHint".tr,
                      ),
                    ],
                  ),
                ),
                20.szh(),
                CustomPrimaryButton(
                  buttonColor: AppColors.darkBlue,
                  textValue: "reset".tr,
                  textColor: AppColors.white,
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.resetPassword(
                        newPassword: _newPasswordCtlr.text,
                        oldPassword: _oldPasswordCtlr.text,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ).fromLTRB(24, 40.0, 24.0, 0),
      ),
    );
  }
}
