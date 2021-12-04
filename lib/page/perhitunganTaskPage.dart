import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqfprofider/model/task_model.dart';
import 'package:sqfprofider/provider/task_detail_provider.dart';

class PerthitunganTaskPage extends StatefulWidget {
  final TaskModel task;

  const PerthitunganTaskPage({Key key, this.task}) : super(key: key);

  @override
  _PerthitunganTaskPageState createState() => _PerthitunganTaskPageState();
}

class _PerthitunganTaskPageState extends State<PerthitunganTaskPage> {
  @override
  void initState() {
    final perhitungantaskProvider =
        Provider.of<PerhitunganTask>(context, listen: false);
    perhitungantaskProvider.changeTaskModel = widget.task;
    perhitungantaskProvider.penjumlahan();
    perhitungantaskProvider.perkalian();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final perhitungantaskProvider =
        Provider.of<PerhitunganTask>(context, listen: false);
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
                Text('${widget.task.datapertama} '),
                Text('+'),
                Text(' ${widget.task.datakedua}')
              ],
            ),
            Text('${perhitungantaskProvider.hasilJumlah}'),
            SizedBox(
              height: 10,
            ),
            Text('PERKALIAN data Kedua  data Ketiga'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${widget.task.datakedua} '),
                Text('X'),
                Text(' ${widget.task.dataketiga}')
              ],
            ),
            Text('${perhitungantaskProvider.hasilKali}'),
          ],
        ),
      ),
    );
  }
}
