import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

import 'screens/initial_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(
      brightness: Brightness.dark,);
    return MaterialApp(

      title: 'Flutter Demo',
        theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
        primary: Colors.blueGrey,
        secondary: Colors.blueGrey,
    ),
        ),
      home: TaskInherited(child: const InitialScreen()),

    );
  }
}






