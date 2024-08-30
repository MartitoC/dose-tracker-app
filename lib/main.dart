import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import '../screens/PantallaInicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dosis App',
      home: const PantallaInicial(),
      routes: routes,
    );
  }
}
