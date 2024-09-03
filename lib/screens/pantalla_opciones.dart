// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../models/dosis.dart';

class PantallaOpciones extends StatefulWidget {
  const PantallaOpciones({super.key});

  @override
  _PantallaOpcionesState createState() => _PantallaOpcionesState();
}

class _PantallaOpcionesState extends State<PantallaOpciones> {
  final TextEditingController _nombreController = TextEditingController();
  final List<TimeOfDay?> _horasSeleccionadas = [null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nombre",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 306,
              height: 51,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F4FF), // #E8F4FF
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                  hintText: "Escriba el nombre del medicamento",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200, // Extra light
                    color: Colors.black.withOpacity(0.25), // 25% opacity
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Hora:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: _horasSeleccionadas.asMap().entries.map((entry) {
                int index = entry.key;
                TimeOfDay? hora = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 306,
                          height: 51,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F4FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.access_time,
                                      color: Colors.black.withOpacity(0.5)),
                                  onPressed: () async {
                                    TimeOfDay? selectedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    setState(() {
                                      _horasSeleccionadas[index] = selectedTime;
                                    });
                                  },
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  hora != null
                                      ? hora.format(context)
                                      : "Seleccionar Hora",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black.withOpacity(0.25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (index == _horasSeleccionadas.length - 1)
                        IconButton(
                          icon: const Icon(Icons.add, color: Color(0xFF7F82F5)),
                          onPressed: () {
                            setState(() {
                              _horasSeleccionadas.add(null);
                            });
                          },
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<TimeOfDay> horas =
              _horasSeleccionadas.whereType<TimeOfDay>().toList();
          Dosis nuevaDosis = Dosis(
            nombre: _nombreController.text,
            hora: horas.isNotEmpty ? horas[0] : TimeOfDay.now(),
          );
          Navigator.pop(context, nuevaDosis);
        },
        backgroundColor: const Color(0xFF7F82F5),
        child: const Icon(
          Icons.add,
          size: 35.0,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
