import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/utils/day_of_week.dart';

enum FoodType{
  Carne,
  Peixe,
  Vegetariano,
  Dieta
}

Image getFoodTypeIcon(FoodType type){

  return Image.asset('assets/images/' + foodTypeToString(type) + '.png');
}

FoodType parseFoodType(String str){
  str = str.replaceAll(' ', '').toLowerCase();
  if(str == 'carne') {
    return FoodType.Carne;
  } else if(str == 'vegetariano') {
    return FoodType.Vegetariano;
  } else if(str == 'dieta' ) {
    return FoodType.Dieta;
  } else if(str == 'peixe') {
    return FoodType.Peixe;
  }
  else {
    return null;
  }
}


String foodTypeToString(FoodType type) {
  switch (type) {
    case FoodType.Carne:
      return 'Carne';
    case FoodType.Peixe:
      return 'Peixe';
    case FoodType.Vegetariano:
      return 'Vegetariano';
    case FoodType.Dieta:
      return 'Dieta';
  }
  return null;
}


class Meal_{
  final FoodType foodType;
  final String description;
  bool isLunch;
  double cost;

  //final DateTime date;
  //final Meal_ dayOfWeek; //??

  Meal_(this.foodType, this.description, this.isLunch, this.cost);


  /*
  Map<String, dynamic> toMap(restaurantId) {
    final DateFormat format = DateFormat('d-M-y');
    return {
      'id':null,
      'day':toString(this.dayOfWeek),
      'type':this.foodType,
      'name':this.name,
      'date': this.date != null ? format.format(this.date) : null,
      'id_restaurant':restaurantId};
  }
  */

}