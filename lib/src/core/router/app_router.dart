import 'package:firebase_conn/src/core/router/go_router_refresh.dart';
import 'package:firebase_conn/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:firebase_conn/src/features/auth/presentation/login/login.dart';
import 'package:firebase_conn/src/features/home/home.dart';
import 'package:firebase_conn/src/features/loading/loading.dart';
import 'package:firebase_conn/src/features/test/presentation/test.dart';
import 'package:firebase_conn/src/injection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AppCubit _appCubit = sl<AppCubit>();

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(stream: _appCubit.stream),
    redirect: (BuildContext context, GoRouterState state) {
      final AppState appStatus = _appCubit.state;
      if (appStatus is Authenticated && state.matchedLocation == '/') {
        return '/home';
      }
      if (appStatus is Authenticated && state.matchedLocation == '/login') {
        return '/home';
      }

      if (appStatus is UnAuthenticated && state.matchedLocation != '/login') {
        return '/login';
      }
      if (appStatus is LoadingApp && state.matchedLocation == '/') {
        return '/';
      }
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Loading();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return Login();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return Home();
        },
      ),
      GoRoute(
        path: '/test',
        builder: (BuildContext context, GoRouterState state) => Test(),
      ),
    ],
  );
}
