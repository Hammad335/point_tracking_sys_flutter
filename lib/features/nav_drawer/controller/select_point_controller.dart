import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/constants/data.dart';
import 'package:point_tracking_sys_flutter/features/nav_drawer/controller/saved_points_controller.dart';

import '../../../core/models/models.dart';

class SelectPointController extends GetxController {
  late final SavedPointsController _savedPointsController;
  late RxList<Point> allPoints;
  late RxList<Point> recentlyUsedPoints;

  SelectPointController() {
    _init();
  }

  _init() {
    _savedPointsController = Get.find<SavedPointsController>();
    allPoints = <Point>[].obs;
    recentlyUsedPoints = <Point>[].obs;
    _getAllPoints();
  }

  _getAllPoints() {
    allPoints.value = List.from(points);
    recentlyUsedPoints.value = List.from(points);
  }

  void onFavoritePressed(int index) {
    allPoints.value[index].toggleFavorite();
    allPoints.refresh();

    if (allPoints[index].isFav) {
      _savedPointsController.addPointToSavedPoints(allPoints[index]);
    } else {
      _savedPointsController.removePointFromSavedPoints(allPoints[index]);
    }
  }
}
