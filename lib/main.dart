import 'package:flutter/material.dart';
import 'package:graficos_api/views/home_page.dart';
import 'package:graficos_api/widgets/grafico_linha.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Final',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Grafico de Registro',),
    );
  }
}
