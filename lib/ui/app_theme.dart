import 'package:flutter/material.dart';

import 'app_assets.dart';
import 'app_colors.dart';

class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        fontFamily: 'QuickSand',
        primaryColor: kMerah, //primary
        primarySwatch: Colors.red,
        //tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(128, 109, 255, 1),
        ).merge(
          ButtonStyle(elevation: MaterialStateProperty.all(0)),
        )),
        canvasColor: kGrey,
        cardColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: true,
        ),

        // bottomAppBarColor: Colors.red,
        //card
        // cardColor: kBiru,
      );
}
