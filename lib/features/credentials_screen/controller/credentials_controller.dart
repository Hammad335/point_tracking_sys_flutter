import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/utils/utils.dart';
import 'package:point_tracking_sys_flutter/routes/routes_names.dart';
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

  late Rx<AuthMode> _selectedAuthMode;

  CredentialsController() {
    _authRepo = AuthRepo();
    _selectedAuthMode = AuthMode.Signin.obs;
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  AuthMode get getSelectedTab => _selectedAuthMode.value;

  void authenticate() async {
    if (!formKey.currentState!.validate()) return;

    _showLoading();
    if (_selectedAuthMode.value == AuthMode.Signup) {
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
    String userName,
    String email,
    String password,
  ) async {
    try {
      await _authRepo.registerUser(
        userName,
        email,
        password,
      );
      Utils.showSuccessToast('User registered successfully');
    } catch (exception) {
      Utils.showErrorToast(exception.toString());
    }
  }

  Future<void> _loginUser(
    String email,
    String password,
  ) async {
    try {
      currentUser = await _authRepo.loginUser(
        email,
        password,
      );
      Get.offAllNamed(RoutesNames.NavDrawerScreen);
    } catch (exception) {
      Utils.showErrorToast(exception.toString());
    }
  }

  void toggleAuthMode() {
    _selectedAuthMode.value = _selectedAuthMode.value == AuthMode.Signup
        ? AuthMode.Signin
        : AuthMode.Signup;
  }

  bool get isSignInMode => _selectedAuthMode.value == AuthMode.Signin;

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
