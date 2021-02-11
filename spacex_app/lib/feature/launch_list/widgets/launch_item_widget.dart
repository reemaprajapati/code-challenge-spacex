import 'package:flutter/material.dart';
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
      onTap: () => print("clicked"),
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
                    Text(launchModel.name ?? "",
                      style: theme.textTheme.headline1,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${UiStrings.launchDate} ${convertUtcTOLocalDate(
                          launchModel.dateUtc)}",
                      style: theme.textTheme.bodyText2.copyWith(
                          color: AppColors.colorBlack.withOpacity(0.5),
                          fontSize: 16),
                    ),
                    LaunchStatusWidget(launchModel: launchModel,)
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
