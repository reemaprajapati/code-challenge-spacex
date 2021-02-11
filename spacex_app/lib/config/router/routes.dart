import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:spacex_app/config/router/router_handlers.dart';
import 'package:spacex_app/feature/route_not_found/route_not_found_screen.dart';

class AppRoutes {
  static String root = "/";

  static final routeNotFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint("Route not found.");
        return RouteNotFoundScreen();
      });

  static final rootRoute = AppRoute(root, RouteHandlers.rootHandler);

  static final List<AppRoute> routes = [
    rootRoute,
 ];
}