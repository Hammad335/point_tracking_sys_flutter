import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/widgets/my_drawer.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/nav_drawer_controller.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/view/pages/home_page.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/view/pages/saved_points_page.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/view/pages/select_point_page.dart';

class NavDrawerScreen extends StatelessWidget {
  final NavDrawerController _controller = Get.find<NavDrawerController>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  NavDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldState,
      drawer: MyDrawer(),
      drawerEnableOpenDragGesture: true,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() => _pages[_controller.currentIndex.value]),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                ),
                onPressed: () => _scaffoldState.currentState?.openDrawer(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _pages {
    return [
      HomePage(),
      SelectPointPage(),
      SavedPointsPage(),
    ];
  }
}
