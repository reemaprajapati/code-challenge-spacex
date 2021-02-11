import 'package:flutter/material.dart';
import 'package:spacex_app/config/injection/dependency_injection.dart';
import 'package:spacex_app/data/launch_argument_model.dart';
import 'package:spacex_app/feature/launch_detail_screen/launch_pad_bloc/launchpad_detail_bloc.dart';
import 'package:spacex_app/feature/launch_detail_screen/rocket_detail_bloc/rocket_detail_bloc.dart';
import 'package:spacex_app/feature/launch_detail_screen/widgets/large_image_widget.dart';
import 'package:spacex_app/feature/launch_detail_screen/widgets/launch_pad_detail_widget.dart';
import 'package:spacex_app/feature/launch_detail_screen/widgets/rocket_detail_widget.dart';
import 'package:spacex_app/res/colors.dart';
import 'package:spacex_app/res/strings.dart';
import 'package:spacex_app/utils/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/widgets/launch_status_widget.dart';
import 'package:spacex_app/feature/launch_detail_screen/repo/launch_detail_repository.dart';
import 'package:spacex_app/providers/api_client.dart';
import 'package:dio/dio.dart';

class LaunchDetailScreen extends StatefulWidget {
  final LaunchArgumentsModel launchModel;

  const LaunchDetailScreen({Key key, this.launchModel}) : super(key: key);

  @override
  _LaunchDetailScreenState createState() => _LaunchDetailScreenState();
}

class _LaunchDetailScreenState extends State<LaunchDetailScreen> {
  RocketDetailBloc rocketDetailBloc;
  LaunchpadDetailBloc launchpadDetailBloc;

  @override
  void initState() {
    super.initState();

    //TODO : solve di error and use singleton instead
    rocketDetailBloc = RocketDetailBloc(
        launchDetailRepository:
            LaunchDetailRepository(apiClient: ApiClient(Dio())));
    launchpadDetailBloc = LaunchpadDetailBloc(
        launchDetailRepository:
            LaunchDetailRepository(apiClient: ApiClient(Dio())));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          widget.launchModel.name,
          style: theme.textTheme.headline1
              .copyWith(color: AppColors.colorWhite, fontSize: 20),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => rocketDetailBloc
              ..add(GetRocketDetailEvent(widget.launchModel.rocketId)),
          ),
          BlocProvider(
            create: (context) => launchpadDetailBloc
              ..add(GetLaunchPadDetailsEvent(widget.launchModel.launcePad)),
          )
        ],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LargePatchImageWidget(
                imageUrl: widget.launchModel.largePatch,
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    widget.launchModel.name,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline1.copyWith(fontSize: 28.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  widget.launchModel.detail ?? "",
                  style: theme.textTheme.bodyText1.copyWith(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
                child: Text(
                  "${UiStrings.launchDate} ${convertUtcTOLocalDate(widget.launchModel.date)}",
                  style: theme.textTheme.bodyText1.copyWith(fontSize: 18.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: LaunchStatusWidget(
                  successStatus: widget.launchModel.success ?? false,
                  upcomingStatus: widget.launchModel.upcoming ?? false,
                  failures: widget.launchModel.failures ?? [],
                ),
              ),
              RocketDetailWidget(),
              LaunchPadDetailWidget()
            ],
          ),
        ),
      ),
    );
  }
}
