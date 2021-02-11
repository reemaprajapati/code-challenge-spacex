import 'package:flutter/material.dart';
import 'package:spacex_app/config/injection/dependency_injection.dart' as di;
import 'package:spacex_app/config/router/app_router.dart';
import 'package:spacex_app/config/router/router_handlers.dart';
import 'package:spacex_app/config/router/routes.dart';
import 'package:spacex_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.setUpLocator();
  AppRouter appRouter = AppRouter(
    routes: AppRoutes.routes,
    notFoundHandler: RouteHandlers.routeNotFoundHandler,
  );
  appRouter.setupRoutes();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.root,
      onGenerateRoute: AppRouter.router.generator,
      theme: appTheme(),
    );
  }
}
