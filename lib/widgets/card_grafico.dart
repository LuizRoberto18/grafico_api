import 'package:flutter/material.dart';

import 'grafico_linha.dart';
import 'package:graficos_api/widgets/grafico_linha.dart';

class CardGrafico extends StatefulWidget {
  const CardGrafico({Key? key}) : super(key: key);

  @override
  _CardGraficoState createState() => _CardGraficoState();
}

class _CardGraficoState extends State<CardGrafico> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Server: 172.40.1.41",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    height: 20,
                    width: 100,
                    color: Color(0xff861be2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Server: localhost",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    height: 20,
                    width: 100,
                    color: Color(0xff27b6fc),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                color: Colors.grey[200],
                height: 700,
                width: 900,
                child: Grafico(
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
