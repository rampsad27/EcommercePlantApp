import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/firebase_options.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/bloc/emailsign_up_bloc.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/emailsignup_repository.dart';
import 'package:plant_app/ui/modules/mycart/bloc/eventfirebase_bloc.dart';
import 'package:plant_app/ui/modules/mycart/event_repository.dart';

import 'package:plant_app/ui/modules/screen/homeScreen.dart';
import 'package:plant_app/ui/modules/theme/bloc/theme_bloc.dart';
import 'package:plant_app/ui/modules/theme/configs/app_theme.dart';

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
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => EmailSignUpRepository()),
        RepositoryProvider(create: (context) => EventRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EmailsignUpBloc(),
          ),
          BlocProvider(
            create: (context) =>
                EventBloc(eventRepository: context.read<EventRepository>()),
          ),
          BlocProvider(
            create: (context) => ThemeBloc()
              ..add(
                ThemeChangeRequested(themeData: AppTheme.lightTheme),
              ),
          ),
        ],
        child:
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: themeState is ThemeChanged
                ? themeState.themeData
                : AppTheme.lightTheme,
          );
        }),
      ),
    );
  }
}
