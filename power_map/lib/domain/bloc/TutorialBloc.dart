import 'package:powermap/data/repository/TutorialRepository.dart';
import 'package:powermap/view/widgets/TutorialPage.dart';
import 'package:rxdart/rxdart.dart';

import 'Bloc.dart';

class TutorialBloc implements Bloc {
  final _repository = TutorialRepository();
  final _fetcher = PublishSubject<List<TutorialPage>>();

  Stream<List<TutorialPage>> get allItems => _fetcher.stream;

  @override
  fetchAll() async {
    var result = _repository.getTutorialSteps();
    var mappedSteps = result.map((item) => TutorialPage(
          title: item.title,
          subtitle: item.subtitle,
          action: item.action,
        ));
    _fetcher.sink.add(mappedSteps.toList());
  }

  @override
  dispose() {
    _fetcher.close();
  }

  Future<bool> getHasSeenTutorial() async =>
      await _repository.getHasSeenTutorial();

  setHasSeenTutorial() => _repository.setHasSeenTutorial();
}
