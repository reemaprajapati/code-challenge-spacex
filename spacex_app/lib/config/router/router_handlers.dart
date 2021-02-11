import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/data/launch_argument_model.dart';
import 'package:spacex_app/feature/launch_detail_screen/launch_detail_screen.dart';
import 'package:spacex_app/feature/launch_list/launch_list_screen.dart';
import 'package:spacex_app/feature/route_not_found/route_not_found_screen.dart';

class RouteHandlers {
  static Handler rootHandler = Handler(
    handlerFunc: (context, parameters) => LaunchListScreen(),
  );

  static final routeNotFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint("Route not found.");
        return RouteNotFoundScreen();
      });

  static Handler detailScreenHandler =
      Handler(handlerFunc: (context, params) {
    final LaunchArgumentsModel args = ModalRoute.of(context).settings.arguments;
    return LaunchDetailScreen(launchModel: args);
  });
}
