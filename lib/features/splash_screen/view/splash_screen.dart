import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/features/splash_screen/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController _controller= Get.find<SplashController>();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
