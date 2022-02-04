import 'package:flutter/material.dart';
import 'package:graficos_api/models/log_report.dart';
import 'package:graficos_api/data/api_grafico_log_report.dart';
import 'package:graficos_api/widgets/formulario_ocorrencia.dart';

class TabelogReport extends StatefulWidget {
  TabelogReport({
    Key? key,
  }) : super(key: key);

  @override
  _TabelogReportState createState() => _TabelogReportState();
}

class _TabelogReportState extends State<TabelogReport> {
  final _apiLogReport = ApiGraficoLogReport();
  final _descricaoController = TextEditingController();
  final _dataController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      "Tabela Log Report",
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
                      child: FutureBuilder<List<Result>?>(
                        future: ApiGraficoLogReport.pegarDadosReport(),
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
                                      'ID',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'REC_TIME',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'DESC',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'DATE',
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
                                                    .data![index].id
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].recTime
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].desc
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: Text(snapshot
                                                    .data![index].date
                                                    .toString()),
                                              )),
                                              DataCell(Center(
                                                child: IconButton(
                                                  onPressed: () {
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          controller:
                                                              _descricaoController,
                                                          validator:
                                                              _validarDescricao,
                                                          decoration:
                                                              InputDecoration(
                                                            label: Text(
                                                                "Descrição"),
                                                          ),
                                                        ),
                                                        content: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          controller:
                                                              _dataController,
                                                          validator:
                                                              _validarData,
                                                          decoration:
                                                              InputDecoration(
                                                            label: Text("Data"),
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    'Cancel'),
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {

                                                              ApiGraficoLogReport.atualizarOcorrencia(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!
                                                                      .toInt(),
                                                                  _descricaoController
                                                                      .text,
                                                                  _dataController
                                                                      .text);
                                                              Navigator.pop(context, 'OK');
                                                            },
                                                            child: const Text(
                                                                'Atualizar'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  ),
                                                ),
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

  void _onClickAtualizar() {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      Navigator.pop(context, 'OK');
    }
  }

  String? _validarDescricao(String? text) {
    if (text!.isEmpty) {
      return "Digite a descrição";
    }
  }

  String? _validarData(String? text) {
    if (text!.isEmpty) {
      return "Digite a data";
    }
  }
}
