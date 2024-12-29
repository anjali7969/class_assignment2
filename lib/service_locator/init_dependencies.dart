import 'package:class_assignment2/bloc/student_list_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/area_of_circle_bloc.dart'; // Import Area of circle Bloc
import '../bloc/simple_interest_bloc.dart'; // Import Simple Interest Bloc

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  // Registering the Blocs as Lazy Singletons
  serviceLocator.registerLazySingleton<AreaBloc>(() => AreaBloc());
  serviceLocator
      .registerLazySingleton<SimpleInterestBloc>(() => SimpleInterestBloc());
  serviceLocator.registerLazySingleton<StudentBloc>(() => StudentBloc());
}
