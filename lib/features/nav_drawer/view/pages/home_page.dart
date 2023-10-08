import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';
import 'package:point_tracking_sys_flutter/core/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
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
