import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/styles/styles.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/select_point_controller.dart';

import '../../../../constants/assets.dart';
import '../../../../core/models/models.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';

class SelectPointPage extends StatelessWidget {
  final SelectPointController _controller = Get.find<SelectPointController>();

  SelectPointPage({super.key});

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
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      'Recently Used Points',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                        itemCount: _controller.recentlyUsedPoints.value.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Point point = _controller.recentlyUsedPoints[index];
                          return Container(
                            width: 180,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: cImageBorderColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  aPointImage,
                                  height: 120,
                                ),
                                Text(
                                  'Point No: ${point.pointNumber}',
                                  style:
                                      TextStyles.captionBlack20MediumTextStyle,
                                ),
                                Text(
                                  'Area: ${point.area}',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyles.captionBlack20MediumTextStyle,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 30),
                    child: Text(
                      'Select Point To Track',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Obx(() {
                    return Column(
                      children: List.generate(
                        _controller.allPoints.length,
                        (index) => PointWidget(
                          point: _controller.allPoints[index],
                          index: index,
                          onFavoritePressed: _controller.onFavoritePressed,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
