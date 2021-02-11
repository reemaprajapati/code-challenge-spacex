import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:spacex_app/feature/launch_detail_screen/launch_pad_bloc/launchpad_detail_bloc.dart';
import 'package:spacex_app/feature/launch_detail_screen/repo/launch_detail_repository.dart';
import 'package:spacex_app/feature/launch_detail_screen/rocket_detail_bloc/rocket_detail_bloc.dart';
import 'package:spacex_app/feature/launch_list/bloc/launch_bloc.dart';
import 'package:spacex_app/feature/launch_list/repo/launch_list_repository.dart';
import 'package:spacex_app/providers/api_client.dart';

final locator = GetIt.instance;
void setUpLocator() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton(() => ApiClient(locator()));
  locator.registerLazySingleton<LaunchListRepository>(() => LaunchListRepository(apiClient: locator()));
  locator.registerLazySingleton(() => LaunchDetailRepository(apiClient: locator()));
  locator.registerLazySingleton(() => LaunchListBloc(launchListRepository: locator()));
  locator.registerLazySingleton(() => RocketDetailBloc(launchDetailRepository: locator()));
  locator.registerLazySingleton(() => LaunchpadDetailBloc(launchDetailRepository: locator()));
}