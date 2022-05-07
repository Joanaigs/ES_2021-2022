import 'package:flutter/material.dart';

import '../EatingPlacesPages/eat_at_feup_general_page_view.dart';

abstract class EatAtFeupBackButtonPageState extends EatAtFeupGeneralPageViewState{
  @override
  getScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: this.refreshState(context, body),
    );
  }
}
