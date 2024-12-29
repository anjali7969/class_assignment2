part of 'area_of_circle_bloc.dart';

sealed class AreaOfCircleEvent extends Equatable {
  const AreaOfCircleEvent();

  @override
  List<Object?> get props => [];
}

final class CalculateAreaOfCircleEvent extends AreaOfCircleEvent {
  final double radius;

  const CalculateAreaOfCircleEvent({required this.radius});

  @override
  List<Object?> get props => [radius];
}
