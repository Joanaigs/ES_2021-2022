import 'package:flutter/material.dart';
import 'general_eating_place_page.dart';

class Ae extends StatefulWidget {
  const Ae({Key key}) : super(key: key);

  @override
  _AeState createState() => _AeState();
}

class _AeState extends GeneralEatingPlacePageState {
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
                'Associação de Estudantes',
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

/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Associação de Estudantes'),
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
  */
