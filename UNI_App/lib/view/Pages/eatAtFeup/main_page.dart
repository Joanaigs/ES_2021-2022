import 'package:flutter/material.dart';
import 'package:uni/model/entities/eating_places_map.dart';
import 'package:uni/view/Widgets/eatAtFeup/eating_place_card.dart';

import 'eat_at_feup_general_page_view.dart';

class EatAtFeupMainPage extends StatefulWidget {
  const EatAtFeupMainPage({Key key}) : super(key: key);

  @override
  _EatAtFeupMainPageState createState() => _EatAtFeupMainPageState();
}

// @override
// Widget getBody(BuildContext context) {
//   final MediaQueryData queryData = MediaQuery.of(context);
//   return ListView(
//     children: <Widget>[
//       Container(
//           child: SvgPicture.asset(
//             'assets/images/ni_logo.svg',
//             color: Theme.of(context).accentColor,
//             width: queryData.size.height / 7,
//             height: queryData.size.height / 7,
//           )),
//       Center(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 left: queryData.size.width / 12,
//                 right: queryData.size.width / 12,
//                 top: queryData.size.width / 12,
//                 bottom: queryData.size.width / 12),
//             child: Column(children: <Widget>[
//               TermsAndConditions(),
//             ]),
//           ))
//     ],
//   );
// }
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
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>EatingPlacesMap()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17.0),
                  child: Image.asset(
                    'assets/images/mapa.jpg',
                    width: 600.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                )
              ),
            ),
            buildRestaurantCard('ae.jpg', 'ae'),
            buildRestaurantCard('cantina.jpg', 'cantina'),
            buildRestaurantCard('grill.png', 'grill'),
            buildRestaurantCard('biblioteca.jpg', 'biblioteca'),
            buildRestaurantCard('minas.jpg', 'minas'),
          ],
        ),
      ),
    );
  }
}
