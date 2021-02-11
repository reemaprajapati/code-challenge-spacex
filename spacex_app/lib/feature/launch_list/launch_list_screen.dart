import 'package:flutter/material.dart';
import 'package:spacex_app/res/colors.dart';
import 'package:spacex_app/res/strings.dart';

class LaunchListScreen extends StatefulWidget {
  @override
  _LaunchListScreenState createState() => _LaunchListScreenState();
}

class _LaunchListScreenState extends State<LaunchListScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          UiStrings.launches,
          style: theme.textTheme.headline1
              .copyWith(color: AppColors.colorWhite, fontSize: 20),
        ),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
