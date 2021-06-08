import 'package:flutter_switch_app/bloc/save_bloc.dart';
import 'package:flutter_switch_app/infrastructure/save_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MyRepo());

  locator.registerFactory<SaveBloc>(
    () => SaveBloc(locator<MyRepo>()),
  );
}
