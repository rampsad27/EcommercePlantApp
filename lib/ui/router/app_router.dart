import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/ui/modules/screen/loginScreen.dart';
import 'package:plant_app/ui/modules/screen/onboarding1.dart';
import 'package:plant_app/ui/modules/screen/onboarding2.dart';
import 'package:plant_app/ui/modules/screen/onboarding3.dart';
import 'package:plant_app/ui/modules/screen/registerscreen.dart';
import 'package:plant_app/ui/modules/screen/welcomescreen.dart';
import 'package:plant_app/ui/modules/screen/homeScreen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
        routes: [
          GoRoute(
            path: 'onboarding1',
            builder: (context, state) {
              return const OnboardingScreen1();
            },
            routes: [
              GoRoute(
                path: 'login',
                builder: (BuildContext context, GoRouterState state) {
                  return const LoginScreen();
                },
                routes: [
                  GoRoute(
                    path: 'register',
                    builder: (BuildContext context, GoRouterState state) {
                      return const RegisterScreen();
                    },
                  ),
                  GoRoute(
                    path: 'home',
                    builder: (BuildContext context, GoRouterState state) {
                      return const HomeScreen();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'onboarding2',
                builder: (context, state) {
                  return const OnboardingScreen2();
                },
                routes: [
                  GoRoute(
                    path: 'login',
                    builder: (BuildContext context, GoRouterState state) {
                      return const LoginScreen();
                    },
                    routes: [
                      GoRoute(
                        path: 'register',
                        builder: (BuildContext context, GoRouterState state) {
                          return const RegisterScreen();
                        },
                      ),
                      GoRoute(
                        path: 'home',
                        builder: (BuildContext context, GoRouterState state) {
                          return const HomeScreen();
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'onboarding3',
                    builder: (context, state) {
                      return const OnboardingScreen3();
                    },
                    routes: [
                      GoRoute(
                        path: 'login',
                        builder: (BuildContext context, GoRouterState state) {
                          return const LoginScreen();
                        },
                        routes: [
                          GoRoute(
                            path: 'register',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              return const RegisterScreen();
                            },
                          ),
                          GoRoute(
                            path: 'home',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              return const HomeScreen();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
