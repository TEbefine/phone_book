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
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    _user = userCredential.user;
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
    await FirebaseAuth.instance.signOut();
    _user = null;
  }

  Future<void> changeUserName(String newName) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(newName);
  }

  Future<void> deleteUser(String password) async {
    await FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(
            email: FirebaseAuth.instance.currentUser!.email!,
            password: password));
    await user?.delete();
    _user = null;
  }

  User? get user => _user;
}
