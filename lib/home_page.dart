import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_indicator/page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _padding = EdgeInsets.all(16.0);
  final _signInButtonWidth = 32;

  Widget _createTopBar() {
    return Padding(
      padding: _padding,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                      ),
                      child: Placeholder(
                        fallbackWidth: 35,
                        fallbackHeight: 36,
                      ),
                    ),
                  ]),
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context).register,
                        style: TextStyle(color: Colors.white)),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context).signIn,
                        style: TextStyle(color: Colors.white)),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
      ),
    );
  }
//TODO: alignment problem - write custom pageView?
  Widget _buildTopSlider(){
    List pageList = new List();
    for (var i = 0; i < 10; i++) {
      pageList.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
      );
    }

    PageController pageController = PageController(
      viewportFraction: 0.7,
    );

    final pageView = PageView.builder(
        controller: pageController,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return pageList[index];
        });

    var indicator = PageIndicatorContainer(
      child: pageView,
      padding: EdgeInsets.only(top: 16),
      align: IndicatorAlign.bottom,
      indicatorColor: Theme.of(context).colorScheme.onPrimary,
      indicatorSelectorColor: Theme.of(context).colorScheme.secondary,
      length: 10,
      indicatorSpace: 8,
      shape: IndicatorShape.roundRectangleShape(
        size: Size(16, 4),
        cornerSize: Size.fromRadius(20),
      ),
    );

    return indicator;
  }

  Widget _buildSlider(Color color){
    List pageList = new List();
    for (var i = 0; i < 10; i++) {
      pageList.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
      );
    }

    PageController pageController = PageController(
      viewportFraction: 0.4,
    );

    final pageView = PageView.builder(
        controller: pageController,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return pageList[index];
        });
    
    return Padding(padding: _padding, child: pageView,);
  }
  Widget _homePageView() {
    final topSlider = _buildTopSlider();
    final gamesSlider = _buildSlider(Colors.blue);
    final trendingSlider = _buildSlider(Colors.lightGreenAccent);
    final liveSlider = _buildSlider(Colors.purpleAccent);
    final jackpotsSlider = _buildSlider(Colors.deepOrangeAccent);

    Widget column = Column(

      children: <Widget>[
        topSlider,
        gamesSlider,
        trendingSlider,
        liveSlider,
        jackpotsSlider,
      ],
    );

    return topSlider;
  }

  Widget _dummyTabView() {
    return Container(
        child: Center(
      child: Text("Not implemented yet =)"),
    ));
  }

  DefaultTabController _createNavBar() {
    return DefaultTabController(
      length: 11,
      initialIndex: 0,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: AppLocalizations.of(context).home),
                Tab(text: AppLocalizations.of(context).sport),
                Tab(text: AppLocalizations.of(context).live),
                Tab(text: AppLocalizations.of(context).slots),
                Tab(text: AppLocalizations.of(context).liveCasino),
                Tab(text: AppLocalizations.of(context).miniGames),
                Tab(text: AppLocalizations.of(context).poker),
                Tab(text: AppLocalizations.of(context).tableGames),
                Tab(text: AppLocalizations.of(context).virtualGames),
                Tab(text: AppLocalizations.of(context).tvGames),
                Tab(text: AppLocalizations.of(context).promotions),
              ],
              isScrollable: true,
            ),
            Container(
                color: Theme.of(context).colorScheme.background,
                height: 300.0,
                child: TabBarView(
                  children: [
                    _homePageView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                    _dummyTabView(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Container _createMainSwipe() {
    return Container(child: Placeholder());
  }

  Container _createSwipeList() {
    return Container(child: Placeholder());
  }

  Container _createBottomContainer() {
    return Container(child: Placeholder());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(children: <Widget>[
            _createTopBar(),
            _createNavBar(),
            _createBottomContainer(),
          ]),
        ),
      ),
    );
  }
}
