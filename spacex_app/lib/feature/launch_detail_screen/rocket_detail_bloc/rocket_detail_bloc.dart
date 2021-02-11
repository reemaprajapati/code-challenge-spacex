import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex_app/feature/launch_detail_screen/data/rocket_detail_reponse.dart';
import 'package:spacex_app/feature/launch_detail_screen/repo/launch_detail_repository.dart';

part 'rocket_detail_event.dart';
part 'rocket_detail_state.dart';

class RocketDetailBloc extends Bloc<RocketDetailEvent, RocketDetailState> {
  LaunchDetailRepository launchDetailRepository;

  RocketDetailBloc({@required this.launchDetailRepository}) : super(RocketDetailLoading());

  @override
  Stream<RocketDetailState> mapEventToState(
    RocketDetailEvent event,
  ) async* {
    if(event is GetRocketDetailEvent){
      yield RocketDetailLoading();
      try {
        var result = await launchDetailRepository.getRocketDetails(event.rocketId);
        yield RocketDetailLoaded(result);
      } catch (e) {
        yield RocketDetailError(e.toString());
      }
    }
  }
}
