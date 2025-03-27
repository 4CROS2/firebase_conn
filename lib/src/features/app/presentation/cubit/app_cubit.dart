import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_conn/src/features/app/domain/usecase/app_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required AppUsecase usecase})
    : _usecase = usecase,
      super(LoadingApp()) {
    _appSubscription();
  }

  final AppUsecase _usecase;

  late StreamSubscription<User?> _subscription;

  void _appSubscription() {
    _subscription = _usecase.getUserState().listen(
      _onAuthenticated,
      onError: (Object object) {
        _onUnAuthenticated();
      },
    );
  }

  void _onAuthenticated(User? user) {
    if (user != null) {
      emit(Authenticated(user: user));
    } else {
      _onUnAuthenticated();
    }
  }

  void _onUnAuthenticated() {
    emit(UnAuthenticated());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
