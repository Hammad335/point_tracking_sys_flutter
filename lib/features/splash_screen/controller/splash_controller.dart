import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/routes/routes_names.dart';
import '../../../core/repository/auth_repo/auth_repo.dart';

class SplashController extends GetxController {
  late final AuthRepo _authRepo;

  SplashController() {
    _authRepo = AuthRepo();
    _navigateToCredentialsScreen();
  }

  _navigateToCredentialsScreen()async{
    WidgetsBinding.instance.addPostFrameCallback((_){
      Get.offAndToNamed(RoutesNames.CredentialsScreen);
    });

  }

}
