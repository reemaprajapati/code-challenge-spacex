import 'package:flutter/material.dart';
import 'package:spacex_app/config/injection/dependency_injection.dart' as di;
import 'package:spacex_app/config/router/app_router.dart';
import 'package:spacex_app/config/router/routes.dart';
import 'package:spacex_app/theme.dart';

void main() async {
  AppRouter appRouter = AppRouter(
    routes: AppRoutes.routes,
    notFoundHandler: AppRoutes.routeNotFoundHandler,
  );
  appRouter.setupRoutes();
  di.setUpLocator();
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
