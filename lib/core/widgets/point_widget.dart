import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:point_tracking_sys_flutter/constants/data.dart';
import 'package:point_tracking_sys_flutter/core/models/models.dart';
import 'package:point_tracking_sys_flutter/core/styles/styles.dart';
import 'package:point_tracking_sys_flutter/core/utils/media_query.dart';
import '../theme/colors.dart';

class PointWidget extends StatelessWidget {
  final Point point;
  final int? index;
  final Function? onPressed;
  final Function? onFavoritePressed;

  const PointWidget({
    super.key,
    required this.point,
    this.index,
    this.onPressed,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: context.width,
                height: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 10,
                      margin: const EdgeInsets.only(
                        top: 6,
                        bottom: 12,
                      ),
                      decoration: BoxDecoration(
                        color: cBottomSheetHolder,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Text(
                      point.pointNumber.toString(),
                      style: TextStyles.captionPrimarySemiBold22TextStyle,
                    ),
                    Text(
                      'Driver: ${point.driverName}',
                      style: TextStyles.captionBlack18TextStyle,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: cPrimaryColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          point.area,
                          style: TextStyles.captionBlack20MediumTextStyle,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const GoogleMap(
                            initialCameraPosition: kGooglePlex,
                            mapType: MapType.normal,
                            zoomControlsEnabled: false,
                          ),
                          Container(
                            width: 200,
                            height: 35,
                            margin: const EdgeInsets.only(bottom: 12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: cPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Live Track',
                              style: TextStyles.captionWhite16MediumTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: cPrimaryColor,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                point.pointNumber.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: cPrimaryColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Point Number: ${point.pointNumber}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Driver Name: ${point.driverName}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Area: ${point.area}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: Icon(point.isFav ? Icons.star : Icons.star_border),
              color: cPrimaryColor,
              onPressed: () {
                if (onFavoritePressed != null) {
                  if (index != null) {
                    onFavoritePressed!(index);
                  } else {
                    onFavoritePressed!(point);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
