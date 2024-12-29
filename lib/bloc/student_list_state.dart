part of 'student_list_bloc.dart';

sealed class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object?> get props => [];
}

final class StudentInitial extends StudentState {}

final class StudentLoaded extends StudentState {
  final List<Map<String, dynamic>> students;

  const StudentLoaded(this.students);

  @override
  List<Object?> get props => [students];
}

final class StudentError extends StudentState {
  final String errorMessage;

  const StudentError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
