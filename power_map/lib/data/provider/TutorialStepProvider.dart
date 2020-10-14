import 'package:flutter/foundation.dart';
import 'package:powermap/data/model/TutorialStep.dart';
import 'package:powermap/data/resources/Strings.dart';

class TutorialStepProvider {
  static List<TutorialStep> steps = [
    TutorialStep(
      title: "Welcome",
      subtitle: "${Strings.app_name} is here!",
      action: () => testMethod(),
    ),
  ];

  static void testMethod() async {
    debugPrint('testMethod from TutorialStepProvider');
  }
}
