import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eurpebet_main/api.dart';


class InfoBoard extends StatefulWidget {
  InfoBoard({
    Key key,
  }) : super(key: key);

  @override
  _InfoBoardState createState() => _InfoBoardState();
}


class _InfoBoardState extends State<InfoBoard> {
  TextButton _buildContactButton(Widget icon, String text) {
    return TextButton(
      onPressed: null,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 4),
          child: icon,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ]),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
      ),
    );
  }

  Widget _languages() {
    return Center(
      child: TextButton(
        onPressed: null,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: Image.asset('icons/flags/png/gb.png',
                      package: 'country_icons')
                      .image,
                ),
              ),
              Text(
                "English",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Icon(Icons.keyboard_arrow_down),
            ]),
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  Widget _contacts() {
    final Widget chatIcon = SvgPicture.asset(
      'assets/icons/chat.svg',
      color: Theme.of(context).colorScheme.secondary,
    );

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: _buildContactButton(
                  chatIcon, AppLocalizations.of(context).liveChat),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: _buildContactButton(
                  Icon(Icons.smartphone,
                      color: Theme.of(context).colorScheme.secondary),
                  AppLocalizations.of(context).phone),
            ),
          ),
        ],
      ),
    );
  }

  Widget _panel() {
    List<String> productsTexts = [
      AppLocalizations.of(context).home,
      AppLocalizations.of(context).sport,
      AppLocalizations.of(context).live,
      AppLocalizations.of(context).slots,
      AppLocalizations.of(context).liveCasino,
      AppLocalizations.of(context).miniGames,
      AppLocalizations.of(context).poker,
      AppLocalizations.of(context).tableGames,
      AppLocalizations.of(context).virtualGames,
      AppLocalizations.of(context).tvGames,
      AppLocalizations.of(context).promotions,
    ];

    List<Widget> productsList = List.generate(productsTexts.length, (index) {
      return InkWell(
        child: Text(productsTexts[index]),
        onTap: null,
      );
    });

    List<String> europebetTexts = [
      AppLocalizations.of(context).aboutUs,
      AppLocalizations.of(context).betssonGroup,
      AppLocalizations.of(context).termsAndConditions,
      AppLocalizations.of(context).privacyStatement,
      AppLocalizations.of(context).responsibleGaming,
      AppLocalizations.of(context).eighteenPlus,
    ];

    List<Widget> europebetList = List.generate(europebetTexts.length, (index) {
      return InkWell(
        child: Text(europebetTexts[index]),
        onTap: null,
      );
    });

    List<String> helpTexts = [
      AppLocalizations.of(context).contactUs,
      AppLocalizations.of(context).faq,
      AppLocalizations.of(context).cashDesk,
    ];

    List<Widget> helpList = List.generate(helpTexts.length, (index) {
      return InkWell(
        child: Text(helpTexts[index]),
        onTap: null,
      );
    });

    List<String> followTexts = [
      AppLocalizations.of(context).facebook,
      AppLocalizations.of(context).youtube,
    ];

    List<Widget> followList = List.generate(followTexts.length, (index) {
      return InkWell(
        child: Text(followTexts[index]),
        onTap: null,
      );
    });

    List<Item> data = [
      Item(text: AppLocalizations.of(context).products, list: productsList),
      Item(text: AppLocalizations.of(context).europebet, list: europebetList),
      Item(text: AppLocalizations.of(context).help, list: helpList),
      Item(text: AppLocalizations.of(context).followUs, list: followList),
    ];

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      // child:
      // ExpansionPanelList(
      //   expansionCallback: (int index, bool isExpanded) {
      //     setState(() {
      //       data[index].isExpanded = isExpanded;
      //     });
      //   },
      //   children: data.map<ExpansionPanel>((Item item) {
      //     return ExpansionPanel(
      //       headerBuilder: (BuildContext context, bool isExpanded) {
      //         return ListTile(
      //           title: Text(item.text),
      //         );
      //       },
      //       body: Column(
      //         children: item.list,
      //       ),
      //       isExpanded: item.isExpanded,
      //     );
      //   }).toList(),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      color: Theme.of(context).colorScheme.surface,
      child: Column(children: [
        _languages(),
        _contacts(),
        _panel(),
      ]),
    );
  }
}

class Item {
  Item({
    this.text,
    this.isExpanded = false,
    this.list,
  });

  String text;
  bool isExpanded;
  List<Widget> list;
}
