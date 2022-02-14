import 'package:flutter/material.dart';

const lightBackgroundColor = Color.fromRGBO(219, 203, 181, 1);
const darkBackgroundColor = Color.fromRGBO(23, 45, 55, 1);
const lightGrey = Color.fromRGBO(124, 140, 148, 1);

class ComponentBoxDecoration {
  static BoxDecoration getBoxDecoration(bool isDark, ThemeData themeData) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          isDark ? Colors.black : Colors.white,
          themeData.accentColor,
        ],
      ),
    );
  }
}

final darkTheme = ThemeData(
  fontFamily: 'Festive-Regular',
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  accentColor: darkBackgroundColor,
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: const Color.fromARGB(255, 75, 75, 75),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontFamily: 'ZenKakuGothicAntique-Medium',
      fontSize: 60,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontFamily: 'ZenKakuGothicAntique-Light',
      fontSize: 35,
    ),
    button: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
    caption: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
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
  accentColor: lightBackgroundColor,
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: Colors.grey[900],
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontFamily: 'ZenKakuGothicAntique-Medium',
      fontSize: 60,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontFamily: 'ZenKakuGothicAntique-Light',
      fontSize: 35,
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
    caption: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
  ),
);
