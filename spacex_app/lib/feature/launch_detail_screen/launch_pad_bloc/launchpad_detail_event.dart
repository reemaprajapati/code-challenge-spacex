part of 'launchpad_detail_bloc.dart';

abstract class LaunchpadDetailEvent extends Equatable {
  const LaunchpadDetailEvent();
}

class GetLaunchPadDetailsEvent extends LaunchpadDetailEvent{
  final String launchPadId;

  GetLaunchPadDetailsEvent(this.launchPadId);

  @override
  List<Object> get props => [this.launchPadId];

}
