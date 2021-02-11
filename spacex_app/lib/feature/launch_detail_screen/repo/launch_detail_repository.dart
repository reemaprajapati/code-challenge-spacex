import 'package:flutter/material.dart';
import 'package:spacex_app/constants/api_constants.dart';
import 'package:spacex_app/feature/launch_detail_screen/data/launch_pad_detail_response.dart';
import 'package:spacex_app/feature/launch_detail_screen/data/rocket_detail_reponse.dart';
import 'package:spacex_app/providers/api_client.dart';

class LaunchDetailRepository {
  ApiClient apiClient;

  LaunchDetailRepository({@required this.apiClient});

  Future<RocketDetailResponse> getRocketDetails(String rocketId) async {
    try {
      var response = await apiClient.httpGet("/rockets/$rocketId");
      print(response);
      return RocketDetailResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<LaunchPadDetailResponse> getLaunchPadDetails(String launchPadId) async {
    print(ApiConstants.baseUrl+"/launchpads/$launchPadId");
    try {
      var response = await apiClient.httpGet("/launchpads/$launchPadId");
      return LaunchPadDetailResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
