import 'package:flutter/material.dart';
import 'package:powermap/data/resources/Colors.dart';

class BaseProgress extends CircularProgressIndicator {
  final Color color;
  BaseProgress({this.color}) : super();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: BrandColors.colorAccent,
    );
  }
}
