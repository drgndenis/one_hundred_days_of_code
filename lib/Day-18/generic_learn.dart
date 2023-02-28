import 'package:flutter/material.dart';

class GenericLearnView extends StatefulWidget {
  const GenericLearnView({super.key});

  @override
  State<GenericLearnView> createState() => _GenericLearnViewState();
}

class _GenericLearnViewState extends State<GenericLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
