import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/core/widgets/custom_text_field.dart';
import 'package:point_tracking_sys_flutter/constants/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: kGooglePlex,
            mapType: MapType.normal,
          ),
          Positioned(
            top: 24,
            right: 10,
            child: SizedBox(
              width: 320,
              height: 40,
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
        ],
      ),
    );
  }
}
