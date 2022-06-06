import 'dart:async';
import 'package:redux/redux.dart';
import 'package:uni/controller/networking/network_router.dart'
    show NetworkRouter;
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/eat_at_feup_preference.dart';
import 'package:uni/redux/action_creators.dart';

Future<List<EatAtFeupPreference>> fetchEatAtFeupPreferences(
    Store<AppState> store) async {
  List<EatAtFeupPreference> preferences = [];

  store.dispatch(extractEatAtFeupPreferences(store)).then((result){
    preferences = result;
  });

  return preferences;
}
