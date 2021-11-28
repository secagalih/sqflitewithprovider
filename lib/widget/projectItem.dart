import 'package:flutter/material.dart';
import 'package:sqfprofider/model/project_model.dart';

class ProjectItem extends StatelessWidget {
  final ProjectModel value;
  final void Function() onTap;

  const ProjectItem({Key key, this.value, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('Judul '),
                Text(value.judul),
              ],
            ),
            Row(
              children: [
                Text('Nama '),
                Text(value.nama),
              ],
            ),
            Row(
              children: [
                Text('Keterangan '),
                Text(value.keterangan),
              ],
            ),
            Row(
              children: [
                Text('Tanggal '),
                Text(value.tanggal),
              ],
            )
          ],
        ),
      ),
    );
  }
}
