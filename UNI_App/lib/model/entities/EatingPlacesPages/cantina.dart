import 'package:flutter/material.dart';
import 'general_eating_place_page.dart';

class Cantina extends StatefulWidget {
  const Cantina({Key key}) : super(key: key);

  @override
  _CantinaState createState() => _CantinaState();
}

class _CantinaState extends GeneralEatingPlacePageState {
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
                'Cantina',
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
