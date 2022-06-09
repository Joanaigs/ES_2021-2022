import 'package:flutter/material.dart';
import '../../utils/constants.dart' as Constants;

class NavigationDrawer extends StatefulWidget {
  final BuildContext parentContext;

  NavigationDrawer({@required this.parentContext}) {}

  @override
  State<StatefulWidget> createState() {
    return NavigationDrawerState(parentContext: parentContext);
  }
}

class NavigationDrawerState extends State<NavigationDrawer> {
  final BuildContext parentContext;

  NavigationDrawerState({@required this.parentContext}) {}

  Map drawerItems = {};
  Map drawerExpandableItems = {};

  @override
  void initState() {
    super.initState();

    drawerItems = {
      Constants.navPersonalArea: _onSelectPage,
      Constants.navSchedule: _onSelectPage,
      Constants.navExams: _onSelectPage,
      Constants.navStops: _onSelectPage,
      Constants.eatAtFeup: null,
      Constants.navAbout: _onSelectPage,
      Constants.navBugReport: _onSelectPage,
    };

    drawerExpandableItems = {
      Constants.eatAtFeup: {
        Constants.eatAtFeup: _onSelectPage,
        Constants.eatAtFeupPreferences: _onSelectPage,
      },
    };
  }

  // Callback Functions
  getCurrentRoute() => ModalRoute.of(parentContext).settings.name == null
      ? drawerItems.keys.toList()[0]
      : ModalRoute.of(parentContext).settings.name.substring(1);

  _onSelectPage(String key) {
    final prev = getCurrentRoute();

    Navigator.of(context).pop();

    if (prev != key) {
      Navigator.pushNamed(context, '/' + key);
    }
  }

  _onLogOut(String key) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/' + key, (Route<dynamic> route) => false);
  }

  // End of Callback Functions

  Decoration _getSelectionDecoration(String name) {
    return (name == getCurrentRoute())
        ? BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: Theme.of(context).accentColor, width: 3.0)),
            color: Theme.of(context).dividerColor,
          )
        : null;
  }

  Widget createLogoutBtn() {
    return OutlinedButton(
      onPressed: () => _onLogOut(Constants.navLogOut),
      style: OutlinedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(0.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(Constants.navLogOut,
            style: Theme.of(context)
                .textTheme
                .headline6
                .apply(color: Theme.of(context).accentColor)),
      ),
    );
  }

  Widget createDrawerNavigationOption(String d) {
    return Container(
        decoration: _getSelectionDecoration(d),
        child: ListTile(
          title: Container(
            padding: EdgeInsets.only(bottom: 3.0, left: 20.0),
            child: Text(d,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.normal)),
          ),
          dense: true,
          contentPadding: EdgeInsets.all(0.0),
          selected: d == getCurrentRoute(),
          key: Key('nav'),
          onTap: () => drawerItems[d](d),
        ));
  }

  Widget createDrawerNavigationOptionExpanded(String d, Map children) {
    return Container(
        decoration: _getSelectionDecoration(d),
        child: ExpansionTile(
          title: Container(
            padding: EdgeInsets.only(bottom: 3.0, left: 5.0),
            child: Text(d,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.normal)),
          ),
          children: children.keys
              .map((child) => ListTile(
            title: Container(
              padding: EdgeInsets.only(bottom: 3.0, left: 20.0),
              child: Text(child,
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.normal)),
            ),
            dense: true,
            onTap: () => children[child](child),
            key: Key('nav_' + d + '_' + child),
          ))
              .toList(),
          initiallyExpanded: children.keys.contains(getCurrentRoute()),
          key: Key('nav_' + d),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> drawerOptions = [];

    for (var key in drawerItems.keys) {
      if (drawerExpandableItems.containsKey(key)) {
        drawerOptions
            .add(createDrawerNavigationOptionExpanded(key, drawerExpandableItems[key]));
      }
      else {
        drawerOptions.add(createDrawerNavigationOption(key));
      }
    }

    return Drawer(
        child: Column(
      children: <Widget>[
        Expanded(
            child: Container(
          padding: EdgeInsets.only(top: 55.0),
          child: ListView(
            children: drawerOptions,
          ),
        )),
        Row(children: <Widget>[Expanded(child: createLogoutBtn())])
      ],
    ));
  }
}
