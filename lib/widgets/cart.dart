import 'dart:math';

import 'package:flutter/material.dart';

class HourCard extends StatelessWidget {
  final String hour;

  const HourCard({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          width: 60,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: getRandomColor(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(hour,
              style: const TextStyle(fontSize: 18, color: Colors.white)),
        ));
  }
}

List<String> horas = ['09:00', '14:00', '15:00', '17:00'];

Color getRandomColor() {
  final random = Random();
  final r = random.nextInt(128) + 127;
  final g = random.nextInt(128) + 127;
  final b = random.nextInt(128) + 127;

  return Color.fromARGB(255, r, g, b);
}
