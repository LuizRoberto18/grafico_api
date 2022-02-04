import 'package:flutter/material.dart';
import 'package:graficos_api/data/api_grafico_log_test.dart';
import 'package:graficos_api/models/log_test.dart';

class TabelaLogTest extends StatefulWidget {
  const TabelaLogTest({Key? key}) : super(key: key);

  @override
  _TabelaLogTestState createState() => _TabelaLogTestState();
}

class _TabelaLogTestState extends State<TabelaLogTest> {
  @override
  Widget build(BuildContext context) {
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
                      "Tabela Log Test",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 600,
                      height: 400,
                      child: FutureBuilder<List<ResultTest>?>(
                        future: ApiGraficoLogTest.pegarDadosTest(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                  "Erro Server",
                                  style: TextStyle(fontSize: 35),
                                ));
                          }
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'SERVER',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'HOUR',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'AVERAGE',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'QUANTITY',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'LONGER TIME',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return DataTable(
                                        showCheckboxColumn: false,
                                        columns: <DataColumn>[
                                          DataColumn(
                                            label: Text(""),
                                          ),
                                          DataColumn(
                                            label: Text(""),
                                          ),
                                          DataColumn(
                                            label: Text(""),
                                          ),
                                          DataColumn(
                                            label: Text(""),
                                          ),
                                          DataColumn(
                                            label: Text(""),
                                          ),
                                        ],
                                        rows: <DataRow>[
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].server
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].hour
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].average
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].quantity
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].longerTime
                                                    .toString()),
                                              )),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
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
}
