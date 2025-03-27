import 'package:firebase_conn/src/core/router/go_router_refresh.dart';
import 'package:firebase_conn/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AppCubit _appCubit = AppCubit();

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(stream: _appCubit.stream),
    redirect: (BuildContext context, GoRouterState state) {},
    routes: <RouteBase>[],
  );
}
