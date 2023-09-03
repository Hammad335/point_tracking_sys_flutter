import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late final FirebaseAuth _auth;
  // late final GoogleSignIn _googleSignIn;

  AuthService() {
    _auth = FirebaseAuth.instance;
    // _googleSignIn = GoogleSignIn();
  }

  Future<User> signUpWithEmailAndPassword(
    String userName,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;
      user.updateDisplayName(userName);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     return await _auth.signInWithCredential(credential);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      // await _signOutFromGoogle();
      await _auth.signOut();
      // currentUser.value = null;
    } catch (e) {
      rethrow;
    }
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  // Future<void> _signOutFromGoogle() async =>
  //     await _googleSignIn.isSignedIn() ? _googleSignIn.signOut() : null;
}
