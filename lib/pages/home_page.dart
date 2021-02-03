import 'package:eurpebet_main/widgets/tabs_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eurpebet_main/widgets/info_board.dart';

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
                          color: Theme.of(context).colorScheme.secondaryVariant,
                          shape: BoxShape.circle,
                        ),
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


  TabsBoard _createTabsBoard(){
    return TabsBoard();
  }

  InfoBoard _createInfoBoard() {
    return InfoBoard();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView(shrinkWrap: true, children: [
          _createTopBar(),
          _createTabsBoard(),
          _createInfoBoard(),
          ]),
      ),
    );
  }
}
