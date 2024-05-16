import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Image.asset(
            'assets/img/3.png',
            height: 400,
            width: 400,
          ),
          const Text(
            "Best collection of ",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text(
            "indoor & outdoor plants",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text(
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate."),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: const Text("Skip")),
              const Spacer(),
              InkWell(
                onTap: () {},
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
