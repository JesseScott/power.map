import 'package:flutter/material.dart';

import 'domain/resources/Strings.dart';
import 'view/screens/Home.dart';

void main() => runApp(PowerMapApp());

class PowerMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.app_name,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(title: Strings.app_name),
    );
  }
}

