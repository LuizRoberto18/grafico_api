import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:graficos_api/models/log_test.dart';
import 'package:http/http.dart' as http;

class ApiGraficoLogTest {
  Future<List<ResultTest>?> pegarDadosTest() async {
    var url = Uri.parse("http://172.40.1.43:10501/monitor/logTest");

    try {
      var response = await http.get(url);
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        LogTest logTest = LogTest.fromJson(json.decode(response.body));
        return logTest.result;
      } else {
        throw Exception("Erro ao carregar dados");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
