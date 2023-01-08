import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_hundred_days_of_flutter/language/language_items.dart';
import 'package:one_hundred_days_of_flutter/product/counter_hello_button.dart';

class StatefullLearnView extends StatefulWidget {
  const StatefullLearnView({super.key});

  @override
  State<StatefullLearnView> createState() => _StatefullLearnViewState();
}

class _StatefullLearnViewState extends State<StatefullLearnView> {
  int _countValue = 0;

  void _updateValue(bool isIncrement) {
    if (isIncrement) {
      _countValue += 1;
    } else {
      _countValue -= 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.helloTitle),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_incrementButton(), _deincrementButton()],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              _countValue.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const Placeholder(),
          const CounterHelloButton()
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateValue(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateValue(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
