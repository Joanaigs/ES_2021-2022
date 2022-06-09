import 'package:uni/controller/load_menus.dart';
import 'package:uni/view/Pages/EatingPlacesPages/eating_place_page.dart';
import 'package:uni/model/entities/eating_place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/utils/day_of_week.dart';


class BuildRestaurantCard extends StatelessWidget {
  String name, photoName;

  BuildRestaurantCard({Key key, @required this.photoName, @required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dynamic eatingPlacePage;
    EatingPlace eatingPlace;
    Map<DayOfWeek, List<TimeInterval>> workingHours = {};
    for(var day in DayOfWeek.values){
      workingHours[day] = [];
    }

    switch (name) {
      case 'AE':
        eatingPlace = EatingPlace(
            1, 'AE', 'ae.jpg', workingHours, false, MapCoordinates(1, 1));
        getMealsAE("ae_ementa.txt").then((value){eatingPlace.meals=value;});
        eatingPlace.workingHours = EatingPlace.createWorkingHours("09h30", '19h00');
        break;
      case 'CANTINA':
        eatingPlace = EatingPlace(
            2, 'CANTINA', 'cantina.jpg', workingHours, false,
            MapCoordinates(1, 1));
        getMealsWeb('canteen', 2.75).then((value){eatingPlace.meals = value;});
        getScheduleWeb('canteen').then( (value){eatingPlace.workingHours = value;});
        break;
      case 'BAR DA BIBLIOTECA':
        eatingPlace = EatingPlace(
            3, 'BAR DA BIBLIOTECA', 'biblioteca.jpg', workingHours, false,
            MapCoordinates(1, 1));
        getMealsAE('biblio_ementa.txt').then((value){eatingPlace.meals=value;});
        eatingPlace.workingHours = EatingPlace.createWorkingHours('09h00', '18h30');
        break;
      case 'GRILL':
        eatingPlace = EatingPlace(
            4, 'GRILL', 'grill.jpg', workingHours, false, MapCoordinates(1, 1));
        getMealsWeb('grill', 4.00).then((value){eatingPlace.meals = value;});
        getScheduleWeb('grill').then( (value){eatingPlace.workingHours = value;});

        break;
      case 'BAR DE MINAS':
        eatingPlace = EatingPlace(
            5, 'BAR DE MINAS', 'minas.jpg', workingHours, false,
            MapCoordinates(1, 1));
        eatingPlace.meals=EatingPlace.getTestMeals();
        eatingPlace.workingHours = EatingPlace.createWorkingHours('08h00', '20h00');
        break;
      case 'RESTAURANTE INEGI':
        eatingPlace = EatingPlace(
            6, 'RESTAURANTE INEGI', 'inegi.jpg', workingHours, false,
            MapCoordinates(1, 1));
        getMealsWeb('inegi', 4.00).then((value){eatingPlace.meals = value;});
        // getScheduleWeb('inegi').then( (value){eatingPlace.workingHours = value;});
        eatingPlace.workingHours = EatingPlace.createWorkingHours('08h30', '20h00');
        break;
      case 'BAR INESC TEC':
        eatingPlace = EatingPlace(
            7, 'BAR INESC TEC', 'inesc.jpg', workingHours, false,
            MapCoordinates(1, 1));
        getMealsWeb('inesctec', 4.00).then((value){eatingPlace.meals = value;});
        // getScheduleWeb('inesctec').then( (value){eatingPlace.workingHours = value;});
        eatingPlace.workingHours = EatingPlace.createWorkingHours('08h30', '20h00');
        break;
    }
    eatingPlacePage = EatingPlacePage(eatingPlace);

    return Container(
      key:Key('restaurant'),
      margin:  EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
          child: Stack(children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context,

                      MaterialPageRoute(builder: (context) => eatingPlacePage));
                },
                child: Image.asset(
                  'assets/images/' + photoName,
                  width: 500.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => eatingPlacePage));
                },
                child:
                Center( child: Container(
                    padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: Text(name,

                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        fontSize: 40,
                        color: Colors.grey[100],

                      ),
                    ))))
          ])
      ),
    );
  }

}
