import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: const HomePage(),
      ),
    );
  }
}
