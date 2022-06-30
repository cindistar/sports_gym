import 'package:abas_flutter/bottom_nav_bar/sports_gym.dart';
import 'package:abas_flutter/resources/strings.dart';
import 'package:abas_flutter/resources/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const SportsGymApp());

class SportsGymApp extends StatefulWidget {
  const SportsGymApp({Key? key}) : super(key: key);

  @override
  State<SportsGymApp> createState() => _SportsGymAppState();
}

class _SportsGymAppState extends State<SportsGymApp> {
  ThemeMode currentThemeMode = ThemeMode.light;

  void toggleThemeMode() {
    setState(() {
      currentThemeMode = currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      themeMode: currentThemeMode,
      theme: SportsGymTheme.light,
      darkTheme: SportsGymTheme.dark,
      home: SportsGym(onThemeModePressed: toggleThemeMode) 
    );
  }
}
