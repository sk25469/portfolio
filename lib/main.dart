import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/main_component.dart';
import 'package:portfolio/constants/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Sahil Sarwar',
        theme: theme,
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        home: const HomePage(),
      ),
    );
  }
}
