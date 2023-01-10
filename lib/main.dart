import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-7/my_collections_demo.dart';

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
              color: ColorsUtilty().white70,
            ),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.transparent,
                iconColor: Colors.red,
                border: OutlineInputBorder()),
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                titleTextStyle: TextStyle(color: Colors.white))),
        home: const MyCollections());
  }
}
