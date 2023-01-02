import 'package:flutter/material.dart';
import 'Day-1/card_learn.dart';
import 'Day-1/image_learn.dart';
import 'Day-1/padding_learn.dart';
import 'Day-1/stateless_learn.dart';
import 'Day-2/note_demos_view.dart';

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
                color: Colors.white),
            appBarTheme: const AppBarTheme(
                // centerTitle: true,
                backgroundColor: Colors.transparent,
                titleTextStyle: TextStyle(color: Colors.black))),
        home: const NoteView());
  }
}
