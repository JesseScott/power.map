import 'package:flutter/widgets.dart';
import 'package:powermap/data/resources/Colors.dart';
import 'package:powermap/data/resources/Style.dart';

class BaseContainer extends Container {
  final Widget child;

  BaseContainer({this.child}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: BrandColors.colorPrimary,
        alignment: Alignment.center,
        padding: Style.BasePadding,
        child: child);
  }
}
