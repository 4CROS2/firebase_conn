import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
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
