import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 245, 240),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/3.png',
                height: 400,
                width: 400,
              ),
              const Text(
                "Best collection of ",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Nexa',
                ),
              ),
              const Text(
                "indoor & outdoor plants",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        context.go("/onboarding1/login");
                      },
                      child: const Text("Skip")),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      context.go("/onboarding1/onboarding2");
                    },
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(12),
                      child: const Text("Next"),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
