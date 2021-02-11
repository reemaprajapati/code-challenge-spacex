part of 'launch_bloc.dart';

abstract class LaunchEvent extends Equatable {
  const LaunchEvent();
}

class GetLaunchesListEvent extends LaunchEvent {

  @override
  String toString() => "GetLaunchesListEvent";

  @override
  List<Object> get props => [];

}
