import 'package:flutter/material.dart';
import 'package:one_hundred_days_of_flutter/Day-11/theme/light_theme.dart';
import 'Day-14/form_learn_view.dart';
import 'Day-14/state_manage/state_manage_learn_view.dart';

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
        theme: LightTheme().theme,
        // ThemeData.dark(useMaterial3: true).copyWith(
        //   tabBarTheme: const TabBarTheme(
        //     labelColor: Colors.white,
        //     unselectedLabelColor: Colors.red,
        //     // TabBar'da secili olan tab'in altina cizgi cizer, bu cizgi label kadar genis olur
        //     indicatorSize: TabBarIndicatorSize.label,
        //   ),
        //   bottomAppBarTheme: const BottomAppBarTheme(
        //     shape: CircularNotchedRectangle(),
        //   ),
        //   progressIndicatorTheme:
        //       const ProgressIndicatorThemeData(color: Colors.white),
        //   cardTheme: CardTheme(
        //     shape:
        //         // Tum kartlarimiz ozel shape vermedigimiz surece buradaki shape'i kullanir
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        //     color: Colors.deepPurpleAccent,
        //   ),
        //   inputDecorationTheme: const InputDecorationTheme(
        //       filled: true,
        //       fillColor: Colors.transparent,
        //       iconColor: Colors.red,
        //       border: OutlineInputBorder()),
        //   appBarTheme: AppBarTheme(
        //     titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        //           color: Colors.white,
        //         ),
        //     centerTitle: true,
        //     systemOverlayStyle: SystemUiOverlayStyle.light,
        //     backgroundColor: Colors.transparent,
        //   ),
        // ),
        home: const FormLearnView());
  }
}
