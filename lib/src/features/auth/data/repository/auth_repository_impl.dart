import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_conn/src/features/auth/data/datasource/auth_datasource.dart';
import 'package:firebase_conn/src/features/auth/domain/repository/auth_repository.dart';

class IAuthRepository implements AuthRepository {
  IAuthRepository({required IAuthDatasource datasource})
    : _datasource = datasource;
  final IAuthDatasource _datasource;

  @override
  Stream<User?> getUserState() => _datasource.getUserState();

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) => _datasource.loginWithEmailAndPassword(email: email, password: password);

  @override
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _datasource.signupWithEmailAndPassword(email: email, password: password);
}
