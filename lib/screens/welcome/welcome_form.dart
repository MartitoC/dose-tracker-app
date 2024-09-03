import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/PantallaInicial.dart';
import 'package:flutter_application_1/services/local_storage.dart';

class WelcomeForm extends StatefulWidget {
  const WelcomeForm({super.key});

  @override
  State<WelcomeForm> createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: const Color(0xFFE8F4FF),
        child: SafeArea(
          bottom: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/nurse_welcome.png',
                        width: 285,
                        height: 266,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: Text(
                          '¿Como te llamas?',
                          style: TextStyle(
                              color: Color.fromRGBO(43, 41, 41, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _textEditingController,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Escribe tu nombre o tu apodo',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, 0.25)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          LocalStorage.prefs
                              .setString('name', _textEditingController.text);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const PantallaInicial()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Container(
                          width: 68,
                          height: 68,
                          margin: const EdgeInsets.only(top: 48),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(127, 130, 245, 1),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 44,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
