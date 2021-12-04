import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqfprofider/provider/databseProvider.dart';
import 'package:sqfprofider/page/home_page.dart';
import 'package:sqfprofider/locator.dart';
import 'package:sqfprofider/provider/project_provider.dart';
import 'package:sqfprofider/provider/task_detail_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => locator<DatabaseProfider>(),
        ),
        //provider untuk mengupdate data projectprovider
        ChangeNotifierProxyProvider<DatabaseProfider, ProjectProvider>(
          create: (context) => ProjectProvider([], null),
          update: (context, dbValue, previous) =>
              ProjectProvider(previous.listProject, dbValue),
        ),
        ChangeNotifierProvider(
          create: (_) => locator<PerhitunganTask>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
