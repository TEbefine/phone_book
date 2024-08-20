import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phone_book/firebase_options.dart';

class UserRepository {
  static UserRepository? _instance;

  static UserRepository get instance =>
      _instance ??= UserRepository._internal();

  UserRepository._internal();

  User? _user;

  FirebaseAuth get _frbInstance => FirebaseAuth.instance;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _frbInstance.setPersistence(Persistence.LOCAL);
    _user = _frbInstance.currentUser;
  }

  Future<void> registerUser(String email, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
    } catch (e) {
      rethrow;
    }
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

  Future<void> changeUserName(String newName) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(newName);
    } catch (e) {
      throw Exception('Failed to update user name: $e');
    }
  }

  Future<void> deleteUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        _user = null;
        print('User deleted successfully.');
      } else {
        print('No user is signed in.');
      }
    } catch (e) {
      rethrow;
    }
  }

  User? get user => _user;
}
