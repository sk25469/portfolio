import 'package:flutter/material.dart';

const lightBackgroundColor = Color.fromRGBO(219, 203, 181, 1);
const darkBackgroundColor = Color.fromRGBO(23, 45, 55, 1);
const lightGrey = Color.fromRGBO(124, 140, 148, 1);
const lightPurple = Color.fromRGBO(85, 25, 139, 1);
const darkPurple = Color.fromRGBO(72, 48, 99, 1);

// const _kSize = 1536;

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

class ComponentTextStyle {
  static TextTheme getTextStyle(bool isHovering, bool isDark) {
    return TextTheme(
      headline3: TextStyle(
        color: !isHovering && isDark
            ? Colors.white
            : (!isHovering && !isDark)
                ? Colors.black
                : (isHovering && isDark)
                    ? Colors.white
                    : Colors.white,
        fontSize: 18,
        fontFamily: 'ZenKakuGothicAntique-Regular',
      ),
      headline5: TextStyle(
        color: !isHovering && isDark
            ? Colors.white
            : (!isHovering && !isDark)
                ? Colors.black
                : (isHovering && isDark)
                    ? Colors.white
                    : Colors.white,
        fontSize: 30,
        fontFamily: 'ZenKakuGothicAntique-Light',
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
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'ZenKakuGothicAntique-Regular',
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontFamily: 'ZenKakuGothicAntique-Regular',
    ),
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
    headline5: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontFamily: 'ZenKakuGothicAntique-Light',
    ),
    headline1: TextStyle(
      color: Colors.white,
      fontFamily: 'Monoton-Regular',
      fontSize: 34,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'ZenKakuGothicAntique-Bold',
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'ZenKakuGothicAntique-Regular',
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
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
    subtitle1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'ZenKakuGothicAntique-Regular',
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontFamily: 'ZenKakuGothicAntique-Regular',
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontFamily: 'ZenKakuGothicAntique-Light',
    ),
    headline1: TextStyle(
      color: Colors.black,
      fontFamily: 'Monoton-Regular',
      fontSize: 34,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'ZenKakuGothicAntique-Bold',
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'ZenKakuGothicAntique-Regular',
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'ZenKakuGothicAntique-Medium',
    ),
  ),
);
