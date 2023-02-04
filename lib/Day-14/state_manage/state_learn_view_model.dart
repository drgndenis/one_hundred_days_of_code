import 'package:flutter/material.dart';

import 'state_manage_learn_view.dart';

abstract class StateLearnModel extends State<StateLearnManageView> {
  @override
  void initState() {
    super.initState();
  }

  bool isOpacity = false;
  bool isVisible = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
