part of 'rocket_detail_bloc.dart';

abstract class RocketDetailState extends Equatable {
  const RocketDetailState();
}

class RocketDetailLoading extends RocketDetailState {
  @override
  List<Object> get props => [];
}

class RocketDetailLoaded extends RocketDetailState {
  final RocketDetailResponse response;

  RocketDetailLoaded(this.response);
  @override
  List<Object> get props => [this.response];
}

class RocketDetailError extends RocketDetailState {
  final String errorMessage;

  RocketDetailError(this.errorMessage);
  @override
  List<Object> get props => [this.errorMessage];
}


