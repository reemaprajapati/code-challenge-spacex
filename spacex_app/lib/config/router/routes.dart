import 'package:fluro/fluro.dart';
import 'package:spacex_app/config/router/router_handlers.dart';

class AppRoutes {
  static String root = "/";
  static String detailScreen = "detail-screen";

  static final rootRoute = AppRoute(root, RouteHandlers.rootHandler);
  static final detailScreenRoute = AppRoute(detailScreen, RouteHandlers.detailScreenHandler);

  static final List<AppRoute> routes = [
    rootRoute,
    detailScreenRoute
 ];
}