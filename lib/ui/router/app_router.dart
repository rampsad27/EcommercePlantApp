import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/ui/modules/components/screen/onboarding1.dart';
import 'package:plant_app/ui/modules/components/screen/welcomescreen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: "/",
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
          },
          routes: [
            GoRoute(
                path: "onboarding1",
                builder: (context, state) {
                  return const OnboardingScreen1();
                })
          ]),
    ],
  );
}
