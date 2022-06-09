import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:uni/controller/local_storage/app_eat_at_feup_database.dart';
import 'package:uni/model/entities/meal_.dart';
import 'package:uni/utils/constants.dart';
import 'package:uni/view/Pages/EatingPlacesPages/general_eating_place_page.dart';
import 'package:uni/view/Widgets/eatAtFeup/eating_place_card.dart';

import '../../../controller/eat_at_feup/preferences.dart';
import '../../../model/app_state.dart';
import '../../../model/entities/eat_at_feup_preference.dart';
import '../../../redux/action_creators.dart';
import '../../../redux/actions.dart';
import '../../Widgets/navigation_drawer.dart';
import '../../Widgets/page_title.dart';
import '../EatingPlacesPages/eating_places_map.dart';
import '../general_page_view.dart';
import 'eat_at_feup_general_page_view.dart';

List<EatAtFeupPreference> getPreferencesmm() {
  EatAtFeupDatabase preferencesDB = EatAtFeupDatabase();
  // List<EatAtFeupPreference> preferences = await preferencesDB.preferences();
  List<EatAtFeupPreference> preferences;
  preferencesDB.preferences().then((value) => preferences = value);
  return preferences;
}

List<EatAtFeupPreference> getPreferences() {
  final List<EatAtFeupPreference> preferences = [];
  preferences.add(EatAtFeupPreference(parseFoodType("vegetariano"), true, 0));
  preferences.add(EatAtFeupPreference(parseFoodType("carne"), true, 1));
  return preferences;
}

class EatAtFeupPreferencesPage extends StatefulWidget {
  const EatAtFeupPreferencesPage({Key key}) : super(key: key);

  @override
  _EatAtFeupPreferencesState createState() => _EatAtFeupPreferencesState();
}

class _EatAtFeupPreferencesState extends GeneralEatingPlacePageState {
  EatAtFeupDatabase preferencesDB;

  List<EatAtFeupPreference> preferences;
  DateTime lastUpdateTime;
  DateFormat updateTimeFormat = DateFormat.jm();

  @override
  Widget getScaffold(BuildContext context, Widget body) {
    body = StoreConnector<AppState, List<EatAtFeupPreference>>(
        converter: (store) => store.state.content['eatAtFeupPreferences'],
        builder: (context, preferences) {
          //preferences.clear();
          if (preferences == null || preferences.isEmpty) {
            preferences = EatAtFeupPreference.getDefaultPreferences();
            StoreProvider.of<AppState>(context)
                .dispatch(setEatAtFeupPreferences(Completer(), preferences));
          }
          ReorderableListView rList;
          ListView sList;
          final List<Widget> widgetList = [];
          widgetList.add(PageTitle(name: 'Preferências'));
          Future.delayed(Duration(seconds: 2));
          if (preferences.isEmpty) {
            widgetList.add(Center(child: Text('\nNão tem preferências\n')));
          } else {
            widgetList.add(Center(
                child: Text(
                    '\nOrdene as suas preferências arrastando as caixas\n')));
            sList = ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: preferences.map((preference) {
                bool _lights = preference.display;
                return Container(
                  decoration: BoxDecoration(
                      color: Color(0x0075171e),
                      border: Border.all(width: 1, color: Color(0xff75171e))),
                  child: SwitchListTile(
                    contentPadding: const EdgeInsets.all(10),
                    secondary: Image.asset(
                      'assets/images/' +
                          foodTypeToString(preference.foodType) +
                          '.png',
                    ),
                    title: Text(
                      '${foodTypeToString(preference.foodType)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        _lights = value;
                        if (!value) {
                          int newIndex = 4;
                          final int oldIndex = preference.order;

                          final EatAtFeupPreference item =
                              preferences.removeAt(oldIndex);
                          for (var pref in preferences) {
                            if (newIndex <= pref.order &&
                                pref.order < oldIndex) {
                              pref.order++;
                            } else if (oldIndex < pref.order &&
                                pref.order <= newIndex) {
                              pref.order--;
                            }
                          }
                          preferences.insert(newIndex, item);
                          preferences[newIndex].order = newIndex;
                        } else {
                          final int oldIndex = preference.order;
                          int newIndex;
                          preferences.sort((pref1, pref2) {
                            return pref1.order - pref2.order;
                          });
                          for (int i = 0; i < preferences.length - 1; i++) {
                            if (preferences[i].display &&
                                !preferences[i + 1].display) {
                              newIndex = i + 1;
                              break;
                            }
                            newIndex = 0;
                          }

                          final EatAtFeupPreference item =
                              preferences.removeAt(oldIndex);
                          for (var pref in preferences) {
                            if (newIndex <= pref.order &&
                                pref.order < oldIndex) {
                              pref.order++;
                            } else if (oldIndex < pref.order &&
                                pref.order <= newIndex) {
                              pref.order--;
                            }
                          }
                          preferences.insert(newIndex, item);
                          preferences[newIndex].order = newIndex;
                        }
                        preference.display = value;

                        StoreProvider.of<AppState>(context).dispatch(setEatAtFeupPreferences(Completer(), preferences));

                        // StoreProvider.of<AppState>(context).dispatch(action)
                      });
                    },
                    value: _lights,
                  ),
                );
              }).toList(),
            );
            rList = ReorderableListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              buildDefaultDragHandles: false,
              //Remove default drag handles
              padding: const EdgeInsets.symmetric(horizontal: 10),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final EatAtFeupPreference item =
                      preferences.removeAt(oldIndex);
                  for (var pref in preferences) {
                    if (newIndex <= pref.order && pref.order < oldIndex) {
                      pref.order++;
                    } else if (oldIndex < pref.order &&
                        pref.order <= newIndex) {
                      pref.order--;
                    }
                  }
                  preferences.insert(newIndex, item);
                  preferences[newIndex].order = newIndex;
                  StoreProvider.of<AppState>(context).dispatch(setEatAtFeupPreferences(Completer(), preferences));
                });
              },
              children: preferences
                  .map((preference) => Container(
                        key: ValueKey(preference.foodType),
                        decoration: BoxDecoration(
                            color: Color(0x00ffffff),
                            border:
                                Border.all(width: 1, color: Color(0xff75171e))),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: Image.asset(
                            'assets/images/' +
                                foodTypeToString(preference.foodType) +
                                '.png',
                            // color: Color(0xff75171e),)
                          ),
                          title: Text(
                            '${foodTypeToString(preference.foodType)}',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          trailing: preference.display
                              ? ReorderableDragStartListener(
                                  index: preference.order,
                                  child: Icon(Icons.drag_indicator_outlined,
                                      color: preference.display
                                          ? Color(0xff75171e)
                                          : Colors.blueGrey))
                              : Icon(Icons.drag_indicator_outlined,
                                  color: preference.display
                                      ? Color(0xff75171e)
                                      : Colors
                                          .blueGrey), //Wrap it inside drag start event listener
                        ),
                      ))
                  .toList(),
            );
            lastUpdateTime = DateTime.now();
            widgetList.add(Column(children: <Widget>[rList]));
            widgetList.add(SizedBox(
              height: 15,
            ));
            widgetList.add(Center(
                child: Text('\nAtive ou desative as suas preferências\n')));
            widgetList.add(Column(children: <Widget>[sList]));
            widgetList.add(Text(
                'última atualização às ${updateTimeFormat.format(lastUpdateTime)}',
                textAlign: TextAlign.center));
          }
          return SingleChildScrollView(
            child: ListView(
              children: widgetList,
              physics: ScrollPhysics(),
              shrinkWrap: true,
            ),
            physics: ScrollPhysics(),
          );
        });

    return Scaffold(
      appBar: buildAppBar(context),
      drawer: NavigationDrawer(parentContext: context),
      body: this.refreshState(context, body),
    );
  }
}
