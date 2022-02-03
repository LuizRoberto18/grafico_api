import 'package:flutter/material.dart';

import 'grafico_linha.dart';

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
          padding: EdgeInsets.all(8.0),
          child: Container(
            width: 1000,
            height: 500,

            margin: EdgeInsets.all(10),
            child: Grafico(isShowingMainData: false,),


          ),
        ),
      ),
    );
  }
}
