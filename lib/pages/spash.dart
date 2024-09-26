import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:segundoprojeto/pages/test.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // Inicializa o AnimationController
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: false); // Faz a animação reverter para a posição inicial

    animation = Tween<double>(begin: 0.0, end: 2).animate(controller);

    // Navegação após um atraso
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
    });
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose do controlador
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(34, 133, 158, 1), Color.fromRGBO(6, 52, 78, 1)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Aligns children at the top
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centers children horizontally
          children: <Widget>[
            const Spacer(flex: 1), // Controla o espaço abaixo do ícone
            Image.asset(
              "assets/image/logo.png",
              height: 200,
              width: 200,
              semanticLabel: 'Logo Image',
            ),
              const SizedBox(height: 0),
            AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: animation.value * 2.0 * 3.14159,
                    child: Image.asset(
                      "assets/image/loading.png",
                      color: Colors.white,
                      width: 80,
                      height: 80,
                      semanticLabel: 'Icone de carregamento',
                    ),
                  );
                }),
            const Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}