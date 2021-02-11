part of 'rocket_detail_bloc.dart';

abstract class RocketDetailEvent extends Equatable {
  const RocketDetailEvent();
}

class GetRocketDetailEvent extends RocketDetailEvent {
  final String rocketId;

  GetRocketDetailEvent(this.rocketId);
  @override
  List<Object> get props => [this.rocketId];
}
