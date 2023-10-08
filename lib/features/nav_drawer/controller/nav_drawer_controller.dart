import 'package:get/get.dart';

class NavDrawerController extends GetxController {
  late RxInt currentIndex;

  NavDrawerController() {
    _init();
  }

  _init() {
    currentIndex = 0.obs;
  }

  void changeDrawerIndex(int index) => currentIndex.value = index;
}
