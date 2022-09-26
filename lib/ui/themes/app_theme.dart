import 'package:app_client/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final dark = ThemeData(
      canvasColor: Colors.yellow,
      dialogTheme: const DialogTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        contentTextStyle: TextStyle(color: Colors.white),
        backgroundColor: CustomColors.darkGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
      fontFamily: 'Nunito',
      scaffoldBackgroundColor: CustomColors.darkGrey);
}
