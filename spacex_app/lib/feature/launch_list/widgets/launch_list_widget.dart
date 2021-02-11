import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/feature/launch_list/bloc/launch_bloc.dart';
import 'package:spacex_app/feature/launch_list/widgets/launch_item_widget.dart';
import 'package:spacex_app/res/colors.dart';
import 'package:spacex_app/utils/utilities.dart';
import 'package:spacex_app/widgets/loading_indicator.dart';

class LaunchListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaunchListBloc, LaunchState>(
      builder: (context, state) {
        if (state is LaunchListLoadingState) {
          return LoadingIndicator();
        } else if (state is LaunchListLoaded) {
          var launches = state.launches;
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
              itemBuilder: (BuildContext context, int index) {
                var launchItem = launches[index];
                return ListTile(
                  title: LaunchItemWidget(
                    launchModel: launchItem,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                    color: AppColors.colorBlack.withOpacity(.1),
                    height: 1.0,
                  ),
              itemCount: launches.length);
        } else {
          return SizedBox.shrink();
        }
      },
      listener: (context, state) {
        if (state is LaunchListErrorState) {
          displaySnackBar(context, state.errorMessage);
        }
      },
    );
  }
}
