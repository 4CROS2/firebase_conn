import 'package:firebase_auth/firebase_auth.dart';

sealed class AuthDatasource {
  Stream<User?> getUserState();

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class IAuthDatasource implements AuthDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<User?> getUserState() {
    return _auth.userChanges();
  }

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
