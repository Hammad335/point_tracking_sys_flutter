import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/styles/styles.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/nav_drawer_controller.dart';

import '../../constants/assets.dart';

class MyDrawer extends StatelessWidget {
  final NavDrawerController _controller = Get.find<NavDrawerController>();

  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      backgroundColor: cWhiteColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      width: context.width * 0.80,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          navHeader(context),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: cPrimaryColor,
                    size: 32,
                  ),
                  title: Text(
                    'Home Page',
                    style: TextStyles.navDrawerItem18TextStyle,
                  ),
                  onTap: () {
                    _controller.changeDrawerIndex(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.train,
                    color: cPrimaryColor,
                    size: 32,
                  ),
                  title: Text(
                    'Select Point',
                    style: TextStyles.navDrawerItem18TextStyle,
                  ),
                  onTap: () {
                    _controller.changeDrawerIndex(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.save,
                    color: cPrimaryColor,
                    size: 32,
                  ),
                  title: Text(
                    'Saved Points',
                    style: TextStyles.navDrawerItem18TextStyle,
                  ),
                  onTap: () {
                    _controller.changeDrawerIndex(2);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.notification_add,
                    color: cPrimaryColor,
                    size: 32,
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyles.navDrawerItem18TextStyle,
                  ),
                  onTap: () {
                    // _controller.changeDrawerIndex(3);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget navHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        width: context.width * 0.80,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(bottom: 30),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              aNavHeaderBackgroundImage,
              width: context.width * 0.80,
              fit: BoxFit.fill,
            ),
            Obx(
              () => _controller.isLoading.value ||
                      _controller.currentUser.value == null
                  ? const SizedBox.shrink()
                  : Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: cBlueVarian_63_opacity,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                Text(
                                  _controller.currentUser.value!.name,
                                  style: TextStyles
                                      .captionWhite18SemiBoldTextStyle,
                                ),
                                Text(
                                  _controller.currentUser.value!.email,
                                  style:
                                      TextStyles.captionWhite16MediumTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
