import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Center(
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
                      'Tu enfermera virtual',
                      style: TextStyle(
                          color: Color.fromRGBO(43, 41, 41, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    width: 266,
                    child: Text(
                      'Con la ayuda de MybigDock tendrás la dosis diaria que te hace falta...',
                      style: TextStyle(
                          color: Color.fromRGBO(188, 81, 81, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/welcome_form');
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
    );
  }
}
