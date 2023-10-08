import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/constants/assets.dart';
import 'package:point_tracking_sys_flutter/core/styles/styles.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/core/utils/validator.dart';
import 'package:point_tracking_sys_flutter/core/widgets/widgets.dart';
import 'package:point_tracking_sys_flutter/features/credentials_screen/controller/credentials_controller.dart';

class CredentialsScreen extends StatelessWidget {
  final CredentialsController _controller = Get.find<CredentialsController>();

  CredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              aAuthScreenBackgroundImage,
              fit: BoxFit.fill,
              height: context.height,
              width: context.width,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              margin: const EdgeInsets.only(top: 120),
              child: Form(
                key: _controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => _controller.isSignInMode
                          ? const SizedBox.shrink()
                          : CustomTextField(
                              controller: _controller.userNameController,
                              hintText: 'User Name',
                              onValidate: Validator.validateUserName,
                            ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: _controller.emailController,
                      hintText: 'Email',
                      onValidate: Validator.validateEmail,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: _controller.passwordController,
                      hintText: 'Password',
                      onValidate: Validator.validatePassword,
                    ),
                    const SizedBox(height: 50),
                    Obx(
                      () => CustomButton(
                        label: _controller.isSignInMode ? 'Sign in' : 'Signup',
                        onPressed: _controller.authenticate,
                        width: 180,
                        height: 40,
                        textStyle: TextStyles.authButton18TextStyle,
                        backgroundColor: cPrimaryColor,
                      ),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'OR',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(
                      () => CustomTextButton(
                        label: _controller.isSignInMode
                            ? 'Create a new account'
                            : 'Already have an account ? Login',
                        textStyle: TextStyles.captionPrimary18TextStyle,
                        onPressed: _controller.toggleAuthMode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
