import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/configs/extension/build_context_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: const [
              CreatePage(
                image: 'assets/img/2.png',
                title1: 'Best collection of',
                titleWithColor: 'indoor & outdoor',
                title2: 'plants',
                description:
                    'Adipisicing eiusmod sit elit laborum sunt culpa qui labore.',
              ),
              CreatePage(
                image: 'assets/img/3.png',
                title1: 'Keep your',
                titleWithColor: 'plants alive',
                description:
                    'Ex in nisi culpa nostrud proident dolor consectetur commodo labore amet consequat dolor proident veniam.',
              ),
              CreatePage(
                image: 'assets/img/4.png',
                title1: "Plan a tree &",
                titleWithColor: 'save the planet',
                description: 'Eiusmod laboris non elit sint elit aliqua.',
              ),
            ],
          ),
          Positioned(
            bottom: 120,
            left: 173,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const JumpingDotEffect(
                dotHeight: 10,
                dotWidth: 10,
                verticalOffset: 10,
                activeDotColor: Color(0xff296e48),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    } else {
                      context.go("/login");
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title1;
  final String titleWithColor;
  final String? title2;
  final String description;

  const CreatePage({
    Key? key,
    required this.image,
    required this.title1,
    required this.titleWithColor,
    this.title2,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: title1,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: titleWithColor,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 75, 142, 75),
                    ),
                  ),
                  TextSpan(
                    text: title2,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: appColor.primary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
