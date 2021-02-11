import 'package:flutter/material.dart';
import 'package:spacex_app/feature/launch_detail_screen/launch_pad_bloc/launchpad_detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/res/strings.dart';
import 'package:spacex_app/utils/utilities.dart';

class LaunchPadDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<LaunchpadDetailBloc, LaunchpadDetailState>(
      listener: (context, state) {
        if (state is LaunchPadDetailError) {
          displaySnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LaunchPadDetailLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    UiStrings.siteDetails,
                    style: theme.textTheme.headline1.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "${state.response.fullName}, ${state.response.region}",
                    style: theme.textTheme.bodyText1.copyWith(
                      fontSize: 18,
                    ),
                  ),
            ]),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
