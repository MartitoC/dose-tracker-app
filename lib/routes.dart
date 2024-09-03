import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pantalla_opciones.dart';
import 'package:flutter_application_1/screens/welcome/welcome_form.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/opciones': (BuildContext context) => const PantallaOpciones(),
  '/welcome_form': (BuildContext context) => const WelcomeForm()
};
