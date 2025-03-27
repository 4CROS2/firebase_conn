import 'package:firebase_conn/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:firebase_conn/src/injection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (BuildContext context) => sl<AppCubit>(),
      child: MaterialApp.router(
        
      ),
    );
  }
}
