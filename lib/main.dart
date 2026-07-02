import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen/auth/login_screen.dart';
import 'screen/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.appBackground,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.appBackground,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const PeopleHrApp());
}

class PeopleHrApp extends StatelessWidget {
  const PeopleHrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMC People Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}