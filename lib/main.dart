import 'package:flutter/material.dart';
import 'package:plant_app/ui/modules/screen/homeScreen.dart';

import 'package:plant_app/ui/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
    // MaterialApp.router(
    //   routerConfig: AppRouter.router,
    // );
  }
}
