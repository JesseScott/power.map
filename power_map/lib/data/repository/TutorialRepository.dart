import 'package:powermap/data/datasource/TutorialDataSource.dart';
import 'package:powermap/data/model/TutorialStep.dart';

class TutorialRepository {
  TutorialDataSource dataSource = new TutorialDataSource();

  Future<bool> getHasSeenTutorial() async => dataSource.getHasSeenTutorial();

  setHasSeenTutorial() async => dataSource.setHasSeenTutorial();

  List<TutorialStep> getTutorialSteps() => dataSource.getTutorialSteps();
}
