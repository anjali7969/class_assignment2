import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_list_event.dart';
part 'student_list_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<AddStudentEvent>((event, emit) {
      if (state is StudentLoaded) {
        final currentState = state as StudentLoaded;
        final updatedList =
            List<Map<String, dynamic>>.from(currentState.students)
              ..add({
                'name': event.name,
                'age': event.age,
                'address': event.address,
              });
        emit(StudentLoaded(updatedList));
      } else {
        emit(StudentLoaded([
          {'name': event.name, 'age': event.age, 'address': event.address}
        ]));
      }
    });

    on<RemoveStudentEvent>((event, emit) {
      if (state is StudentLoaded) {
        final currentState = state as StudentLoaded;
        final updatedList =
            List<Map<String, dynamic>>.from(currentState.students)
              ..removeAt(event.index);
        emit(StudentLoaded(updatedList));
      }
    });
  }
}
