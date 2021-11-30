import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DatabaseProfider with ChangeNotifier {
  sql.Database db;
  DatabaseProfider() {
    // untuk Menginisiasi ketika DatabaseProfider dipakai
    init();
  }

  void init() async {
    final dbPath = await sql.getDatabasesPath();
    db = await sql.openDatabase(
      path.join(dbPath, 'project.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE project (id INTEGER PRIMARY KEY AUTOINCREMENT, judul TEXT, nama TEXT, keterangan TEXT, tanggal TEXT)');
      },
    );
    notifyListeners();
    print(db.path);
  }

  //Perintah untuk Insert Ke Database
  Future<void> insert(String table, Map<String, Object> data) async {
    await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  //Perintah Membuat task Database
  Future createTaskTable(String taskname) async {
    await db.execute(
        'CREATE TABLE task$taskname (id INTEGER PRIMARY KEY AUTOINCREMENT, namatask TEXT, datapertama TEXT, datakedua TEXT, dataketiga TEXT)');
  }

  //Menghapus Data tabel
  Future<void> delete({String table, String nama}) async {
    await db.delete(table, where: 'nama=?', whereArgs: [nama]);
  }

  //Perintah mengedit data
  Future<int> update(
      String table, Map data, String where, String whereargs) async {
    return await db
        .update(table, data, where: '$where = ?', whereArgs: [whereargs]);
  }

  //Perintah untuk menampilkan data
  Future<List<Map<String, dynamic>>> getData(String table) async {
    return await db.query(table);
  }
}
