import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:truetask_app/welcome.dart';
// import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
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
          image: Image.asset("assets/keyboard.jpg", 
          width: 375,
          height: 428,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Be A Creative Person",
          body: "Millions of peoples can’t  Wait to see what you have to share",
          image: Image.asset("assets/keyboard.jpg", 
          width: 375,
          height: 428,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Be A Creative Person",
          body: "Millions of peoples can’t  Wait to see what you have to share",
          image: Image.asset("assets/keyboard.jpg", 
          width: 375,
          height: 428,
          ),
          decoration: pageDecoration,
          // footer: ElevatedButton(
          //   onPressed: (){
          //     Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => (Welcome()),),
          //     );
          //   }, 
          //   child: Text("Get Started"),
          // ),
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => (Welcome()),),
        );
      },
      showSkipButton: true,
      showNextButton: true,
      showBackButton: false,
      dotsFlex: 1,
      nextFlex: 1,
      skipOrBackFlex: 1,

      back: Icon(Icons.arrow_back),
      skip: Text("Skip",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      ),
      next: Icon(Icons.arrow_forward_ios),
      done: Text("Done",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        color: Colors.blue,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
      ),
    );



    // return Scaffold(
    //   body: Container(
    //     child: IntroductionScreen(
    //       globalBackgroundColor: Colors.white,
    //       scrollPhysics: BouncingScrollPhysics(),
    //       pages: [
    //         PageViewModel(
    //           titleWidget: Text(
    //             "Write Title of Page",
    //             style: TextStyle(
    //               fontSize: 30,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
