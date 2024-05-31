import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/emailsignin_repository.dart';

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
    /// Change the duration accoriding to your need. you can remove this delay if you are doing some
    /// heavy async task like fetching data from DB/Server.
    await Future.delayed(const Duration(seconds: 2));
    var userInfo = getIt<EmailSignInRepository>().getUserInfoEmail();

    /// Don't use 'BuildContext's across async gaps.
    /// Try rewriting the code to not use the 'BuildContext', or guard the use with a 'mounted' check.
    ///
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
