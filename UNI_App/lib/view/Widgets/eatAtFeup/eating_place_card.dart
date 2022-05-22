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
        break;
      case 'RESTAURANTE INEGI':
        eatingPlace = EatingPlace(
            6, 'RESTAURANTE INEGI', 'inegi.jpg', workingHours, false,
            MapCoordinates(1, 1));
        getMealsWeb('inegi', 0.00).then((value){eatingPlace.meals = value;});
        // getScheduleWeb('inegi').then( (value){eatingPlace.workingHours = value;});
        break;
      case 'BAR INESC TEC':
        eatingPlace = EatingPlace(
            7, 'BAR INESC TEC', 'inesc.jpg', workingHours, false,
            MapCoordinates(1, 1));
        getMealsWeb('inesctec', 0.00).then((value){eatingPlace.meals = value;});
        // getScheduleWeb('inesctec').then( (value){eatingPlace.workingHours = value;});
        break;
    }
    eatingPlacePage = EatingPlacePage(eatingPlace);

    return Container(
      key:Key('restaurant'),
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(17.0),
          child: Stack(children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context,

                      MaterialPageRoute(builder: (context) => eatingPlacePage));
                },
                child: Image.asset(
                  'assets/images/' + photoName,
                  width: 600.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                )),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => eatingPlacePage));
              },
              child:
              Center(
                  child: Text(name,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        height: 5.5,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Color.fromARGB(230, 117, 23, 30),
                      ))),),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => eatingPlacePage));
                },
                child:
                Center(
                    child: Text(name,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.grey[100],
                        height: 5.5,
                      ),
                    )))
          ])
      ),
    );
  }

}
