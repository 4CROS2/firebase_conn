import 'package:firebase_conn/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:firebase_conn/src/features/auth/data/datasource/auth_datasource.dart';
import 'package:firebase_conn/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:firebase_conn/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_conn/src/features/auth/domain/usecase/auth_usecase.dart';
import 'package:firebase_conn/src/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //datasource
sl.registerLazySingleton<IAuthDatasource>(() => IAuthDatasource(),);
  //repository
  sl.registerLazySingleton<AuthRepository>(() => IAuthRepository(
    datasource: sl<IAuthDatasource>()
  ));
  //usecase
  sl.registerLazySingleton<AuthUsecase>(
    () => AuthUsecase(repository: sl<AuthRepository>()),
  );
  //cubit
  sl.registerLazySingleton<AppCubit>(
    () => AppCubit(usecase: sl<AuthUsecase>()),
  );
  sl.registerFactory<LoginCubit>(() => LoginCubit());
}
