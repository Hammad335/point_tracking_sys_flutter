import 'package:flutter/material.dart';
import 'package:point_tracking_sys_flutter/constants/data.dart';
import 'package:point_tracking_sys_flutter/core/utils/media_query.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';

class SavedPointsPage extends StatelessWidget {
  const SavedPointsPage({super.key});

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
              ...savePoints
                  .map(
                    (point) => Container(
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Area: ${point.area}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star,
                            color: cPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
