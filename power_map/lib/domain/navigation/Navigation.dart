import 'package:flutter/material.dart';
import 'package:powermap/view/screens/Home.dart';
import 'package:powermap/view/screens/Tutorial.dart';

class Navigation {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(),
      ),
    );
  }

  static void goToTutorial(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TutorialScreen(),
      ),
    );
  }
}
