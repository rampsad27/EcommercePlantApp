import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            context.go("/onboarding1");
          },
          child: Image.asset(
            'assets/img/1.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          )),
    );
  }
}
