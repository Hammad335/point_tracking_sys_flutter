import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/constants/data.dart';
import 'package:point_tracking_sys_flutter/routes/routes_names.dart';
import '../../../core/models/models.dart';

class CurrentPointController extends GetxController {
  late Rx<Point?> currentPoint;
  late RxList<UserModel> currentPointUsers;

  CurrentPointController() {
    _init();
  }

  _init() {
    currentPoint = Point(
      pointNumber: 43,
      driverName: 'Hamad',
      area: 'Qasimabad',
      isFav: true,
    ).obs;
    currentPointUsers = pointUsers.obs;
  }

  navigateToReportScreen(UserModel user) {
    Get.toNamed(
      RoutesNames.ReportScreen,
      arguments: user,
    );
  }
}
