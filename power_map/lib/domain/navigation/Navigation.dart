import 'package:flutter/material.dart';
import 'package:powermap/view/screens/Home.dart';

class Navigation {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(),
      ),
    );
  }
}
