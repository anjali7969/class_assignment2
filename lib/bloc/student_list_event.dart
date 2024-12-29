part of 'student_list_bloc.dart';

sealed class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object?> get props => [];
}

final class AddStudentEvent extends StudentEvent {
  final String name;
  final int age;
  final String address;

  const AddStudentEvent({
    required this.name,
    required this.age,
    required this.address,
  });

  @override
  List<Object?> get props => [name, age, address];
}

final class RemoveStudentEvent extends StudentEvent {
  final int index;

  const RemoveStudentEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
