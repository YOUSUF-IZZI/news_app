import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class CustomThemes {

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.appColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.appColor,
      iconTheme: IconThemeData(
          color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
      )
    ),
  );

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black54,
      primaryColor: Colors.black54,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          )
      )
  );

}
