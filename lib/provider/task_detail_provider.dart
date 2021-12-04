import 'package:flutter/cupertino.dart';
import 'package:sqfprofider/model/task_model.dart';

class PerhitunganTask with ChangeNotifier {
  TaskModel _taskModel;

  set changeTaskModel(TaskModel task) {
    _taskModel = task;
  }

  double _hasilJumlah = 0;
  double _hasilKali = 0;

  TaskModel get taskdata => _taskModel;
  double get hasilKali => _hasilKali;
  double get hasilJumlah => _hasilJumlah;

  double penjumlahan() {
    _hasilJumlah = _taskModel.datapertama + _taskModel.datakedua;

    return _hasilJumlah;
  }

  double perkalian() {
    _hasilKali = _taskModel.dataketiga * _taskModel.datakedua;

    return _hasilKali;
  }
}
