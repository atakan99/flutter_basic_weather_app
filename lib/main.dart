import 'package:flutter/material.dart';
import 'package:flutter_basic_weather_app/src/screens/home_screen.dart';
import 'package:flutter_basic_weather_app/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context,_) {
        final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
      title: 'Anomie Weather App',
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: HomeScreen(),
      ); 
    }
  );
  }
}