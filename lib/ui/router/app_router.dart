import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/ui/modules/mycart/mycart.dart';
import 'package:plant_app/ui/modules/checkout/checkout.dart';
import 'package:plant_app/ui/modules/screen/loginScreen.dart';
import 'package:plant_app/ui/modules/menu/menuScreen.dart';
import 'package:plant_app/ui/modules/screen/onboarding.dart';
import 'package:plant_app/ui/modules/screen/orderDetails.dart';
import 'package:plant_app/ui/modules/screen/registerscreen.dart';
import 'package:plant_app/ui/modules/screen/welcomescreen.dart';
import 'package:plant_app/ui/modules/screen/homeScreen.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    // initialLocation: "/login",
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
      ),
      GoRoute(
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
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
        routes: [
          GoRoute(
            path: 'mycart',
            builder: (context, state) {
              return const MyCart();
            },
            routes: [
              GoRoute(
                path: 'checkout',
                builder: (context, state) {
                  return const Checkout();
                },
                routes: [
                  GoRoute(
                    path: 'orderDetails',
                    builder: (context, state) {
                      return const OrderDetails();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/menu',
        builder: (BuildContext context, GoRouterState state) {
          return const MenuScreen();
        },
      ),
    ],
  );
}
