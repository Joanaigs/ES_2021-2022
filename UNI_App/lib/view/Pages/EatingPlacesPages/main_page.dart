import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/eatAtFeup/eating_place_card.dart';

import '../EatingPlacesPages/eating_places_map.dart';
import 'eat_at_feup_general_page_view.dart';

class EatAtFeupMainPage extends StatefulWidget {
  const EatAtFeupMainPage({Key key}) : super(key: key);

  @override
  _EatAtFeupMainPageState createState() => _EatAtFeupMainPageState();
}

class _EatAtFeupMainPageState extends EatAtFeupGeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return Scaffold(
      /*
      appBar:  AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Image.asset('assets/images/icon.png', fit: BoxFit.cover),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: const Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
      ),
       */
      body: Center(
        key: Key('eat@feup'),
        child: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17.0),
                  child: Image.asset(
                    'assets/images/icon.png',
                    width: 400.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EatingPlacesMap('Eating Places Map')));
                  },
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/mapa.jpg',
                      width: 600.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            BuildRestaurantCard(photoName: 'ae.jpg', name: 'AE'),
            BuildRestaurantCard(photoName: 'cantina.jpg', name: 'CANTINA'),
            BuildRestaurantCard(photoName: 'grill.png', name: 'GRILL'),
            BuildRestaurantCard(
                photoName: 'biblioteca.jpg', name: 'BAR DA BIBLIOTECA'),
            BuildRestaurantCard(photoName: 'minas.jpg', name: 'BAR DE MINAS'),
            BuildRestaurantCard(
                photoName: 'inegi.jpg', name: 'RESTAURANTE INEGI'),
            BuildRestaurantCard(photoName: 'inesc.jpg', name: 'BAR INESC TEC'),
          ],
        ),
      ),
    );
  }
}
