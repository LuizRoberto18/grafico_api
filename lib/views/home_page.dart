import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, -0.5, -1.0, -1.5, 0.0, 0.0];
  var data1 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];

  List<CircularStackEntry> circularData = <CircularStackEntry>[
    CircularStackEntry(<CircularSegmentEntry>[
      CircularSegmentEntry(700.0, Colors.amber, rankKey: 'Q1'),
      CircularSegmentEntry(1000.0, Colors.lightBlue, rankKey: 'Q2'),
      CircularSegmentEntry(1000.0, Colors.red, rankKey: 'Q3'),
      CircularSegmentEntry(1000.0, Colors.indigo, rankKey: 'Q4'),
    ], rankKey: 'Profits'),
  ];

  Material _textoItens(String titulo, String subTitulo) {
    return Material(
      color: Colors.white,
      elevation: 14,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Colors.black,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.chartLine),
          ),
        ],
      ),
      body: Container(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12,

          mainAxisSpacing: 12,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: _textoItens("mktg. spend", "48.6M"),
            ),
          ],

        ),
      ),
    );
  }
}
