import 'package:uni/model/entities/meal_.dart';

class EatAtFeupPreference{
  FoodType foodType;
  bool display;
  int order;

  factory EatAtFeupPreference.fromDB(
      String foodType,
      int display,
      int order,
      ) {
    final preference = EatAtFeupPreference(
        parseFoodType(foodType),
        display == 1,
        order
    );
    return preference;
  }

  EatAtFeupPreference(this.foodType, this.display, this.order);

  Map<String, dynamic> toMap() {
    return {
      'foodType': foodTypeToString(foodType),
      'display': display ? 1 : 0,
      'order_': order,
    };
  }


}