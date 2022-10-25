import 'package:flutter/material.dart';
import 'package:projeto_perguntas/login_page.dart';
import 'package:projeto_perguntas/pergunta.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pink),
      initialRoute: '/',
      routes: {
        '/' :(context) =>  const LoginPage(),
        '/perguntaApp' :(context) => const PerguntaApp(),
      }
    );
  }
}