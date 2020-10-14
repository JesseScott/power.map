import 'dart:async';

import 'package:flutter/material.dart';
import 'package:powermap/data/resources/Colors.dart';
import 'package:powermap/data/resources/Dimensions.dart';
import 'package:powermap/data/resources/Style.dart';
import 'package:powermap/domain/bloc/TutorialBloc.dart';
import 'package:powermap/domain/navigation/Navigation.dart';
import 'package:powermap/view/widgets/BaseContainer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int timeoutLength = 2;
  final tutorialBloc = TutorialBloc();

  // region - Overrides

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: timeoutLength), () {
      _hasSeenTutorial();
    });
  }

  @override
  void dispose() {
    tutorialBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: _buildView(),
    );
  }

  // endregion

  // region - Private

  Widget _buildView() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: BrandColors.colorAccent,
      ),
    );
  }

  // endregion

  // region - Future Interactor

  _hasSeenTutorial() async {
    bool result = await tutorialBloc.getHasSeenTutorial() == true;
    if (result) {
      debugPrint('User has seen tutorial');
      Navigation.goToHome(context);
    } else {
      debugPrint('User has NOT seen tutorial');
      Navigation.goToTutorial(context);
    }

  }

// endregion

}
