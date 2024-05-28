import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/authentication_repository.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _handleRouting();
  }

  void _handleRouting() async {
    await Future.delayed(const Duration(seconds: 2));
    var userInfo = getIt<AuthenticationRepository>().getUserInfo();

    if (Navigator.of(context).mounted) {
      if (userInfo.email.isEmpty) {
        context.go("/login");
      } else {
        context.go("/home");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/img/1.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
