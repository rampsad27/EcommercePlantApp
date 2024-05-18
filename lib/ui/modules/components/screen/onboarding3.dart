import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 245, 240),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Image.asset(
                'assets/img/4.png',
                height: 400,
                width: 400,
              ),
              const Text(
                "Plant a tree & ",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Nexa',
                ),
              ),
              const Text(
                "green the earth",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nexa',
                ),
              ),
              const Text(
                "In publishing and graphic design, Lorem ipsumm is a placeholder text commonly used to demonstrate.",
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.go("/onboarding1/onboarding2/onboarding3/login");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  padding: const EdgeInsets.all(12),
                  child: const Center(child: Text("Get Started")),
                ),
              )
            ],
          ),
        ));
  }
}
