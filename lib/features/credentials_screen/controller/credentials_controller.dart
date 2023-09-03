import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/enums/enums.dart';
import '../../../core/models/models.dart';
import '../../../core/repository/auth_repo/auth_repo.dart';

class CredentialsController extends GetxController {
  late final AuthRepo _authRepo;

  late UserModel currentUser;
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  Rx<AuthMode> selectedAuthMode = AuthMode.Signin.obs;

  CredentialsController() {
    _authRepo = AuthRepo();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  AuthMode get getSelectedTab => selectedAuthMode.value;

  void authenticate() async {
    if (!formKey.currentState!.validate()) return;

    _showLoading();
    if (selectedAuthMode.value == AuthMode.Signup) {
      await _registerNewUser(
        userNameController.text,
        emailController.text,
        passwordController.text,
      );
    } else {
      await _loginUser(
        emailController.text,
        passwordController.text,
      );
    }
    _hideLoading();
  }

  Future<void> _registerNewUser(
      String userName, String email, String password) async {
    try {
      await _authRepo.registerUser(
        userName,
        email,
        password,
      );
    } catch (exception) {
      Get.snackbar('Error', exception.toString());
    }
  }

  Future<void> _loginUser(String email, String password) async {
    try {
      currentUser = await _authRepo.loginUser(
        email,
        password,
      );
      // _navigateToBottomNavScreen();
    } catch (exception) {
      Get.snackbar('Error', exception.toString());
    }
  }


  void toggleTabView(AuthMode credentialTab) {
    selectedAuthMode.value = credentialTab;
  }

  bool get isSignInMode => selectedAuthMode.value == AuthMode.Signin;

  void _showLoading() => isLoading.value = true;

  void _hideLoading() => isLoading.value = false;


  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
