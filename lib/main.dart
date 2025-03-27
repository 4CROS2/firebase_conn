import 'package:firebase_conn/firebase_options.dart';
import 'package:firebase_conn/src/features/app/presentation/app.dart';
import 'package:firebase_conn/src/injection/injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await di.init();

  runApp(const App());
}
