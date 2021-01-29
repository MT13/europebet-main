import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  Container _createTopBar(){
    return Container(

    )
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: <Widget>[
            _createTopBar(),
            _createNavBar(),
            _createMainSwipe(),
            _createSwipesList(),
            _createBottomContainer(),
          ]
        )
      ),
    );
  }
}
