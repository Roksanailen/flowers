import 'package:get_it/get_it.dart';

import 'core/bloc/theme_service_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async => appDependencies();
Future<void> appDependencies() async {
  serviceLocator.registerLazySingleton<ThemeServiceBloc>(
    () => ThemeServiceBloc(),
  );
}
