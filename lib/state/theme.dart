import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  static ThemeData _lightTheme = ThemeData(
      colorScheme: ColorScheme(
        primary: Color(0xFF35A7FF),
        primaryVariant: Color(0xFF008BF5),
        secondary: Color(0xFF6BF178),
        secondaryVariant: Color(0xFF15E029),
        surface: Colors.white,
        background: Colors.white,
        error: Color(0xFFFF5964),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF35A7FF),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.grey[700],
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        headline3: TextStyle(color: Colors.black),
        headline4: TextStyle(color: Colors.black),
        headline5: TextStyle(color: Colors.black),
        headline6: TextStyle(color: Colors.black),
        caption: TextStyle(color: Colors.black),
        button: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.black),
        subtitle2: TextStyle(color: Colors.black),
      ),
      buttonTheme: ButtonThemeData(
        disabledColor: Colors.grey,
        colorScheme: ColorScheme(
          primary: Color(0xFF35A7FF),
          primaryVariant: Color(0xFF008BF5),
          secondary: Color(0xFF6BF178),
          secondaryVariant: Color(0xFF15E029),
          surface: Colors.white,
          background: Colors.white,
          error: Color(0xFFFF5964),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
      ));
  static ThemeData _darkTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: Color(0xFF35A7FF),
      primaryVariant: Color(0xFF008BF5),
      secondary: Color(0xFF6BF178),
      secondaryVariant: Color(0xFF15E029),
      surface: Colors.grey[500],
      background: Colors.black,
      error: Color(0xFFFF5964),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Color(0xFF35A7FF),
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.black87,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Colors.white),
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white),
      caption: TextStyle(color: Colors.white),
      button: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
      subtitle2: TextStyle(color: Colors.white),
    ),
  );

  ThemeData _defaultTheme = _lightTheme;

  get theme => _defaultTheme;

  toggleTheme() {
    if (_defaultTheme == _lightTheme)
      _defaultTheme = _darkTheme;
    else
      _defaultTheme = _lightTheme;
    notifyListeners();
  }
}
