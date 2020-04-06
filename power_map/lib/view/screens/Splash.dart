import 'dart:async';

import 'package:flutter/material.dart';
import 'package:powermap/data/resources/Colors.dart';
import 'package:powermap/data/resources/Dimensions.dart';
import 'package:powermap/domain/navigation/Navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int timeoutLength = 2;

  // region - Overrides

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: timeoutLength), () {
      _hasSeenWalkthrough();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrandColors.colorPrimary,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(Dimensions.base_padding),
      child: _buildBody(),
    );
  }

  // endregion

  // region - Private

  Widget _buildBody() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: BrandColors.colorAccent,
      ),
    );
  }

  // endregion

  // region - Future Interactor

  _hasSeenWalkthrough() async {
    debugPrint('_hasSeenWalkthru');
    Navigation.goToHome(context);
  }

// endregion

}
