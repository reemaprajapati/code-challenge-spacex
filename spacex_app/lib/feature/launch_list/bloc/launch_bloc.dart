import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex_app/feature/launch_list/data/launch_list_model.dart';
import 'package:spacex_app/feature/launch_list/repo/launch_list_repository.dart';

part 'launch_event.dart';

part 'launch_state.dart';

class LaunchListBloc extends Bloc<LaunchEvent, LaunchState> {
  final LaunchListRepository launchListRepository;

  LaunchListBloc({@required this.launchListRepository})
      : super(LaunchListLoadingState());

  @override
  Stream<LaunchState> mapEventToState(
    LaunchEvent event,
  ) async* {
    if (event is GetLaunchesListEvent) {
      yield LaunchListLoadingState();
      try {
        var result = await launchListRepository.getLaunchList();
        yield LaunchListLoaded(result);
      } catch (e) {
        yield LaunchListErrorState(e);
      }
    }
  }
}
