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
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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

  Widget _panelItem(String text) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          InkWell(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
            ),
            onTap: null,
          ),
        ]),
      ),
      Divider(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    ]);
  }

  Map<int, bool> expanded = {};

  List<Item> generateItems() {
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
      return _panelItem(productsTexts[index]);
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
      return _panelItem(europebetTexts[index]);
    });

    List<String> helpTexts = [
      AppLocalizations.of(context).contactUs,
      AppLocalizations.of(context).faq,
      AppLocalizations.of(context).cashDesk,
    ];

    List<Widget> helpList = List.generate(helpTexts.length, (index) {
      return _panelItem(helpTexts[index]);
    });

    List<String> followTexts = [
      AppLocalizations.of(context).facebook,
      AppLocalizations.of(context).youtube,
    ];

    List<Widget> followList = List.generate(followTexts.length, (index) {
      return _panelItem(followTexts[index]);
    });

    final texts = [
      AppLocalizations.of(context).products,
      AppLocalizations.of(context).europebet,
      AppLocalizations.of(context).help,
      AppLocalizations.of(context).followUs,
    ];

    final toRemove = Map<int, bool>.from(expanded);
    final items = [
      Item(text: AppLocalizations.of(context).products, list: productsList),
      Item(text: AppLocalizations.of(context).europebet, list: europebetList),
      Item(text: AppLocalizations.of(context).help, list: helpList),
      Item(text: AppLocalizations.of(context).followUs, list: followList),
    ];

    final data = List.generate(items.length, (int index) {
      expanded.putIfAbsent(index, () => false);
      toRemove.remove(index);
      return Item(
        text: items[index].text,
        list: items[index].list,
        index: index,
      );
    });
    if (toRemove.isNotEmpty) {
      // cleanup unused items
      expanded.removeWhere((key, _) => toRemove.containsKey(key));
    }
    return data;
  }

  Widget _panel() {
    List<Item> _data = generateItems();

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Container(
        child: Theme(
          data: Theme.of(context)
              .copyWith(cardColor: Theme.of(context).colorScheme.surface),
          child: ExpansionPanelList(
            key: ValueKey(_data.length),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                // _d[index].isExpanded = !isExpanded;
                expanded[index] = !isExpanded;
              });
            },
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      item.text,
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  );
                },
                body: Column(
                  children: item.list,
                ),
                isExpanded: expanded[item.index],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _infoText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context).playToEnjoy,
                style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context).license,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
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
        _infoText(),
      ]),
    );
  }
}

class Item {
  Item({
    this.text,
    this.isExpanded = false,
    this.list,
    this.index,
  });

  String text;
  bool isExpanded;
  int index;
  List<Widget> list;
}
