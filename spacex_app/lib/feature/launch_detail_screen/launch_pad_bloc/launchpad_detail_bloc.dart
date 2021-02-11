import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex_app/feature/launch_detail_screen/data/launch_pad_detail_response.dart';
import 'package:spacex_app/feature/launch_detail_screen/repo/launch_detail_repository.dart';

part 'launchpad_detail_event.dart';

part 'launchpad_detail_state.dart';

class LaunchpadDetailBloc
    extends Bloc<LaunchpadDetailEvent, LaunchpadDetailState> {
  LaunchDetailRepository launchDetailRepository;

  LaunchpadDetailBloc({@required this.launchDetailRepository})
      : super(LaunchPadDetailLoading());

  @override
  Stream<LaunchpadDetailState> mapEventToState(
    LaunchpadDetailEvent event,
  ) async* {
    if (event is GetLaunchPadDetailsEvent) {
      yield LaunchPadDetailLoading();
      try {
        var result =
            await launchDetailRepository.getLaunchPadDetails(event.launchPadId);
        yield LaunchPadDetailLoaded(result);
      } catch (e) {
        yield LaunchPadDetailError(e);
      }
    }
  }
}
