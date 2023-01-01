import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  ColorLearnView({super.key});
  final String _appTitle = 'Color Learn';
  final ColorsItem color = ColorsItem();
  final String text = 'Denis DRAGAN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      body: Container(
        color: color.burntSienna,
        child: Text(text),
      ),
    );
  }
}

class ColorsItem {
  final Color burntSienna = const Color(0xffED6D61);
}
