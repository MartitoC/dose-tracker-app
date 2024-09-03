import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/local_storage.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String? name;
  @override
  void initState() {
    if (LocalStorage.prefs.getString('name') != null) {
      name = LocalStorage.prefs.getString('name') as String;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              '¡Bienvenido $name!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          TableCalendar(
            headerStyle: const HeaderStyle(
                titleCentered: true, formatButtonVisible: false),
            calendarFormat: CalendarFormat.week,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
