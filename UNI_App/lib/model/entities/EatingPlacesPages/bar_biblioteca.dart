import 'package:flutter/material.dart';
import 'general_eating_place_page.dart';

class BarBiblioteca extends StatefulWidget {
  const BarBiblioteca({Key key}) : super(key: key);

  @override
  _BarBibliotecaState createState() => _BarBibliotecaState();
}

class _BarBibliotecaState extends GeneralEatingPlacePageState {
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
                'Bar da Biblioteca',
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
