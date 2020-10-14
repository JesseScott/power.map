import 'package:flutter/material.dart';
import 'package:powermap/data/resources/Colors.dart';
import 'package:powermap/data/resources/Strings.dart';
import 'package:powermap/data/resources/Style.dart';
import 'package:powermap/domain/bloc/TutorialBloc.dart';
import 'package:powermap/domain/navigation/Navigation.dart';
import 'package:powermap/view/widgets/BaseContainer.dart';
import 'package:powermap/view/widgets/TutorialPage.dart';

class TutorialScreen extends StatefulWidget {
  @override
  TutorialScreenState createState() {
    return TutorialScreenState();
  }
}

class TutorialScreenState extends State<TutorialScreen> {
  final tutorialBloc = TutorialBloc();
  final PageController controller = new PageController();

  int currentPage = 0;
  int maxPages = 1; // 0-based
  bool lastPage = false;

  // region - Overrides

  @override
  void initState() {
    super.initState();
    tutorialBloc.fetchAll();
  }

  @override
  void dispose() {
    tutorialBloc.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TutorialScreen oldWidget) {
    setState(() {

    });
    super.didUpdateWidget(oldWidget);
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
    return StreamBuilder(
      stream: tutorialBloc.allItems,
      builder: (context, AsyncSnapshot<List<TutorialPage>> snapshot) {
        if (snapshot.hasData) {
          return _buildPages(snapshot.data);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: BrandColors.colorAccent,
          ),
        );
      },
    );
  }

  Widget _buildPages(List<TutorialPage> pages) {
    debugPrint("PL: ${pages.length} ");
    return Container(
      color: BrandColors.colorPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 14,
            child: PageView(
              children: pages,
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
                      ? _markTutorialSeen()
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

  _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      lastPage = (currentPage == maxPages);
    });
  }

  _markTutorialSeen() {
    tutorialBloc.setHasSeenTutorial();
    Navigation.goToHome(context);
  }

// endregion

}
