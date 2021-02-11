import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/feature/launch_detail_screen/rocket_detail_bloc/rocket_detail_bloc.dart';
import 'package:spacex_app/res/strings.dart';
import 'package:spacex_app/utils/utilities.dart';

class RocketDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<RocketDetailBloc, RocketDetailState>(
      listener: (context, state) {
        if (state is RocketDetailError) {
          displaySnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is RocketDetailLoaded) {
          var rocket = state.response;
          return Container(
            margin: EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  UiStrings.rocketDetails,
                  style: theme.textTheme.headline1.copyWith(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    rocket.name,
                    style: theme.textTheme.bodyText1.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Country: ${rocket.country}",
                    style: theme.textTheme.bodyText1.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Manufacturer: ${rocket.company}",
                    style: theme.textTheme.bodyText1.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
