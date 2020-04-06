import 'package:flutter/material.dart';
import 'package:powermap/view/screens/Splash.dart';

import 'data/resources/Strings.dart';

void main() => runApp(PowerMapApp());

class PowerMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.app_name,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: SplashScreen(),
    );
  }
}
