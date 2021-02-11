import 'package:fluro/fluro.dart';
import 'package:spacex_app/feature/launch_list/launch_list_screen.dart';

class RouteHandlers {
  static Handler rootHandler = Handler(
    handlerFunc: (context, parameters) => LaunchListScreen(),
  );
}
