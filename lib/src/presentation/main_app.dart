import 'package:flutter/material.dart';
import 'package:input_textformfield/src/presentation/login_page.dart';
import 'package:input_textformfield/src/presentation/second_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
