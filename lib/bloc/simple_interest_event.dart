part of 'simple_interest_bloc.dart';

sealed class SimpleInterestEvent extends Equatable {
  const SimpleInterestEvent();

  @override
  List<Object?> get props => [];
}

final class CalculateSimpleInterestEvent extends SimpleInterestEvent {
  final double principal;
  final double rate;
  final double time;

  const CalculateSimpleInterestEvent({
    required this.principal,
    required this.rate,
    required this.time,
  });

  @override
  List<Object?> get props => [principal, rate, time];
}
