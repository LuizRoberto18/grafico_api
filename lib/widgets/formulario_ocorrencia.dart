import 'package:flutter/material.dart';
import 'package:graficos_api/data/api_grafico_log_report.dart';

class FormularioOcorrencia extends StatefulWidget {
  const FormularioOcorrencia({Key? key}) : super(key: key);

  @override
  _FormularioOcorrenciaState createState() => _FormularioOcorrenciaState();
}

class _FormularioOcorrenciaState extends State<FormularioOcorrencia> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _dataController = TextEditingController();
  DateTime _dataTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataTime;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 14,
      borderRadius: BorderRadius.circular(24),
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
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Criar Ocorrencia",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: 400,
                      height: 200,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                              controller: _descricaoController,
                              validator: _validarDescricao,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text("Descrição"),
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Data: \n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              subtitle: Text("${_dataTime.toString()}"),
                              onTap: _pickTime,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      ApiGraficoLogReport.criarOcorrencia(
                                          _descricaoController.text,
                                          _dataController.text);
                                    },
                                    child: Text("Salvar")),
                              ],
                            ),
                          ],
                        ),
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

  _pickTime() async {
    DateTime? d = await showDatePicker(
      context: context,
      initialDate: _dataTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      cancelText: "Cancelar",
      confirmText: "Confirmar",
      helpText: "Data Selecionada",
    );
    if (d! != null) {
      setState(() {
        _dataTime = d;
      });
    }
  }
}
