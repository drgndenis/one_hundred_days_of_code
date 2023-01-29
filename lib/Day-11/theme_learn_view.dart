import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-12/password_textfield.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({super.key});

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  bool _value = false;

  void changeValue() {
    setState(() {
      _value = !_value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Learn'),
      ),
      body: Column(
        children: [
          const PasswordTextField(),
          CheckboxListTile(
            value: _value,
            onChanged: (value) {
              changeValue();
            },
            title: Text(
              'Select',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.purple),
      ),
    );
  }
}
