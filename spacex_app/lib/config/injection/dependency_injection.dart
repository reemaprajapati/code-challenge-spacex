import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:spacex_app/constants/api_constants.dart';
import 'package:spacex_app/feature/launch_list/repo/launch_list_repository.dart';
import 'package:spacex_app/providers/api_client.dart';

final locator = GetIt.instance;
void setUpLocator() {
  locator.registerFactory(
          () => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)));
  locator.registerSingleton(() => ApiClient(locator()));
  locator.registerSingleton(() => LaunchListRepository(apiClient: locator()));
}