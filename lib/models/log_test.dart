class LogTest {
  bool? ok;
  List<ResultTest>? result;

  LogTest({this.ok, this.result});

  LogTest.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['result'] != null) {
      result = <ResultTest>[];
      json['result'].forEach((v) {
        result!.add(new ResultTest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultTest {
  String? type;
  String? server;
  String? portserver;
  String? hour;
  double? longerTime;
  double? shorterTime;
  double? average;
  int? quantity;

  ResultTest(
      {this.type,
        this.server,
        this.portserver,
        this.hour,
        this.longerTime,
        this.shorterTime,
        this.average,
        this.quantity});

  ResultTest.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    server = json['server'];
    portserver = json['portserver'];
    hour = json['hour'];
    longerTime = json['longerTime'];
    shorterTime = json['shorterTime'];
    average = json['average'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['server'] = this.server;
    data['portserver'] = this.portserver;
    data['hour'] = this.hour;
    data['longerTime'] = this.longerTime;
    data['shorterTime'] = this.shorterTime;
    data['average'] = this.average;
    data['quantity'] = this.quantity;
    return data;
  }
}
