import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:truetask_app/utils/routes.dart';

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 19,
        color: Colors.grey,
      ),
      bodyPadding: EdgeInsets.all(16),
    );
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Be A Creative Person",
          body: "Millions of peoples can’t  Wait to see what you have to share",
          image: Image.asset(
            "assets/image/keyboard.png",
            width: MediaQuery.of(context).size.width,
            // width: 375,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Be A Creative Person",
          body: "Millions of peoples can’t  Wait to see what you have to share",
          image: Image.asset(
            "assets/image/keyboard.png",
            width: MediaQuery.of(context).size.width,
            // width: 375,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Be A Creative Person",
          body: "Millions of peoples can’t  Wait to see what you have to share",
          image: Image.asset(
            "assets/image/keyboard.png",
            width: MediaQuery.of(context).size.width,
            // width: 375,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Navigator.pushReplacementNamed(context, welcomePage);
      },
      showSkipButton: true,
      showNextButton: true,
      showBackButton: false,
      dotsFlex: 1,
      nextFlex: 1,
      skipOrBackFlex: 1,
      back: const Icon(Icons.arrow_back),
      skip: const Text(
        "Skip",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      next: const Icon(Icons.arrow_forward_ios),
      done: const Icon(Icons.arrow_forward_ios),
      dotsDecorator: const DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
