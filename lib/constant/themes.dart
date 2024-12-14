import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class MyThemes {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.lightIceBlue,
      appBarTheme: AppBarTheme(
          actionsIconTheme: const IconThemeData(color: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          titleTextStyle: AppTextStyles.appBarTextStyle));
}
