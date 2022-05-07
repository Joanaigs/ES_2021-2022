import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/View/Pages/EatingPlacesPages/bar_biblioteca.dart';
import 'package:uni/View/Pages/EatingPlacesPages/bar_minas.dart';
import 'package:uni/View/Pages/EatingPlacesPages/cantina.dart';
import 'package:uni/View/Pages/EatingPlacesPages/grill.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/view/Widgets/date_rectangle.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_event_rectangle.dart';
import 'package:uni/view/Widgets/schedule_row.dart';

import '../../../View/Pages/EatingPlacesPages/ae.dart';
import '../../../View/Pages/EatingPlacesPages/eating_places_map.dart';




Widget buildRestaurantCard(BuildContext context, String photoName, String name){
  dynamic eatingPlacePage;
  switch(name){
    case 'AE':
      eatingPlacePage = Ae();
      break;
    case 'CANTINA':
      eatingPlacePage = Cantina();
      break;
    case 'BAR DA BIBLIOTECA':
      eatingPlacePage = BarBiblioteca();
      break;
    case 'GRILL':
      eatingPlacePage = Grill();
      break;
    case 'BAR DE MINAS':
      eatingPlacePage = BarMinas();
      break;
  }

  return Container(
    margin: EdgeInsets.all(10.0),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(17.0),
        child: Stack(children: <Widget>[
          GestureDetector(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>eatingPlacePage));},
          child: Image.asset(
            'assets/images/' + photoName,
            width: 600.0,
            height: 300.0,
            fit: BoxFit.cover,
          )),
          GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>eatingPlacePage));},
              child:
            Center(
                child: Text(name,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      height: 5.5,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Color.fromARGB(230, 117, 23, 30),
                    ))),),
        GestureDetector(
        onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>eatingPlacePage));},
        child:
          Center(
              child: Text(name,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  color: Colors.grey[100],
                  height: 5.5,
                ),
              )))
        ])
    ),
  );
}
