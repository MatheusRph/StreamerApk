import 'package:flutter/material.dart';
import 'package:segundoprojeto/pages/spash.dart';
import 'package:segundoprojeto/shares/style.dart';
// ignore: unused_import
import 'pages/login.dart'; // Certifique-se de que este caminho está correto
import 'pages/cadastro.dart'; // Certifique-se de que este caminho está correto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
      ),
      routes: {
        '/' : (context) => const SplashScreen(),
        '/cadastro' : (context) => CadastroPage(),
      },
    );
  }
}
