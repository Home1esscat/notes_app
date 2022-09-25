import 'package:app_client/ui/main_screen.dart';
import 'package:app_client/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}