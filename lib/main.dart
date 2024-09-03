import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/screens/PantallaInicial.dart';
import 'package:flutter_application_1/screens/welcome/welcome.dart';
import 'package:flutter_application_1/services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();

  // Cargar el valor de name desde SharedPreferences
  String? name = LocalStorage.prefs.getString('name');

  runApp(MyApp(name: name));
}

class MyApp extends StatelessWidget {
  final String? name;

  const MyApp({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dosis App',
      // Mostrar la pantalla correspondiente según el valor de 'name'
      home: name != null && name != '' ? PantallaInicial() : const Welcome(),
      routes: routes,
    );
  }
}
