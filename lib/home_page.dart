import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  Container _createNavBar() {
    return Container(child: Placeholder());
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(children: <Widget>[
            _createTopBar(),
            _createNavBar(),
            _createMainSwipe(),
            _createSwipeList(),
            _createBottomContainer(),
          ]),
        ),
      ),
    );
  }
}
