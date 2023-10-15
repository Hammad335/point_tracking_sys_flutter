import 'package:firebase_auth/firebase_auth.dart';
import 'package:point_tracking_sys_flutter/core/models/models.dart';
import 'package:point_tracking_sys_flutter/core/repository/database_repo/database_repo.dart';
import 'package:point_tracking_sys_flutter/routes/routes_names.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../../services/database_service/database_service.dart';

class AuthRepo {
  late final AuthService _authService;
  late final DatabaseRepo _databaseRepo;

  AuthRepo() {
    _authService = AuthService();
    _databaseRepo = DatabaseRepo();
  }

  Future<void> registerUser(
      String userName, String email, String password) async {
    try {
      User user = await _authService.signUpWithEmailAndPassword(
        userName,
        email,
        password,
      );

      // store user data to firestore
      UserModel userModel = UserModel(
        uId: user.uid,
        name: userName,
        email: email,
      );
      await _databaseRepo.storeUserToFirestore(userModel);
    } catch (exception) {
      rethrow;
    }
  }

  Future<UserModel> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _authService.signInWithEmailAndPassword(
        email,
        password,
      );
      User user = userCredential.user!;
      return UserModel(
        uId: user.uid,
        name: user.displayName ?? '',
        email: email,
        isEmailVerified: user.emailVerified,
      );
    } catch (exception) {
      rethrow;
    }
  }

  // Future<UserModel> signInWithGoogle() async {
  //   try {
  //     UserCredential userCredential = await _authService.signInWithGoogle();
  //     User user = userCredential.user!;
  //     return UserModel(
  //       uId: user.uid,
  //       name: user.displayName ?? '',
  //       email: user.email ?? '',
  //       isEmailVerified: user.emailVerified,
  //     );
  //   } catch (exception) {
  //     rethrow;
  //   }
  // }

  bool isCurrentUserLoggedIn() {
    return _authService.isLoggedIn();
  }
}
