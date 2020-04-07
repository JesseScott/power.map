import 'package:flutter/material.dart';
import 'package:powermap/data/resources/Colors.dart';
import 'package:powermap/data/resources/Strings.dart';
import 'package:powermap/data/resources/Style.dart';
import 'package:powermap/domain/interactor/TutorialInteractor.dart';
import 'package:powermap/domain/navigation/Navigation.dart';

class TutorialScreen extends StatefulWidget {
  @override
  TutorialScreenState createState() {
    return TutorialScreenState();
  }
}

class TutorialScreenState extends State<TutorialScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  int maxPages = 1; // 0-based
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      lastPage = (currentPage == maxPages);
    });
  }

  @override
  Widget build(BuildContext context) {
    TutorialInteractor interactor =
    InjectorWidget.of(context).getTutorialInteractor();

    return Container(
      color: BrandColors.colorPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 14,
            child: PageView(
              children: interactor.getTutorialPages(),
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    lastPage ? "" : Strings.skip,
                    style: Style.PagerTextStyle,
                  ),
                  onPressed: () =>
                  lastPage ? null : Navigation.goToHome(context),
                ),
                FlatButton(
                  child: Text(
                    lastPage ? Strings.ok : Strings.next,
                    style: Style.PagerTextStyle,
                  ),
                  onPressed: () => lastPage
                      ? markTutorialSeen(interactor)
                      : controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  markTutorialSeen(TutorialInteractor interactor) {
    interactor.setHasSeenTutorial();
    Navigation.goToHome(context);
  }
}
