import 'package:get/get.dart';
import 'package:point_tracking_sys_flutter/core/models/models.dart';
import 'package:point_tracking_sys_flutter/core/repository/database_repo/database_repo.dart';
import 'package:point_tracking_sys_flutter/core/utils/utils.dart';

class NavDrawerController extends GetxController {
  late final DatabaseRepo _databaseRepo;
  late Rx<UserModel?> currentUser;
  late RxBool isLoading;

  late RxInt currentIndex;

  NavDrawerController() {
    _init();
  }

  _init() {
    currentUser = (null as UserModel?).obs;
    isLoading = true.obs;
    currentIndex = 0.obs;
    _databaseRepo = DatabaseRepo();
    getUser();
  }

  void changeDrawerIndex(int index) => currentIndex.value = index;

  Future<void> getUser() async {
    try {
      isLoading.value = true;
      currentUser.value = await _databaseRepo.getCurrentUser();
    } catch (exception) {
      Utils.showErrorToast(exception.toString());
    }
    isLoading.value = false;
  }
}
