import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/features/report/controller/report_student_controller.dart';

class ReportStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReportStudentController());
  }
}
