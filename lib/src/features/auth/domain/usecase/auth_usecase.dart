import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_conn/src/features/auth/domain/repository/auth_repository.dart';

class AuthUsecase {
  AuthUsecase({required AuthRepository repository}) : _repository = repository;
  final AuthRepository _repository;

  Stream<User?> getUserState() => _repository.getUserState();

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      _repository.loginWithEmailAndPassword(email: email, password: password);

  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _repository.signupWithEmailAndPassword(email: email, password: password);
}
