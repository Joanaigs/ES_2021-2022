import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/entities/eat_at_feup_preference.dart';
import 'package:uni/model/entities/eating_place.dart';
import 'package:uni/model/entities/meal_.dart';
import 'package:uni/model/utils/day_of_week.dart';
import 'package:uni/redux/actions.dart';

import '../../../controller/eat_at_feup/preferences.dart';
import '../../../model/app_state.dart';
import 'eating_places_map.dart';
import 'general_eating_place_page.dart';


class EatingPlacePage extends StatefulWidget {
  final EatingPlace eatingPlace;

  const EatingPlacePage(this.eatingPlace);

  @override
  EatingPlacePageState createState() => EatingPlacePageState(eatingPlace);
}

class EatingPlacePageState extends GeneralEatingPlacePageState {
  final EatingPlace eatingPlace;
  List<EatAtFeupPreference> preferences;


  String dropdownvalue_foodType = 'Preferência';
  String dropdownvalue_typeOfMeal = parseTypeOfMeal();

  String dropdownvalue_dayOfWeek =
      toString(parseDayOfWeek(DateFormat('EEEE').format(DateTime.now())));

  static var foodTypeItems = [
    'Preferência',
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
    preferences = StoreProvider.of<AppState>(context).state.content['eatAtFeupPreferences'];
    if(preferences == null || preferences.isEmpty){
      preferences = EatAtFeupPreference.getDefaultPreferences();
      StoreProvider.of<AppState>(context).dispatch(SetEatAtFeupPreferencesAction(preferences));
    }
    for(var pref in preferences){
      print(foodTypeToString(pref.foodType));
    }
    final allMeals = eatingPlace.meals;
    var workingHoursText = createWorkingHoursText();

    var _meals;
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
            Stack(
                key: Key('workingHours'),
                children: <Widget>[
              //stack não foi necessária..
              Text(
                workingHoursText,
                textAlign: TextAlign.center,
                style:
                    //TextStyle(backgroundColor: Colors.grey, fontSize: 24),
                    Theme.of(context).textTheme.headline6.apply(
                        fontSizeDelta: 5,
                        backgroundColor: Colors.grey.shade300),
              ),
            ]),
            Row(
                //mainAxisAlignment: MainAxisAlignment.space,
                children: <Widget>[
                  SizedBox(width: 30),
                  DropdownButton(
                      key: Key("firstFilter"),
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
                          workingHoursText = createWorkingHoursText();
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
            Container(child: MealsMenu(_meals)),
            SizedBox(height: 10),

          ]),
        ));
  }

  String createWorkingHoursText() {
    var text;
    final intervals =
        eatingPlace.workingHours[parseDayOfWeek(dropdownvalue_dayOfWeek)];
    if (intervals.isEmpty) {
      text = 'Sem horário';
    } else {
      text = 'Aberto ';
      for (int i = 0; i < intervals.length; i++) {
        if(i > 0) {
          text += ' e ' + intervals[i].startTime + ' - ' + intervals[i].endTime;
        } else {
          text += intervals[i].startTime + ' - ' + intervals[i].endTime;
        }
      }
    }
    return text; //
  }

  List<Meal_> filterMeals(Map<DayOfWeek, List<Meal_>> allMeals) {
    List<Meal_> meals =
        allMeals[parseDayOfWeek(dropdownvalue_dayOfWeek)].where((m) {
      if (dropdownvalue_typeOfMeal == 'Almoço') {
        if (dropdownvalue_foodType != 'Preferência') {
          return m.isLunch &&
              (foodTypeToString(m.foodType) == dropdownvalue_foodType);
        }
        return m.isLunch;
      } else {
        if (dropdownvalue_foodType != 'Preferência') {
          return !m.isLunch &&
              (m.foodType == parseFoodType(dropdownvalue_foodType));
        }
        return !m.isLunch;
      }
    }).toList();
    if (dropdownvalue_foodType == 'Preferência'){
      meals = meals.where((m){
        final EatAtFeupPreference pref = preferences.firstWhere((e){
          return m.foodType == e.foodType;
        });
        return pref.display;
      }).toList();
      meals.sort((m1, m2) {
        final EatAtFeupPreference p1 = preferences.firstWhere((e){
          return e.foodType == m1.foodType;
        });
        final EatAtFeupPreference p2 = preferences.firstWhere((e){
          return e.foodType == m2.foodType;
        });
        return p1.order - p2.order;
      });
    }
    return meals;
  }
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
    dynamic res;
    if(widget.meals.isNotEmpty) {
      res = (context, index) {
        final item = widget.meals[index];
        return ListTile(
          title: Text(item.description),
          subtitle: Text(item.cost.toStringAsFixed(2) + '€'),
          leading: getFoodTypeIcon(item.foodType),
        );
      };
    }
    else{
      res = (context, index) {
        return
        ListTile(title: Center(child: Text('Ementa indisponível para este horário.'),
        )
        );
      };
    }
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.meals.isNotEmpty ? widget.meals.length : 1,
      itemBuilder: res,
    );
  }
}
