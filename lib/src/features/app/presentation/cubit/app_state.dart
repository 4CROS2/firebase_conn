part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => <Object>[];
}

class Authenticated extends AppState {
  const Authenticated({required this.user});

  final User user;

  @override
  List<Object> get props => <Object>[user];
}

class UnAuthenticated extends AppState {}

class LoadingApp extends AppState {}
