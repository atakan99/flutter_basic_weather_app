
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeMode _themeMode =ThemeMode.dark;

  bool get isDarkMode =>  _themeMode == ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isOn) {
     _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
     notifyListeners();
  }
}



class MyThemes{

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData (
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );


}