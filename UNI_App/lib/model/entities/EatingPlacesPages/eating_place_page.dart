import 'package:flutter/material.dart';
import 'package:uni/model/entities/eating_place.dart';
import 'general_eating_place_page.dart';

class EatingPlacePage extends StatefulWidget {
  final EatingPlace eatingPlace;
  const EatingPlacePage({Key key, this.eatingPlace}) : super(key: key);

  @override
  _EatingPlacePageState createState() => _EatingPlacePageState();
}

class _EatingPlacePageState extends GeneralEatingPlacePageState {
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
                'eatingPlace.name',//
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .apply(fontSizeDelta: 7),
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
        )
      ]),
    );
  }
}