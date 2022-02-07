import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graficos_api/data/api_grafico_log_test.dart';
import 'package:graficos_api/models/log_test.dart';
import 'package:intl/intl.dart';

class Grafico extends StatefulWidget {
  @override
  State<Grafico> createState() => GraficoState();
}

enum Servidores { localHost, sevidor2 }

class GraficoState extends State<Grafico> {
  List<ResultTest>? _listresultTest;
  double? valor = 0;
  double? res = 0;
  double? valorInicial = 0;
  List results = [];
  List<double> posicaoServer172 = [];
  List<double> listaPosicoes = [];

  loadDados() async {
    //esperando dados da API
    _listresultTest = await ApiGraficoLogTest.pegarDadosTest();
    //for para conter a quantidade de avareges dentro de 24 posições
    for (int i = 0; i < 24; i++) {
      //posicaoServer172.add(7.0);
      posicaoServer172
          .add(double.parse(_listresultTest![i].average!.toStringAsFixed(1)));
      print(posicaoServer172);
    }
    //for para pegar a quantidade de avareges feitas na API
    for (int i = 0; i < _listresultTest!.length; i++) {
      if (valor! < _listresultTest![i].average!) {
        valor = double.parse(_listresultTest![i].average!.toStringAsFixed(0));
      }
    }
    //pegando posições do eixoY
    res = valor! / 8.0;
    for (int i = 0; i < 9; i++) {
      results.add(valorInicial);
      valorInicial = valorInicial! + res!;
    }

    var _locaHost =
        _listresultTest!.where((element) => element.server == "localhost");
    var server2 =
        _listresultTest!.where((element) => element.server == "172.40.1.43");
    _listresultTest!.where((element) => element.hour == "hour");
    listaPosicoes = _listresultTest!.map((e) => e.average!.toDouble()).toList();
    print(results);
    print(_listresultTest![0].average);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDados();
  }

  @override
  Widget build(BuildContext context) {
    loadDados();
    print("loadados ${loadDados()}");
    return LineChart(
      sampleData1,
      swapAnimationDuration: Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        //pegando for de valores EixoX
        maxX: 23,
        maxY: 8,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                break;
            }
            //pegando EixoY da APi
            return '${results[value.toInt()]}';
          },
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        minX: 0,
        maxX: 20,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
              case 5:
                return '6m';
            }
            return '';
          },
        ),
      );

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff0f00cd),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff040adb),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          return "$value";
        },
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: false,
        colors: [Color(0xff861be2)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(show: false, colors: [
          Color(0x00aa4cfc),
        ]),
        spots: [
          for (int i = 0; i < 24; i++) ...{
            FlSpot(i.toDouble(), listaPosicoes[i]),
          }
          // FlSpot(_listresultTest![index].server!.toString()),
          // FlSpot(results[value.toInt()]),
          //  FlSpot(5, 2.8),
          //  FlSpot(7, 1.2),
          //  FlSpot(10, 2.8),
          //  FlSpot(12, 2.6),
          //  FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: false,
        colors: const [Color(0xff27b6fc)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [
              Color(0xff2c274c),
              Color(0xff46426c),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                const Text(
                  'Unfold Shop 2018',
                  style: TextStyle(
                    color: Color(0xff827daa),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Monthly Sales',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: Grafico(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
