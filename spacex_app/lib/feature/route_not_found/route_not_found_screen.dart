import 'package:flutter/material.dart';
import 'package:spacex_app/config/router/app_router.dart';
import 'package:spacex_app/config/router/routes.dart';
import 'package:spacex_app/res/colors.dart';
import 'package:spacex_app/res/strings.dart';

class RouteNotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(UiStrings.route_not_found,
                style: theme.textTheme.bodyText2.copyWith(fontSize: 16)),
            TextButton(
              onPressed: () => AppRouter.router.navigateTo(
                context,
                AppRoutes.root,
                replace: true,
                clearStack: true,
              ),
              child: Text(
                UiStrings.go_home,
                style: theme.textTheme.bodyText2
                    .copyWith(fontSize: 20, color: AppColors.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
