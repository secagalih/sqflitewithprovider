// To parse this JSON data, do
//
//     final taskModel = taskModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class TaskModel {
  TaskModel({
    this.namatask,
    this.datapertama,
    this.datakedua,
    this.dataketiga,
  });

  String namatask;
  String datapertama;
  String datakedua;
  String dataketiga;

  factory TaskModel.fromJson(String str) => TaskModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
        namatask: json["namatask"],
        datapertama: json["datapertama"],
        datakedua: json["datakedua"],
        dataketiga: json["dataketiga"],
      );

  Map<String, dynamic> toMap() => {
        "namatask": namatask,
        "datapertama": datapertama,
        "datakedua": datakedua,
        "dataketiga": dataketiga,
      };
}
