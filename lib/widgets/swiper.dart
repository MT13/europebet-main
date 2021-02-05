import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eurpebet_main/dependencies/container.dart';
import 'package:eurpebet_main/dependencies/shape.dart';
import 'package:eurpebet_main/dependencies/custom_page_view.dart';
import 'package:eurpebet_main/serializables/game_unit.dart';
import 'package:eurpebet_main/serializables/jackpot.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Swiper extends StatefulWidget {
  Swiper(
      {Key key,
      this.hasIndicator = false,
      this.viewportFraction,
      @required this.numOfElements,
      @required this.data})
      : assert(numOfElements != null),
        assert(data != null),
        super(key: key);

  bool hasIndicator;
  double viewportFraction = 1;
  int numOfElements;
  List<GameUnit> data;

  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  Color _colorFromString(String color) {
    color = color.replaceAll("#", "").toUpperCase();
    String _valueString = "0xFF" + color;
    int value = int.parse(_valueString);
    return Color(value);
  }

  Widget _buildGameUnit(GameUnit unit) {
    Color _slotsJackpotColor = Color(0xFF1f85ba);
    if (unit.tags.isNotEmpty) {
      for (int i = 0; i < unit.tags.length; i++) {
        if (unit.tags[i].name == "SlotsJackpots") {
          _slotsJackpotColor = _colorFromString(unit.tags[i].color);
        }
      }
    }

    Widget label = Container(
      width: 80,
      height: 20,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            unit.labels.isNotEmpty
                ? Text(unit.labels[0].name)
                : Text("Exclusive"),
          ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: unit.labels.isNotEmpty
            ? _colorFromString(unit.labels[0].color)
            : Color(0xFFa3427a),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(-2.0, -2.0), // shadow direction: bottom right
          )
        ],
      ),
    );

    String _jackpotAmount = "Jackpot";
    if (unit.jackpots.isNotEmpty) {
      String _temp = unit.jackpots[0].amount.toString();
      _jackpotAmount = _temp.substring(0, _temp.length - 3);
    }

    Widget jackpot = Container(
      width: 120,
      height: 20,
      color: _slotsJackpotColor,
      child: Row(children: <Widget>[
        SvgPicture.asset(
          'assets/icons/diamond.svg',
          color: Colors.white,
        ),
        Text(_jackpotAmount + " \u20BE")
      ]),
    );

    Widget item = Container(
      child: Wrap(children: [
        Image.network(
          unit.image,
        )
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );

    return item;
  }

  Widget _buildPageView(bool hasIndicator) {
    List pageList = new List();
    for (var i = 0; i < widget.numOfElements; i++) {
      pageList.add(
        Padding(
          padding: EdgeInsets.only(
              left: 16, top: 16, bottom: hasIndicator ? 32 : 16),
          child: widget.data.isNotEmpty
              ? _buildGameUnit(widget.data[i])
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
        ),
      );
    }

    PageController pageController = PageController(
      viewportFraction: widget.viewportFraction,
    );

    Widget pageView = CustomPageView.builder(
        viewportDirection: false,
        controller: pageController,
        itemCount: widget.numOfElements,
        itemBuilder: (BuildContext context, int index) {
          return pageList[index];
        });

    return pageView;
  }

  @override
  Widget build(BuildContext context) {
    Widget pageView;

    if (widget.hasIndicator) {
      pageView = PageIndicatorContainer(
        child: _buildPageView(widget.hasIndicator),
        align: IndicatorAlign.bottom,
        indicatorColor: Colors.white.withOpacity(0.3),
        indicatorSelectorColor: Theme.of(context).colorScheme.secondary,
        length: widget.numOfElements,
        indicatorSpace: 8,
        shape: IndicatorShape.roundRectangleShape(
          size: Size(16, 4),
          cornerSize: Size.fromRadius(20),
        ),
      );
    } else {
      pageView = _buildPageView(widget.hasIndicator);
    }

    return pageView;
  }
}
