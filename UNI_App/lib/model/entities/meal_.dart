import 'package:intl/intl.dart';
import 'package:uni/model/utils/day_of_week.dart';

enum FoodType{
  Carne,
  Peixe,
  Vegetariano,
  Dieta
}

class Meal_{
  final FoodType foodType;
  final String description;
  bool isLunch;
  double cost;

  //final DateTime date;
  //final DayOfWeek dayOfWeek; //??

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