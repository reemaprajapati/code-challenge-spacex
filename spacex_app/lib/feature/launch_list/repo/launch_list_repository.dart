import 'package:flutter/cupertino.dart';
import '../data/launch_list_model.dart';
import 'package:spacex_app/providers/api_client.dart';

class LaunchListRepository {
  ApiClient apiClient;

  LaunchListRepository({@required this.apiClient});

  Future<List<LaunchListModel>> getLaunchList() async {
    try {
      var response = await apiClient.httpGet('/launches');
      return (response.data as List)
          .map((launchModel) => LaunchListModel.fromJson(launchModel))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
