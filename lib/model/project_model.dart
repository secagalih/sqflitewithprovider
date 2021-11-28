// To parse this JSON data, do
//
//     final projectModel = projectModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProjectModel {
  ProjectModel({
    this.judul,
    this.nama,
    this.keterangan,
    this.tanggal,
  });

  String judul;
  String nama;
  String keterangan;
  String tanggal;

  factory ProjectModel.fromJson(String str) =>
      ProjectModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
        judul: json["judul"],
        nama: json["nama"],
        keterangan: json["keterangan"],
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toMap() => {
        "judul": judul,
        "nama": nama,
        "keterangan": keterangan,
        "tanggal": tanggal,
      };
}
