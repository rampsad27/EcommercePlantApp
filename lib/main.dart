import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/firebase_options.dart';
import 'package:plant_app/ui/modules/screen/homeScreen.dart';

import 'package:plant_app/ui/router/app_router.dart';

Future<void> main() async {
  runApp(SizedBox(
    child: Image.asset(
      'assets/img/1.png',
      fit: BoxFit.cover,
    ),
  ));
  await Future.delayed(const Duration(seconds: 2));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
        //  MaterialApp(
        //   home:
        //   HomeScreen(),
        // );
        MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
