import 'package:flutter/material.dart';
import 'package:spacex_app/config/injection/dependency_injection.dart';
import 'package:spacex_app/feature/launch_list/bloc/launch_bloc.dart';
import 'package:spacex_app/feature/launch_list/widgets/launch_list_widget.dart';
import 'package:spacex_app/res/colors.dart';
import 'package:spacex_app/res/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchListScreen extends StatefulWidget {
  @override
  _LaunchListScreenState createState() => _LaunchListScreenState();
}

class _LaunchListScreenState extends State<LaunchListScreen> {
  LaunchListBloc launchListBloc;

  @override
  void initState() {
    super.initState();
    launchListBloc = locator<LaunchListBloc>();
  }

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
        body: BlocProvider(
          create: (BuildContext context) => launchListBloc..add(GetLaunchesListEvent()),
          child: LaunchListViewWidget(),
        ));
  }
}
