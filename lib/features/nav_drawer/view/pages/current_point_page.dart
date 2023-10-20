import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/styles/styles.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/core/widgets/custom_button.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/current_point_controller.dart';

class CurrentPointPage extends StatelessWidget {
  final CurrentPointController _controller = Get.find<CurrentPointController>();

  CurrentPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Obx(
          () => _controller.currentPoint.value == null
              ? const Center(
                  child: Text('You are currently not in any point.'),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Column(
                    children: [
                      Container(width: context.width),
                      Text(
                        'Point ${_controller.currentPoint.value!.pointNumber}',
                        style: TextStyles.captionPrimarySemiBold22TextStyle,
                      ),
                      const SizedBox(height: 40),
                      ..._controller.currentPointUsers.value
                          .map(
                            (user) => Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: cPrimaryColor, width: 2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.account_box_rounded,
                                        size: 80,
                                        color: cPrimaryColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name: ${user.name}',
                                            style: TextStyles
                                                .captionBlackMedium18TextStyle,
                                          ),
                                          Text(
                                            'Department: ${user.department}',
                                            style: TextStyles
                                                .captionBlackMedium18TextStyle,
                                          ),
                                          Text(
                                            'Roll No: ${user.rollNo}',
                                            style: TextStyles
                                                .captionBlackMedium18TextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 30,
                                    child: CustomButton(
                                      label: 'Report',
                                      onPressed: () {},
                                      height: 30,
                                      width: 150,
                                      backgroundColor: cPrimaryColor,
                                      textStyle: TextStyles
                                          .captionWhite16MediumTextStyle,
                                      borderRadius: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
