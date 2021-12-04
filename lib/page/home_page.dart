import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqfprofider/page/task_page.dart';
import 'package:sqfprofider/provider/project_provider.dart';
import 'package:sqfprofider/widget/projectItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final projectProvider =
        Provider.of<ProjectProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Project List'),
        ),
        // di bungkus consumer, futurebuilder, biar datanya update otomatis
        body: Consumer<ProjectProvider>(
            builder: (context, projectProvider, child) {
          return FutureBuilder(
            future: projectProvider.fetchAndSetDataProject(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (projectProvider.listProject.isEmpty) {
                  return Center(
                    child: Text('Data Masih Kosong'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: projectProvider.listProject.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        width: double.maxFinite,
                        child: ProjectItem(
                          value: projectProvider.listProject[index],
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TaskPage(
                                      projectName: projectProvider
                                          .listProject[index].judul,
                                    )));
                          },
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
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //penggunan perintah add project di halaman
              projectProvider.addProject(
                  judul: 'Project 9',
                  keterangan: 'Katana',
                  nama: 'Momosuke',
                  tanggal: '12.03.03');

              //penggunanan perintah delet project di halaman
              // projectProvider.deleteProjectItem(nama: 'Momosuke');
            });
          },
          tooltip: 'Add Data',
          child: Icon(Icons.add),
          backgroundColor: Colors.blue[400],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
