import 'package:flutter/material.dart';

class EnumExtensionLearn extends StatefulWidget {
  const EnumExtensionLearn({super.key});

  @override
  State<EnumExtensionLearn> createState() => _EnumExtensionLearnState();
}

class _EnumExtensionLearnState extends State<EnumExtensionLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          color: Colors.deepOrangeAccent,
          height: WidgetSizes.normalCardHeight.value(),
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidgetSizesExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 80;
      case WidgetSizes.circleProfileWidth:
        return 50;
    }
  }
}
