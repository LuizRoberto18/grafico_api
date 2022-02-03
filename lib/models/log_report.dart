class LogReport {
  bool? ok;
  List<Result>? result;

  LogReport({this.ok, this.result});

  LogReport.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
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

class Result {
  int? id;
  String? recTime;
  String? desc;
  String? date;

  Result({this.id, this.recTime, this.desc, this.date});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recTime = json['rec_time'];
    desc = json['desc'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rec_time'] = this.recTime;
    data['desc'] = this.desc;
    data['date'] = this.date;
    return data;
  }
}
