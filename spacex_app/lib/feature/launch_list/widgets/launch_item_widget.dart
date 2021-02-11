import 'package:flutter/material.dart';
import 'package:spacex_app/config/router/app_router.dart';
import 'package:spacex_app/config/router/routes.dart';
import 'package:spacex_app/data/launch_argument_model.dart';
import 'package:spacex_app/feature/launch_list/data/launch_list_model.dart';
import 'package:spacex_app/feature/launch_list/widgets/launch_status_widget.dart';
import 'package:spacex_app/feature/launch_list/widgets/thumbnail_widget.dart';
import 'package:spacex_app/res/colors.dart';
import 'package:spacex_app/res/strings.dart';
import 'package:spacex_app/utils/utilities.dart';

class LaunchItemWidget extends StatelessWidget {
  final LaunchListModel launchModel;

  const LaunchItemWidget({Key key, this.launchModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => AppRouter.router.navigateTo(
        context,
        AppRoutes.detailScreen,
        routeSettings: RouteSettings(
            arguments: LaunchArgumentsModel(
                name: launchModel.name,
                date: launchModel.dateUtc,
                detail: launchModel.details,
                failures: launchModel.failures,
                largePatch: launchModel.links.patch.large,
                launcePad: launchModel.launchpad,
                rocketId: launchModel.rocket,
                success: launchModel.success,
                upcoming: launchModel.upcoming)),
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 4.0),
                child: ThumbnailImage(
                  imageUrl: launchModel.links.patch.small,
                )),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      launchModel.name ?? "",
                      style: theme.textTheme.headline1,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${UiStrings.launchDate} ${convertUtcTOLocalDate(launchModel.dateUtc)}",
                      style: theme.textTheme.bodyText2.copyWith(
                          color: AppColors.colorBlack.withOpacity(0.5),
                          fontSize: 16),
                    ),
                    LaunchStatusWidget(
                      successStatus: launchModel.success ?? false,
                      failures: launchModel.failures ?? [],
                      upcomingStatus: launchModel.upcoming ?? false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
