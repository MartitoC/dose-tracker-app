import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/cart.dart';

class TarjetaDosis extends StatelessWidget {
  const TarjetaDosis({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            width: 361,
            height: 113,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: 86,
                  height: 86,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    'assets/pill_1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 186,
                      height: 56,
                      margin: const EdgeInsets.only(left: 10, right: 0),
                      padding: EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(),
                      child: const Text(
                        'Quitadol Foerte 500mg',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        width: 170,
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: horas.length,
                          itemBuilder: (context, index) {
                            return HourCard(hour: horas[index]);
                          },
                        ))
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      decoration: const BoxDecoration(),
                      child: Icon(
                        Icons.adaptive.more,
                        size: 32,
                        color: const Color.fromRGBO(252, 206, 231, 100),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}

List<String> horas = ['10:00', '14:00', '15:00', '17:00'];
