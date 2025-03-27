import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_conn/src/features/auth/domain/repository/auth_repository.dart';

class AppUsecase {
  AppUsecase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Stream<User?> getUserState()=>_authRepository.getUserState();
}
