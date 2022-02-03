import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:graficos_api/models/log_report.dart';
import 'package:http/http.dart' as http;

class ApiGraficoLogReport {
  Future<List<Result>?> pegarDadosReport() async {
    var url = Uri.parse("http://172.40.1.43:10501/monitor/logReport");
    var response = await http.get(url);
    try {
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        LogReport logReport = LogReport.fromJson(json.decode(response.body));
        return logReport.result;
      } else {
        throw Exception("Erro ao carregar dados");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Result>?> criarOcorrencia(
       String desc, String date) async {
    var url = Uri.parse("http://172.40.1.43:10501/monitor/logReport");

    try {
      Map params = {
        "desc": desc,
        "date": date,
      };
      var response = await http.post(url, body: json.encode(params));
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        LogReport logReport = LogReport.fromJson(json.decode(response.body));
        return logReport.result;
      } else {
        throw Exception("Erro ao carregar dados");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
 static Future<dynamic> atualizarOcorrencia(
      int id, String desc, String date) async {
    var url = Uri.parse("http://172.40.1.43:10501/monitor/logReport");

    try {
      Map params = {
        "id": id,
        "desc": desc,
        "date": date,
      };

      print(params);
      print(url);
      var response = await http.put(url, body: json.encode(params));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Erro ao carregar dados");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
