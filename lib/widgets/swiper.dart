import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:custom_page_view/custom_page_view.dart';

class Swiper extends StatefulWidget {
  Swiper(
      {Key key,
      this.hasIndicator = false,
      this.viewportFraction,
      @required
      this.numOfElements,
      @required this.data})
      : assert(numOfElements != null),
        super(key: key);

  bool hasIndicator;
  double viewportFraction = 1;
  int numOfElements;
  final String data;

  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {

  Widget _buildPageView(bool hasIndicator) {

    List pageList = new List();
    for (var i = 0; i < widget.numOfElements; i++) {
      pageList.add(
        Padding(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: hasIndicator ? 32 : 16 ),
          child: Container(
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
