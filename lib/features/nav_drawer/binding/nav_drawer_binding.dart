import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/current_point_controller.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/home_page_controller.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/nav_drawer_controller.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/saved_points_controller.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/select_point_controller.dart';

class NavDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.put(SavedPointsController());
    Get.put(SelectPointController());
    Get.put(CurrentPointController());
    Get.put(NavDrawerController());
  }
}
