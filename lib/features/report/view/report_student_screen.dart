import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/core/widgets/custom_button.dart';
import 'package:point_tracking_sys_flutter/core/widgets/custom_text_field.dart';
import 'package:point_tracking_sys_flutter/features/report/controller/report_student_controller.dart';
import '../../../core/styles/styles.dart';

class ReportStudentScreen extends StatelessWidget {
  final ReportStudentController _controller =
      Get.find<ReportStudentController>();

  ReportStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  'Report Details',
                  style: TextStyles.captionBlack18TextStyle,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Enter report details here...',
                outlineInputBorder: true,
                minLines: 8,
                borderRadius: 6,
                contentPaddingLeft: 20,
                contentPaddingTop: 20,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: context.width,
                child: Text(
                  'Add Media (Optional)',
                  style: TextStyles.captionBlack18TextStyle,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    child: CustomButton(
                      label: 'Browse',
                      onPressed: () {},
                      backgroundColor: cPrimaryColor,
                      textStyle: TextStyles.captionWhite18SemiBoldTextStyle,
                      borderRadius: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '15MB Max',
                    style: TextStyles.captionBlackMedium18TextStyle
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 40,
                margin: const EdgeInsets.only(bottom: 10),
                child: CustomButton(
                  label: 'Submit',
                  onPressed: () {},
                  backgroundColor: cPrimaryColor,
                  textStyle: TextStyles.captionWhite18MediumTextStyle,
                  borderRadius: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
