import 'package:get_it/get_it.dart';
import 'package:sqfprofider/provider/databseProvider.dart';
import 'package:sqfprofider/provider/task_detail_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DatabaseProfider());
  locator.registerLazySingleton(() => PerhitunganTask());
}
