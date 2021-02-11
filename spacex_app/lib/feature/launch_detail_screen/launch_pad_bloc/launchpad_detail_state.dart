part of 'launchpad_detail_bloc.dart';

abstract class LaunchpadDetailState extends Equatable {
  const LaunchpadDetailState();
}

class LaunchPadDetailLoading extends LaunchpadDetailState {
  @override
  List<Object> get props => [];
}

class LaunchPadDetailLoaded extends LaunchpadDetailState {
  final LaunchPadDetailResponse response;

  LaunchPadDetailLoaded(this.response);
  @override
  List<Object> get props => [this.response];
}

class LaunchPadDetailError extends LaunchpadDetailState {
  final String errorMessage;

  LaunchPadDetailError(this.errorMessage);
  @override
  List<Object> get props => [this.errorMessage];
}
