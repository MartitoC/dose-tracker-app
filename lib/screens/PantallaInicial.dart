// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/calendar.dart';
import '../screens/Pantalla_opciones.dart';

class PantallaInicial extends StatelessWidget {
  const PantallaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE8F4FF),
                Color(0xFFFCCEE7),
              ],
            ),
          ),
          child: const Column(
            children: [
              Calendar(),
              Expanded(
                child: Center(
                  child: Text(
                    'no hay ninguna dosis añadida',
                    style: TextStyle(
                      color: Color(0xFFFD8EAE),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/opciones');
        },
        backgroundColor: const Color(0xFF7F82F5),
        child: const Icon(
          Icons.add,
          size: 35.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
