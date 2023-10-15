import 'package:firebase_auth/firebase_auth.dart';

import '../../../services/database_service/database_service.dart';
import '../../models/models.dart';

class DatabaseRepo {
  late final DatabaseService _databaseService;

  DatabaseRepo() {
    _databaseService = DatabaseService();
  }

  Future<void> storeUserToFirestore(UserModel user) async {
    try {
      await _databaseService.storeUserToFirestore(user);
    } catch (_) {
      rethrow;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        return await _databaseService.getCurrentUser(userId);
      }
    } catch (_) {
      rethrow;
    }
    return null;
  }
}
