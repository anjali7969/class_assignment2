import 'package:class_assignment2/app.dart';
import 'package:class_assignment2/service_locator/init_dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(
    App(),
  );
}
