import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustom = 0;
  final _helloTitle = LanguageItems.helloTitle;

  void updateCounter() {
    setState(() {
      _counterCustom++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: updateCounter,
      child: Text(
        '$_helloTitle $_counterCustom',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
