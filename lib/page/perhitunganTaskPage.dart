import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqfprofider/model/task_model.dart';
import 'package:sqfprofider/provider/task_detail_provider.dart';

class PerthitunganTaskPage extends StatelessWidget {
  final TaskModel task;

  const PerthitunganTaskPage({Key key, this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final perhitungantaskProvider =
        Provider.of<PerhitunganTask>(context, listen: false);

    double penmjumlahan = perhitungantaskProvider.penjumlahan(
        dataPertama: task.datapertama, dataKedua: task.datakedua);

    double perkalian = perhitungantaskProvider.perkalian(
        dataKedua: task.datakedua, dataKetiga: task.dataketiga);
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Task '),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text('PENJUMLAHAN data Pertama data Kedua'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${task.datapertama} '),
                Text('+'),
                Text(' ${task.datakedua}')
              ],
            ),
            Text('$penmjumlahan'),
            SizedBox(
              height: 10,
            ),
            Text('PERKALIAN data Kedua  data Ketiga'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${task.datakedua} '),
                Text('X'),
                Text(' ${task.dataketiga}')
              ],
            ),
            Text('$perkalian'),
          ],
        ),
      ),
    );
  }
}
