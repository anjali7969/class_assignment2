import 'package:equatable/equatable.dart';

class StudentModel extends Equatable {
  final String name;
  final int age;
  final String address;

  const StudentModel({
    required this.name,
    required this.age,
    required this.address,
  });

  @override
  List<Object> get props => [
        name,
        age,
        address,
      ];
}

class StudentState {
  final List<StudentModel> lstStudents;
  final bool isLoading;

  const StudentState({
    required this.lstStudents,
    required this.isLoading,
  });

  factory StudentState.initial() {
    return StudentState(
      lstStudents: [],
      isLoading: false,
    );
  }

  StudentState copyWith({
    List<StudentModel>? lstStudents,
    bool? isLoading,
  }) {
    return StudentState(
      lstStudents: lstStudents ?? this.lstStudents,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
