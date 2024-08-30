import 'package:flutter/material.dart';
import '../models/dosis.dart';

class PantallaOpciones extends StatefulWidget {
  @override
  _PantallaOpcionesState createState() => _PantallaOpcionesState();
}

class _PantallaOpcionesState extends State<PantallaOpciones> {
  final TextEditingController _nombreController = TextEditingController();
  List<TimeOfDay?> _horasSeleccionadas = [
    null
  ]; // Lista para almacenar las horas seleccionadas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
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
            // Texto "Nombre"
            Text(
              "Nombre",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500, // Medium
              ),
            ),
            SizedBox(height: 8),
            // Campo de texto
            Container(
              width: 306,
              height: 51,
              decoration: BoxDecoration(
                color: Color(0xFFE8F4FF), // #E8F4FF
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
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
            SizedBox(height: 32),
            // Texto "Hora:"
            Text(
              "Hora:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500, // Medium
              ),
            ),
            SizedBox(height: 8),
            // Campos de hora dinámicos
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
                            color: Color(0xFFE8F4FF), // #E8F4FF
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
                                SizedBox(width: 8),
                                Text(
                                  hora != null
                                      ? hora.format(context)
                                      : "Seleccionar Hora",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200, // Extra light
                                    color: Colors.black
                                        .withOpacity(0.25), // 25% opacity
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (index ==
                          _horasSeleccionadas.length -
                              1) // Mostrar el botón '+' solo en el último campo
                        IconButton(
                          icon: Icon(Icons.add, color: Color(0xFF7F82F5)),
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
      // Botón circular en la esquina inferior derecha
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Crear la instancia de Dosis con el nombre y la lista de horas
          List<TimeOfDay> horas =
              _horasSeleccionadas.whereType<TimeOfDay>().toList();
          Dosis nuevaDosis = Dosis(
            nombre: _nombreController.text,
            hora: horas.isNotEmpty ? horas[0] : TimeOfDay.now(),
          );
          print(
              "Dosis guardada: ${nuevaDosis.nombre} a las ${nuevaDosis.hora.format(context)}");
          Navigator.pop(context, nuevaDosis);
        },
        backgroundColor: Color(0xFF7F82F5), // #7F82F5
        child: Icon(
          Icons.add,
          size: 35.0,
          color: Colors.white, // Color del ícono
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
