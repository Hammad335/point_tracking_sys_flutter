import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/binding/nav_drawer_binding.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/view/nav_drawer_screen.dart';
import 'package:point_tracking_sys_flutter/features/report/binding/report_student_binding.dart';
import 'package:point_tracking_sys_flutter/features/report/view/report_student_screen.dart';
import 'package:point_tracking_sys_flutter/routes/routes_names.dart';
import '../features/credentials_screen/bindings/credentials_bindings.dart';
import '../features/credentials_screen/view/credentials_screen.dart';
import '../features/splash_screen/bindings/splash_binding.dart';
import '../features/splash_screen/view/splash_screen.dart';

class Navigate {
  static List<GetPage>? routes = [
    GetPage(
      name: RoutesNames.SplashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesNames.CredentialsScreen,
      page: () => CredentialsScreen(),
      binding: CredentialsBindings(),
    ),
    GetPage(
      name: RoutesNames.NavDrawerScreen,
      page: () => NavDrawerScreen(),
      binding: NavDrawerBinding(),
    ),
    GetPage(
      name: RoutesNames.StudentsInPointScreen,
      page: () => ReportStudentScreen(),
      binding: ReportStudentBinding(),
    ),
  ];
}
