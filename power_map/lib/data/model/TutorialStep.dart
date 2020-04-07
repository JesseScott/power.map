import 'package:meta/meta.dart';

class TutorialStep {
  TutorialStep({
    @required this.title,
    @required this.subtitle,
    @required this.action,
  });

  final String title;
  final String subtitle;
  final Function action;
}
