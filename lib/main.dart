import 'package:flutter/material.dart';
import 'Day-5/page_view_learn.dart';
import 'Day-5/statefull_learn.dart';
import 'Day-5/statefull_life_cycle_learn.dart';

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
            cardTheme: CardTheme(
              shape:
                  // Tum kartlarimiz ozel shape vermedigimiz surece buradaki shape'i kullanir
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
            ),
            appBarTheme: const AppBarTheme(
                // centerTitle: true,
                backgroundColor: Colors.transparent,
                titleTextStyle: TextStyle(color: Colors.white))),
        home: const StatefullLifeCyleLearn(
          message: 'deniss',
        ));
  }
}
