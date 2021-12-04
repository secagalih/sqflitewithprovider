import 'package:flutter/widgets.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:sqfprofider/provider/databseProvider.dart';
import 'package:sqfprofider/model/project_model.dart';
import 'package:sqfprofider/model/task_model.dart';

class ProjectProvider with ChangeNotifier {
  final DatabaseProfider databaseProfider;
  List<ProjectModel> _projectList = [];
  List<ProjectModel> get listProject => [..._projectList];
  List<TaskModel> _taskList = [];
  List<TaskModel> get listtask => [..._taskList];

  //mengecek kalau database sudah ada
  ProjectProvider(this._projectList, this.databaseProfider) {
    if (databaseProfider != null) {
      fetchAndSetDataProject();
    }
  }

//Menambah Project
  Future addProject(
      {String judul, String nama, String keterangan, String tanggal}) async {
    if (databaseProfider != null) {
      databaseProfider.insert(
          'project',
          ProjectModel(
            judul: judul,
            nama: nama,
            keterangan: keterangan,
            tanggal: tanggal,
          ).toMap());
//ketika menambah project juga membuat tabel task
      await createTask(tasknametable: judul);
    }
  }

  //Menghapus Project
  Future deleteProjectItem({String nama}) async {
    await databaseProfider.delete(table: 'project', nama: nama);
    String tabelname = nama.replaceAll(' ', '').toLowerCase();
    // letila menghapus project, tabel task juga ikut terhapus
    await databaseProfider.db.execute("DROP TABLE IF EXISTS task$tabelname");
  }

  //membaca data dan menambahkan project dalam list
  Future<List<ProjectModel>> fetchAndSetDataProject() async {
    if (databaseProfider.db != null) {
      final dataList = await databaseProfider.getData('project');
      _projectList = dataList
          .map((item) => ProjectModel(
              judul: item['judul'],
              nama: item['nama'],
              keterangan: item['keterangan'],
              tanggal: item['tanggal']))
          .toList();
    }
    return _projectList;
  }

//Mengedit project

  Future editProject(
      {String tasktabelName,
      String namaproject,
      String judulproject,
      String keterangan,
      String tanggal,
      String where,
      String whereArgs}) async {
    String tabelname = tasktabelName.replaceAll(' ', '').toLowerCase();
    await databaseProfider.update(
        tabelname,
        ProjectModel(
          judul: judulproject,
          keterangan: keterangan,
          nama: namaproject,
          tanggal: tanggal,
        ).toMap(),
        where,
        whereArgs);
  }

//Membuat Task
  Future createTask({String tasknametable}) async {
    //untuk menghapus spasi
    String tabelname = tasknametable.replaceAll(' ', '').toLowerCase();
    print(tabelname);
    await databaseProfider.createTaskTable(tabelname);
    //Mengecek apakah task berhasil di buat
    int count = firstIntValue(await databaseProfider.db
        .rawQuery('SELECT COUNT(*) FROM task$tabelname '));
    print("Data $tabelname  : " + '$count');
  }

  //Menambahkan Task
  void addTask(
      {String tasknametable,
      String namatask,
      double datapertama,
      double datakedua,
      double dataketiga}) {
    if (databaseProfider != null) {
      String tabelname = tasknametable.replaceAll(' ', '').toLowerCase();
      databaseProfider.insert(
          'task$tabelname',
          TaskModel(
            namatask: namatask,
            datakedua: datakedua,
            dataketiga: dataketiga,
            datapertama: datapertama,
          ).toMap());
    }
  }

  //membaca data task
  Future<List<TaskModel>> fetchAndSetDataTask(String tasknametable) async {
    String tabelname = tasknametable.replaceAll(' ', '').toLowerCase();
    final dataList = await databaseProfider.getData('task$tabelname');
    _taskList = dataList.map((item) => TaskModel.fromMap(item)).toList();

    return _taskList;
  }

  //Menghapus task
  void deleteTask({String taskname, String tasktabelName}) async {
    String tabelname = tasktabelName.replaceAll(' ', '').toLowerCase();
    await databaseProfider.delete(table: 'task$tabelname', nama: taskname);
  }

//mengedit task
  Future edittask(
      {String tasktabelName,
      String namatask,
      double datapertama,
      double datakedua,
      double dataketiga,
      String where,
      String whereArgs}) async {
    String tabelname = tasktabelName.replaceAll(' ', '').toLowerCase();
    await databaseProfider.update(
        tabelname,
        TaskModel(
                namatask: namatask,
                datakedua: datakedua,
                datapertama: datapertama,
                dataketiga: dataketiga)
            .toMap(),
        where,
        whereArgs);
  }
}
