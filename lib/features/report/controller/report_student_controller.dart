import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/models/models.dart';

class ReportStudentController extends GetxController {
  late UserModel user;

  ReportStudentController() {
    _init();
  }

  _init() {
    user = Get.arguments as UserModel;
  }
}
