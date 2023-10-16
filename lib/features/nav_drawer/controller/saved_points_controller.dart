import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/constants/data.dart';
import '../../../core/models/models.dart';

class SavedPointsController extends GetxController {
  late RxList<Point> savedPoints;

  SavedPointsController() {
    _init();
  }

  _init() {
    savedPoints = <Point>[].obs;
    _getSavedPoints();
  }

  _getSavedPoints() {
    savedPoints.value = List.from(savePoints);
  }

  addPointToSavedPoints(Point point) {
    savedPoints.value.add(point);
    savedPoints.refresh();
  }

  removePointFromSavedPoints(Point point) {
    savedPoints.value
        .removeWhere((element) => element.pointNumber == point.pointNumber);
    savedPoints.refresh();
  }
}
