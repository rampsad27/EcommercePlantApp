import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/firebase_options.dart';

import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/bloc/emailsignin_bloc.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/emailsignin_repository.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/bloc/emailsign_up_bloc.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/emailsignup_repository.dart';
import 'package:plant_app/ui/modules/checkout/addressCheckout/bloc/address_bloc.dart';
import 'package:plant_app/ui/modules/imagePicker_camera/bloc/camera_bloc.dart';
import 'package:plant_app/ui/modules/menu/widgets/bloc/dark_mode_bloc.dart';
import 'package:plant_app/ui/modules/mycart/bloc/eventfirebase_bloc.dart';
import 'package:plant_app/ui/modules/mycart/event_repository.dart';

import 'package:plant_app/ui/modules/screen/homeScreen.dart';
import 'package:plant_app/ui/modules/screen/loginScreen.dart';
import 'package:plant_app/ui/modules/theme/bloc/theme_bloc.dart';
import 'package:plant_app/ui/modules/theme/configs/app_theme.dart';

import 'package:plant_app/ui/router/app_router.dart';

Future<void> main() async {
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
        RepositoryProvider(create: (context) => EmailSignInRepository())
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
          BlocProvider(create: (context) => ThemeBloc()),
          BlocProvider(create: (context) => DarkModeBloc()),
          BlocProvider(
              create: (context) => AddressBloc()..add(GetAddressEvent())),
          BlocProvider(
            create: (context) => EmailSigninBloc(
                emailSignInRepository: context.read<EmailSignInRepository>())
              ..add(CheckLoggedInUser()),
          ),
          BlocProvider(
            create: (context) => CameraBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return MaterialApp.router(
              routerConfig: AppRouter.router,
              theme: state is ThemeChanged
                  ? state.themeMode == ThemeMode.dark
                      ? AppTheme.darkTheme()
                      : AppTheme.lightTheme()
                  : AppTheme.lightTheme());
        }),
      ),
    );
  }
}
