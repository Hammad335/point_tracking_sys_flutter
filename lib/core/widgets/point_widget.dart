import 'package:flutter/material.dart';
import 'package:point_tracking_sys_flutter/core/models/models.dart';
import '../theme/colors.dart';

class PointWidget extends StatelessWidget {
  final Point point;
  final int? index;
  final Function? onFavoritePressed;

  const PointWidget({
    super.key,
    required this.point,
    this.index,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
