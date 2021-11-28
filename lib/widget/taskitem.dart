import 'package:flutter/material.dart';
import 'package:sqfprofider/model/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel value;

  const TaskItem({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('Nama Task '),
              Text(value.namatask),
            ],
          ),
          Row(
            children: [
              Text('Data Pertama '),
              Text(value.datapertama),
            ],
          ),
          Row(
            children: [
              Text('Data Kedua '),
              Text(value.datakedua),
            ],
          ),
          Row(
            children: [
              Text('Data Ketiga '),
              Text(value.dataketiga),
            ],
          )
        ],
      ),
    );
  }
}
