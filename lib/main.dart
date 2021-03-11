import 'package:flutter/material.dart';
import 'package:flutter_app/TabHolder.dart';
import 'package:flutter_app/styles/AppTheme.dart';
import 'package:flutter_app/auth/Register.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getThemeFromThemeMode(1),
      home: TabHolder(),
    );
  }
}
