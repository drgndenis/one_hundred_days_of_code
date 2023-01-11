import 'package:flutter/material.dart';

class NavigateLearnDart extends StatefulWidget {
  const NavigateLearnDart({super.key, this.isOk = false});
  final bool isOk;

  @override
  State<NavigateLearnDart> createState() => _NavigateLearnDartState();
}

class _NavigateLearnDartState extends State<NavigateLearnDart> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOk);
          },
          icon: Icon(
            Icons.check,
            color: widget.isOk ? Colors.red : Colors.yellow,
          ),
          label: widget.isOk ? const Text('Red') : const Text('Onayla'),
        ),
      ),
    );
  }
}
