import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqfprofider/project_provider.dart';
import 'package:sqfprofider/widget/taskitem.dart';

class TaskPage extends StatefulWidget {
  final String projectName;

  const TaskPage({Key key, this.projectName}) : super(key: key);
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  void initState() {
    //Agar membaca data task di awal-awal
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final projectProvider =
          Provider.of<ProjectProvider>(context, listen: false);
      await projectProvider.fetchAndSetDataTask(widget.projectName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final projectProvider =
        Provider.of<ProjectProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Task ${widget.projectName} '),
        ),
        body: Consumer<ProjectProvider>(
          builder: (context, provider, child) {
            return FutureBuilder(
              future: projectProvider.fetchAndSetDataTask(widget.projectName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (projectProvider.listtask.length == 0) {
                    return Center(
                      child: Text('Data Masih Kosong'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: projectProvider.listtask.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          width: double.maxFinite,
                          child: TaskItem(
                            value: projectProvider.listtask[index],
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //penggunan perintah add project di halaman
              projectProvider.addTask(
                  tasknametable: widget.projectName,
                  namatask: 'task pertama gaes',
                  datapertama: 'data kesatuu',
                  datakedua: 'data keduaa',
                  dataketiga: 'data ketigaa');
            });

            //untuk menghapuss
            projectProvider.deleteTask(
                taskname: 'task pertama gaes',
                tasktabelName: widget.projectName);
          },
          tooltip: 'Add Data',
          child: Icon(Icons.add),
          backgroundColor: Colors.red[400],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
