import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/EatingPlacesPages/bar_biblioteca.dart';
import 'package:uni/model/entities/EatingPlacesPages/bar_minas.dart';
import 'package:uni/model/entities/EatingPlacesPages/cantina.dart';
import 'package:uni/model/entities/EatingPlacesPages/grill.dart';
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

import '../../../model/entities/EatingPlacesPages/ae.dart';
import '../../../model/entities/EatingPlacesPages/eating_places_map.dart';




Widget buildRestaurantCard(BuildContext context, String photoName, String name){
  dynamic eatingPlacePage;
  switch(name){
    case 'Associação de Estudantes':
      eatingPlacePage = Ae();
      break;
    case 'Cantina':
      eatingPlacePage = Cantina();
      break;
    case 'Bar da Biblioteca':
      eatingPlacePage = BarBiblioteca();
      break;
    case 'Grill':
      eatingPlacePage = Grill();
      break;
    case 'Bar de Minas':
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
          Center(
              child: Text(name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    height: 2,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.black87,
                  ))),
          Center(
              child: Text(name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.grey[100],
                  height: 2,
                ),
              ))
        ])
    ),
  );
}
