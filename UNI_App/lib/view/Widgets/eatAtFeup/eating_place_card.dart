import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
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




Widget buildRestaurantCard(String photoName, String name){
  return Container(
    margin: EdgeInsets.all(10.0),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(17.0),
        child: Stack(children: <Widget>[
          Image.asset(
            'assets/images/' + photoName,
            width: 600.0,
            height: 300.0,
            fit: BoxFit.cover,
          ),
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
        ])),
  );
}

