import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color cyan = Color(0xFF09B9E9);
  static const Color aqua = Color(0xFF01FFFF);
  static const Color cyanDark = Color(0xFF067FA3);

  static const Color appBackground = Color(0xFF0C1116);
  static const Color panel = Color(0xFF141B22);
  static const Color panel2 = Color(0xFF1C252E);
  static const Color panel3 = Color(0xFF243039);
  static const Color line = Color(0xFF2A353F);

  static const Color text = Color(0xFFEEF3F6);
  static const Color text2 = Color(0xFF9FB0BD);
  static const Color text3 = Color(0xFF6C7D8A);

  static const Color buttonText = Color(0xFF04222B);

  static const Color good = Color(0xFF22C55E);
  static const Color goodBg = Color(0xFF10261A);
  static const Color goodText = Color(0xFF7EE2A8);

  static const Color warn = Color(0xFFF5B942);
  static const Color warnBg = Color(0xFF2A2310);
  static const Color bad = Color(0xFFEF5350);
  static const Color badBg = Color(0xFF2A1414);
  static const Color badText = Color(0xFFFF8A87);

  // Service-module accent colors. These keep the same EMC cyan/aqua brand
  // combination across the app.
  static const Color future = Color(0xFF09B9E9);
  static const Color futureBg = Color(0xFF102832);
  static const Color futureBorder = Color(0xFF1D5364);
  static const Color futureText = Color(0xFF79F4FF);
  static const Color futureMuted = Color(0xFF9FB0BD);
}

class AppGradients {
  AppGradients._();

  static const LinearGradient brand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.cyan, AppColors.aqua],
  );

  static const LinearGradient future = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.cyan, AppColors.aqua],
  );
}

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Aptos',
      scaffoldBackgroundColor: AppColors.appBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.cyan,
        secondary: AppColors.aqua,
        surface: AppColors.panel,
        error: AppColors.bad,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.text),
        bodySmall: TextStyle(color: AppColors.text2),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.appBackground,
        foregroundColor: AppColors.text,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.text,
          fontSize: 16,
          fontWeight: FontWeight.w800,
          fontFamily: 'Aptos',
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.panel2,
        hintStyle: const TextStyle(color: AppColors.text2),
        labelStyle: const TextStyle(color: AppColors.text2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.cyan),
        ),
      ),
    );
  }
}
