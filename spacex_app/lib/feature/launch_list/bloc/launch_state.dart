part of 'launch_bloc.dart';

abstract class LaunchState extends Equatable {
  const LaunchState();
}

class LaunchInitial extends LaunchState {
  @override
  List<Object> get props => [];
}

class LaunchListLoadingState extends LaunchState {
  @override
  String toString() => "LaunchListLoadingState";

  @override
  List<Object> get props => [];
}

class LaunchListLoaded extends LaunchState {
  final List<LaunchListModel> launches;

  LaunchListLoaded(this.launches);

  @override
  String toString() => "LaunchListLoadingState";

  @override
  List<Object> get props => [this.launches];
}

class LaunchListErrorState extends LaunchState {
  final errorMessage;

  LaunchListErrorState(this.errorMessage);

  @override
  String toString() => "LaunchListErrorState";

  @override
  List<Object> get props => [this.errorMessage];
}
