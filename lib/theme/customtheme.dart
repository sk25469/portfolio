import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'Festive-Regular',
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  accentColor: const Color.fromARGB(255, 37, 37, 37),
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: const Color.fromARGB(255, 75, 75, 75),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    button: TextStyle(color: Colors.white),
    caption: TextStyle(color: Colors.white),
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
  ),
);

final lightTheme = ThemeData(
  fontFamily: 'Festive-Regular',
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(169, 255, 255, 255),
  accentColor: const Color.fromARGB(255, 226, 226, 226),
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: Colors.grey[900],
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
    button: TextStyle(color: Colors.black),
    caption: TextStyle(color: Colors.black),
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
  ),
);
