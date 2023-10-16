import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/saved_points_controller.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';

class SavedPointsPage extends StatelessWidget {
  final SavedPointsController _controller = Get.find<SavedPointsController>();

  SavedPointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(width: context.width),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
          ),
          child: SizedBox(
            width: 320,
            height: 50,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: 'Search location...',
              outlineInputBorder: true,
              fillColor: cWhiteColor,
              prefixIcon: const Icon(Icons.search),
              borderRadius: 10,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Your saved Points',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Obx(() {
                return Column(
                  children: _controller.savedPoints.value
                      .map(
                        (point) => PointWidget(
                          point: point,
                          onFavoritePressed:
                              _controller.removePointFromSavedPoints,
                        ),
                      )
                      .toList(),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
