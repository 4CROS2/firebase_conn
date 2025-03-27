import 'package:firebase_conn/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<AppCubit>(() => AppCubit());
}
