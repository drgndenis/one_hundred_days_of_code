import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-14/state_manage/state_learn_view_model.dart';

class StateLearnManageView extends StatefulWidget {
  const StateLearnManageView({super.key});

  @override
  State<StateLearnManageView> createState() => _StateLearnManageViewState();
}

class _StateLearnManageViewState extends StateLearnModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isVisible ? Colors.red : Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeOpacity();
          changeVisible();
        },
        backgroundColor:
            isOpacity ? Colors.deepPurpleAccent : Colors.deepOrangeAccent,
      ),
    );
  }
}
