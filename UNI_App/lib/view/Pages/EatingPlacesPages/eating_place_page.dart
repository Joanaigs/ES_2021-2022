import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/entities/eating_place.dart';
import 'package:uni/model/entities/meal_.dart';
import 'package:uni/model/utils/day_of_week.dart';

import 'eating_places_map.dart';
import 'general_eating_place_page.dart';

class EatingPlacePageState extends GeneralEatingPlacePageState {
  final EatingPlace eatingPlace;

  String dropdownvalue_foodType = 'Tudo';
  String dropdownvalue_typeOfMeal = 'Almoço';

  String dropdownvalue_dayOfWeek =
      toString(parseDayOfWeek(DateFormat('EEEE').format(DateTime.now())));

  static var foodTypeItems = [
    'Tudo',
    'Carne',
    'Peixe',
    'Vegetariano',
    'Dieta',
    'Outro',
  ];
  static var typeOfMealItems = ['Almoço', 'Jantar'];
  static var dayOfWeekItems = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo'
  ];

  EatingPlacePageState(this.eatingPlace);

  @override
  getBody(BuildContext context) {
    final allMeals = eatingPlace.meals;
    var _meals; // = allMeals[parseDayOfWeek(dropdownvalue_dayOfWeek)];
    _meals = filterMeals(allMeals);

    return Scaffold(
        key: Key("restaurantPage"),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eatingPlace.name, //
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .apply(fontSizeDelta: 7),
              ),
              IconButton(
                key: Key('map'),
                icon: Image.asset('assets/images/map_pin.png'),
                iconSize: 40,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EatingPlacesMap(eatingPlace.name)));
                }, //mudar que não é bem o suposto
              ),
            ],
          ),
        ),
        Stack(children: <Widget>[
          //stack não foi necessária..
          Text(
            'Aberto ' +
                eatingPlace.workingHours[DayOfWeek.friday].startTime +
                ' - ' +
                eatingPlace.workingHours[DayOfWeek.friday].endTime, //
            style:
                //TextStyle(backgroundColor: Colors.grey, fontSize: 24),
                Theme.of(context).textTheme.headline6.apply(
                    fontSizeDelta: 5, backgroundColor: Colors.grey.shade300),
          ),
        ]),
        Row(
            //mainAxisAlignment: MainAxisAlignment.space,
            children: <Widget>[
              SizedBox(width: 30),
              DropdownButton(
                  key:Key("firstFilter"),
                  value: dropdownvalue_foodType,
                  items: foodTypeItems.map((String foodTypeItems) {
                    return DropdownMenuItem(
                      key: Key("option"),
                      value: foodTypeItems,
                      child: Text(foodTypeItems),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownvalue_foodType = newValue;

                      _meals = filterMeals(allMeals);
                    });
                  }),
              DropdownButton(
                  value: dropdownvalue_typeOfMeal,
                  items: typeOfMealItems.map((String typeOfMealItems) {
                    return DropdownMenuItem(
                      value: typeOfMealItems,
                      child: Text(typeOfMealItems),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownvalue_typeOfMeal = newValue;

                      _meals = filterMeals(allMeals);
                    });
                  }),
              DropdownButton(
                  value: dropdownvalue_dayOfWeek,
                  items: dayOfWeekItems.map((String dayOfWeekItems) {
                    return DropdownMenuItem(
                      value: dayOfWeekItems,
                      child: Text(dayOfWeekItems),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownvalue_dayOfWeek = newValue;

                      _meals = filterMeals(allMeals);
                    });
                  }),
            ]),
        SizedBox(height: 10),
        Text(
          'Menu',
          style:
              //TextStyle(backgroundColor: Colors.grey, fontSize: 24),
              Theme.of(context).textTheme.headline6.apply(
                  fontSizeDelta: 5, backgroundColor: Colors.grey.shade300),
        ),
        SizedBox(height: 10),
        Container(child:MealsMenu(_meals)),
        SizedBox(height: 10),
        Text(
          'Horas Populares',
          style:
              //TextStyle(backgroundColor: Colors.grey, fontSize: 24),
              Theme.of(context).textTheme.headline6.apply(
                  fontSizeDelta: 5, backgroundColor: Colors.grey.shade300),
        )
      ]),
    ));
  }

  List<Meal_> filterMeals(Map<DayOfWeek, List<Meal_>> allMeals) {
    List<Meal_> meals =
        allMeals[parseDayOfWeek(dropdownvalue_dayOfWeek)].where((m) {
      if (dropdownvalue_typeOfMeal == 'Almoço') {
        if (dropdownvalue_foodType != 'Tudo') {
          return m.isLunch &&
              (foodTypeToString(m.foodType) == dropdownvalue_foodType);
        }
        return m.isLunch;
      } else {
        if (dropdownvalue_foodType != 'Tudo') {
          return !m.isLunch &&
              (m.foodType == parseFoodType(dropdownvalue_foodType));
        }
        return !m.isLunch;
      }
    }).toList();
    return meals;
  }
}

class EatingPlacePage extends StatefulWidget {
  final EatingPlace eatingPlace;

  const EatingPlacePage(this.eatingPlace);

  //const EatingPlacePage({Key key, this.eatingPlace}) : super(key: key);

  @override
  EatingPlacePageState createState() => EatingPlacePageState(eatingPlace);
}

class MealsMenu extends StatefulWidget {
  final List<Meal_> meals;

  MealsMenu(this.meals);

  @override
  MealsMenuState createState() {
    return MealsMenuState();
  }
}

class MealsMenuState extends State<MealsMenu> {
  MealsMenuState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.meals.length,
        itemBuilder: (context, index) {
          final item = widget.meals[index];
          return ListTile(

            title: Text(item.description),
            subtitle: Text(item.cost.toStringAsFixed(2)+'€'),
            leading: getFoodTypeIcon(item.foodType),
          );
        },
    );
  }
}
