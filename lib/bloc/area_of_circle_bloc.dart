import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'area_of_circle_event.dart';

class AreaBloc extends Bloc<AreaOfCircleEvent, double> {
  AreaBloc() : super(0);

  Stream<double> mapEventToState(AreaOfCircleEvent event) async* {
    if (event is CalculateAreaOfCircleEvent) {
      final area = 3.14 * event.radius * event.radius; // Calculate area
      yield area; // Yield the calculated area as the new state
    }
  }
}
