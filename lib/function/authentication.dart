import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  static UserRepository? _instance;

  static UserRepository get instance =>
      _instance ??= UserRepository._internal();

  UserRepository._internal();

  User? _user;

  bool isLoggedIn() {
    return _user != null;
  }

  Future<void> signInUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _user = null;
    } catch (e) {
      rethrow;
    }
  }

  User? get user => _user;
}
