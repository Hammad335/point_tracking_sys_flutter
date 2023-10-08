import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/nav_drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  final NavDrawerController _controller = Get.find<NavDrawerController>();

  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home Page'),
            onTap: () {
              _controller.changeDrawerIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.train,
            ),
            title: const Text('Select Point'),
            onTap: () {
              _controller.changeDrawerIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.save,
            ),
            title: const Text('Saved Points'),
            onTap: () {
              // _controller.changeDrawerIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notification_add,
            ),
            title: const Text('Notifications'),
            onTap: () {
              // _controller.changeDrawerIndex(1);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
