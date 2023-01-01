import 'package:flutter/material.dart';
import 'Day-1/appbar_learn.dart';
import 'Day-1/button_learn.dart';
import 'Day-1/color_learn.dart';
import 'Day-1/container_sizedbox_learn_view.dart';
import 'Day-1/icon_learn.dart';
import 'Day-1/scaffold_learn.dart';
import 'Day-1/text_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp flutter projelerinin temasinin adi
    // MaterialApp projede sadece bir kere bulunur
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: Colors.white),
            appBarTheme: const AppBarTheme(
                // centerTitle: true,
                backgroundColor: Colors.transparent,
                titleTextStyle: TextStyle(color: Colors.black))),
        home: ColorLearnView());
  }
}
