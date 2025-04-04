import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s1/core/layout/todo/todo_app.dart';
import 'package:swd4_s1/core/shared/observer.dart';
import 'package:swd4_s1/features/bmi/presentation/screens/bmi_screen.dart';
import 'package:swd4_s1/features/counter/presentation/screens/counter_screen.dart';
import 'package:swd4_s1/features/login/presentation/screens/login_screen.dart';
import 'package:swd4_s1/features/messenger/presnetation/screens/messenger_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   useMaterial3: false
      // ),
      home: TodoApp(),
    );
  }
}


