import 'package:get_it/get_it.dart';
import 'package:sqfprofider/databseProvider.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DatabaseProfider());
}
