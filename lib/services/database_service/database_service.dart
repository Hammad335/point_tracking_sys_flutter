import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:point_tracking_sys_flutter/core/utils/utils.dart';

import '../../core/models/models.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> storeUserToFirestore(UserModel user) async {
    try {
      await _firebaseFirestore.collection('Users').doc(user.uId).set(
            user.toJsonWithoutId(),
          );
    } catch (_) {
      rethrow;
    }
  }

  Future<UserModel?> getCurrentUser(String uId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firebaseFirestore.collection('Users').doc(uId).get();
      final userJson = snapshot.data();
      if (snapshot.data() != null) {
        return UserModel(
            uId: uId,
            name: userJson!['name'],
            email: userJson['email'],
            isEmailVerified: userJson['isEmailVerified']);
      }
    } catch (_) {
      rethrow;
    }
    return null;
  }
}
