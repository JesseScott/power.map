import 'package:flutter/material.dart';
import 'package:powermap/data/resources/Colors.dart';
import 'package:powermap/data/resources/Dimensions.dart';
import 'package:powermap/data/resources/Style.dart';

class TutorialPage extends StatefulWidget {
  final title;
  final subtitle;
  final action;

  TutorialPage({
    this.title,
    this.subtitle,
    this.action,
  });

  @override
  TutorialPageState createState() {
    return TutorialPageState();
  }
}

class TutorialPageState extends State<TutorialPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: -250.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animation.addListener(() => setState(() {}));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(Dimensions.base_padding),
      child: Material(
        animationDuration: Duration(milliseconds: 250),
        color: BrandColors.colorPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: Dimensions.large_padding),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: Style.OnboardingHeaderTextStyle,
              ),
            ),
            SizedBox(height: Dimensions.large_padding),
            Text(
              widget.subtitle,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Style.OnboardingTitleTextStyle,
            ),
            SizedBox(height: Dimensions.large_padding),
            FlatButton(
              onPressed: widget.action,
              padding: EdgeInsets.all(Dimensions.base_padding),
              child: Text('click me'),
            ),
          ],
        ),
      ),
    );
  }
}
