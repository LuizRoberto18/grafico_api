import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graficos_api/data/api_grafico_log_report.dart';
import 'package:graficos_api/data/api_grafico_log_test.dart';
import 'package:graficos_api/widgets/card_grafico.dart';
import 'package:graficos_api/widgets/card_image.dart';
import 'package:graficos_api/widgets/card_texto.dart';
import 'package:graficos_api/widgets/formulario_ocorrencia.dart';
import 'package:graficos_api/widgets/tabel_log_test.dart';
import 'package:graficos_api/widgets/tabela_log_report.dart';
import 'package:grid_staggered_lite/grid_staggered_lite.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _apiLogReport = ApiGraficoLogReport();
  final _apiLogTest = ApiGraficoLogTest();
  late List<charts.Series<dynamic, num>> seriesList = [];
  bool? animate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiLogReport.pegarDadosReport();
    _apiLogTest.pegarDadosTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: CardGrafico(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: FormularioOcorrencia(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CardTexto(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CardImage(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: TabelogReport(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: TabelaLogTest(),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 500.0),
            StaggeredTile.extent(2, 350.0),
            StaggeredTile.extent(2, 200.0),
            StaggeredTile.extent(2, 170.0),
            StaggeredTile.extent(2, 500),
            StaggeredTile.extent(2, 500.0),
          ],
        ),
      ),
    );
  }
}
