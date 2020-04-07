import 'package:flutter/cupertino.dart';
import 'package:powermap/data/repository/TutorialRepository.dart';
import 'package:powermap/view/widgets/TutorialPage.dart';

class TutorialInteractor {
  final TutorialRepository _repository;

  TutorialInteractor(TutorialRepository repository) : _repository = repository;

  Future<bool> getHasSeenTutorial() async {
    return await _repository.getHasSeenTutorial();
  }

  setHasSeenTutorial() {
    _repository.setHasSeenTutorial();
  }

  List<Widget> getTutorialPages() {
    var permissionSteps = _repository.getTutorialSteps();
    var permissionItems = permissionSteps.map((item) => TutorialPage(
          title: item.title,
          subtitle: item.subtitle,
          action: item.action,
        ));

    List<Widget> finalList = List();
    finalList.addAll(permissionItems.toList());
    return finalList;
  }
}
