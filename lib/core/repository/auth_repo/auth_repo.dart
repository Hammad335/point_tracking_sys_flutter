import 'package:firebase_auth/firebase_auth.dart';
import 'package:point_tracking_sys_flutter/core/models/models.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../../services/database_service/database_service.dart';

class AuthRepo {
  late final AuthService _authService;
  late final DatabaseService _databaseService;

  AuthRepo() {
    _authService = AuthService();
    _databaseService = DatabaseService();
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
      await _addToFirestore(user);
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

  _addToFirestore(User user) async =>
      await _databaseService.addToFirestore(user);

  String getInitialRoute() {
    // return _authService.isLoggedIn()
    //     ? BottomNavScreen.name
    //     : CredentialsScreen.name;
    return '';
  }
}
