/*import 'package:flutter/material.dart';

class EatingPlacesMap extends StatelessWidget {
  const EatingPlacesMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Eating Places'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/eatAtFeup/eat_at_feup_back_button_page.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';

import '../../../view/Pages/eatAtFeup/eat_at_feup_general_page_view.dart';
import 'general_eating_place_page.dart';

class EatingPlacesMap extends StatefulWidget {
  const EatingPlacesMap({Key key}) : super(key: key);

  @override
  _EatingPlacesMapState createState() => _EatingPlacesMapState();
}

class _EatingPlacesMapState extends EatAtFeupBackButtonPageState {
  @override
  getBody(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Map of All the Eating Places',
              style:
                  Theme.of(context).textTheme.headline6.apply(fontSizeDelta: 7),
            ),
          ],
        ),
      ),
      Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    ]));
  }
}
