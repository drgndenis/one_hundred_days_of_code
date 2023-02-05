import 'package:flutter/material.dart';

class LightTheme {
  // Aynı anda initialize edilemez bundan dolayı late kullanıyoruz.
  final _lightColor = _LightColors();
  final _lightSizes = _LightSizes();

  // Projeyi entegre ettigimiz zamanda sadece late olmasi bir sorun olarak karsimiza cıkabilir. Bu durumda debug modunda sadece late ile tanımlama yapabiliriz ama entegre edecegimiz zaman final late olarak duzenlememiz gerekecektir.
  late ThemeData theme;

  // Constructor
  LightTheme() {
    theme = ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(40, 60),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(_LightColors()._blueAccent),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _lightColor._floatingActionButton),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          onPrimary: _LightColors()._blueAccent,
        ),
      ),
      inputDecorationTheme:
          const InputDecorationTheme(hintStyle: TextStyle(fontSize: 24)),
      colorScheme: const ColorScheme.light(),
      textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
                fontSize: _lightSizes._titleMedium,
                color: _lightColor._titleMedium),
          ),
    );
  }
}

// Theme içinde kullanılacak renklerin tanımlanması
class _LightColors {
  final Color _titleMedium = const Color.fromARGB(255, 226, 133, 19);
  final Color _textBackground = Colors.amberAccent;
  final Color _blueAccent = Colors.blueAccent;
  final Color _floatingActionButton = Colors.indigoAccent;
}

// Theme içinde kullanılacak fontSize'larin tanımlanması
class _LightSizes {
  final double _titleMedium = 50;
}
