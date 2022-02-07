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
  late List<charts.Series<dynamic, num>> seriesList = [];
  bool? animate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, right: 10, left: 10),
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
            StaggeredTile.extent(4, 600.0),
            StaggeredTile.extent(2, 350.0),
            StaggeredTile.extent(2, 200.0),
            StaggeredTile.extent(2, 170.0),
            StaggeredTile.extent(2, 530),
            StaggeredTile.extent(2, 500.0),
          ],
        ),
      ),
    );
  }
}
