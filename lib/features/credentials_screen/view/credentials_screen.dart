import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:point_tracking_sys_flutter/constants/assets.dart';
import 'package:point_tracking_sys_flutter/core/styles/gradients.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/core/utils/media_query.dart';

class CredentialsScreen extends StatelessWidget {
  const CredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: context.width,
              height: 300,
              decoration: BoxDecoration(
                color: cPrimaryColor.withOpacity(0.6),
              ),
            ),
            Column(
              children: [
                SizedBox(height: context.height * 0.18),
                DottedBorder(
                  color: cImageBorderColor,
                  strokeWidth: 1,
                  dashPattern: const [8, 3],
                  child: Image.asset(
                    aPointTrackingSysTextImage,
                    width: context.width * 0.80,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    gradient: Gradients.authContainerGradient(),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
