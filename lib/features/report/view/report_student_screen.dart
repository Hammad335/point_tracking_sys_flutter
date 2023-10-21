import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/features/report/controller/report_student_controller.dart';
import '../../../core/styles/styles.dart';

class ReportStudentScreen extends StatelessWidget {
  final ReportStudentController _controller =
      Get.find<ReportStudentController>();

  ReportStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width,
                height: 22,
              ),
              Text(
                'Report',
                style: TextStyles.captionPrimarySemiBold22TextStyle,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You are reporting',
                    style: TextStyles.captionBlack18TextStyle,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _controller.user.name!,
                    style: TextStyles.captionBlack18TextStyle.copyWith(
                      color: cPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                'Roll No: ${_controller.user.rollNo!}',
                style: TextStyles.captionBlackMedium18TextStyle,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: context.width,
                child: Text(
                  'Name',
                  style: TextStyles.captionBlack18TextStyle,
                ),
              ),
              SizedBox(
                width: context.width,
                child: Text(
                  'Roll No',
                  style: TextStyles.captionBlack18TextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
