import 'package:flutter/material.dart';

import '../../../view/Pages/eatAtFeup/eat_at_feup_back_button_page.dart';
import '../../../view/Pages/eatAtFeup/eat_at_feup_general_page_view.dart';


abstract class GeneralEatingPlacePageState extends EatAtFeupBackButtonPageState{

  @override getBody(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
