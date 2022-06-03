import 'package:flutter/material.dart';
import 'package:uni/view/Pages/EatingPlacesPages/general_eating_place_page.dart';
import 'package:uni/view/Widgets/eatAtFeup/eating_place_card.dart';

import '../EatingPlacesPages/eating_places_map.dart';
import 'eat_at_feup_general_page_view.dart';

class EatAtFeupPreferences extends StatefulWidget {
  const EatAtFeupPreferences({Key key}) : super(key: key);

  @override
  _EatAtFeupPreferencesState createState() => _EatAtFeupPreferencesState();
}

class _EatAtFeupPreferencesState extends GeneralEatingPlacePageState {
  final List<int> _items = List<int>.generate(5, (int index) => index);
  bool _lights = false;

  @override
  Widget getBody(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      body: Center(
        key: Key('eat@feup'),
        child: ReorderableListView(
          buildDefaultDragHandles:false,  //Remove default drag handles
          padding: const EdgeInsets.symmetric(horizontal: 40),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
          children: <Widget>[
            for (int index = 0; index < 5; index += 1)
              ListTile(
                trailing: ReorderableDragStartListener(index:index,child: const Icon(Icons.drag_indicator_outlined)),   //Wrap it inside drag start event listener
                key: Key('$index'),
                // value: _lights,
                tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
                title: Text('Item ${_items[index]}'),
                // onChanged: (bool value) {
                //   setState(() {
                //     _lights = value;
                //   });
                // },
              ),
          ],
        ),
      ),
    );
  }
}
