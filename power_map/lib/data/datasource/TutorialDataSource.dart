import 'package:powermap/data/model/TutorialStep.dart';
import 'package:powermap/data/provider/TutorialStepProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialDataSource {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static const String HAS_SEEN_TUTORIAL = "HAS_SEEN_TUTORIAL";

  TutorialDataSource();

  // region - Tutorial Steps

  List<TutorialStep> getTutorialSteps() => TutorialStepProvider.steps;

  // endregion

  // region - SP

  Future<bool> getHasSeenTutorial() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getBool(HAS_SEEN_TUTORIAL);
  }

  setHasSeenTutorial() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(HAS_SEEN_TUTORIAL, true);
  }

// endregion

}
