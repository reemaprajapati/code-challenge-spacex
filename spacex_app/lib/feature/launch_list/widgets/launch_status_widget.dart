import 'package:flutter/material.dart';
import 'package:spacex_app/feature/launch_list/data/launch_list_model.dart';
import 'package:spacex_app/res/colors.dart';
import 'package:spacex_app/res/strings.dart';

class LaunchStatusWidget extends StatelessWidget {
  final LaunchListModel launchModel;

  const LaunchStatusWidget({Key key, this.launchModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var launchType = launchModel.success
        ? UiStrings.success
        : launchModel.upcoming
            ? UiStrings.upcoming
            : launchModel.failures.isNotEmpty
                ? UiStrings.failed
                : "";

    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Text(
            "Status: $launchType",
            style: theme.textTheme.bodyText2.copyWith(
                color: AppColors.colorGrey.withOpacity(0.7), fontSize: 16),
          ),
          SizedBox(
            width: 8.0,
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: launchType == UiStrings.success
                    ? AppColors.colorGreen
                    : launchType == UiStrings.upcoming
                        ? AppColors.colorBlue
                        : AppColors.colorRed),
          )
        ],
      ),
    );
  }
}
