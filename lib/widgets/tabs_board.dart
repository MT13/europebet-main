import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eurpebet_main/api.dart';
import 'package:eurpebet_main/widgets/swiper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabsBoard extends StatefulWidget {
  TabsBoard({
    Key key,
  }) : super(key: key);

  @override
  _TabsBoardState createState() => _TabsBoardState();
}

class _TabsBoardState extends State<TabsBoard> {
  double _topSwiperHeight = 250;
  double _commonSwiperHeight = 200;
  double _padding = 16;

  Widget _swiperTopRow(Widget leftIcon, String text, [Widget rightIcon]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
          Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            leftIcon,
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(text),
            ),]),
            if (rightIcon != null)
            Row(children: [
                 rightIcon,
            ],),
          ],
        ),
    );
  }

  Widget _commonSwiper(String data) {
    return SizedBox(
      height: _commonSwiperHeight,
      child: Swiper(
        hasIndicator: false,
        viewportFraction: 0.4,
        numOfElements: 10,
        data: data,
      ),
    );
  }

  Widget _homePageView() {
    List<String> datas = new List<String>();
    for (var i = 0; i < 10; i++) {
      datas.add('$i');
    }

    Column column = Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: SizedBox(
          height: _topSwiperHeight,
          child: Swiper(
            hasIndicator: true,
            viewportFraction: 0.7,
            numOfElements: 11,
            data: null,
          ),
        ),
      ),
      _swiperTopRow(SvgPicture.asset('assets/icons/rocket.svg'),
          AppLocalizations.of(context).games),
      _commonSwiper(null),
      _swiperTopRow(SvgPicture.asset('assets/icons/thumbup.svg'),
          AppLocalizations.of(context).trending),
      _commonSwiper(null),
      _swiperTopRow(
          SvgPicture.asset('assets/icons/cross.svg'),
          AppLocalizations.of(context).liveCasino,
          SvgPicture.asset('assets/icons/return.svg')),
      _commonSwiper(null),
      _swiperTopRow(SvgPicture.asset('assets/icons/diamond.svg'),
          AppLocalizations.of(context).jackpots),
      _commonSwiper(null),
    ]);
    return column;
  }

  Widget _dummyTabView() {
    return Container(
        child: Center(
      child: Text("Not implemented yet =)"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Tab(text: AppLocalizations.of(context).home, icon: Icon(Icons.home),),
      Tab(text: AppLocalizations.of(context).sport, icon: Icon(Icons.sports_soccer),),
      Tab(text: AppLocalizations.of(context).live, icon: Icon(Icons.live_tv),),
      Tab(text: AppLocalizations.of(context).slots,icon: Icon(Icons.filter_7),),
      Tab(text: AppLocalizations.of(context).liveCasino,icon: Icon(Icons.add),),
      Tab(text: AppLocalizations.of(context).miniGames,icon: Icon(Icons.sports_esports_outlined),),
      Tab(text: AppLocalizations.of(context).poker,icon: Icon(Icons.style_outlined),),
      Tab(text: AppLocalizations.of(context).tableGames,icon: Icon(Icons.casino),),
      Tab(text: AppLocalizations.of(context).virtualGames,icon: Icon(Icons.movie_creation_outlined),),
      Tab(text: AppLocalizations.of(context).tvGames,icon: Icon(Icons.tv),),
      Tab(text: AppLocalizations.of(context).promotions,icon: Icon(Icons.campaign_outlined),),
    ];

    List<Widget> views = new List<Widget>();

    views.add(_homePageView());

    for (int i = 0; i < tabs.length - 1; i++) {
      views.add(_dummyTabView());
    }

    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              tabs: tabs,
              isScrollable: true,
              indicatorColor: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16),
              color: Theme.of(context).colorScheme.background,
              height:
                  _topSwiperHeight + 13 * _padding + 4 * _commonSwiperHeight,
              child: TabBarView(
                children: views,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
