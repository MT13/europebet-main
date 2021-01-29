import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(EuropeBetMain());
}

class EuropeBetMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EuropeBet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xFF1C1D1E)
      ),
      home: HomePage(title: 'EuropeBet'),
    );
  }
}

