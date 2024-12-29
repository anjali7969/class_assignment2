import 'package:class_assignment2/view/dashboard_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BLoC',
      home: const DashboardView(), // Use a plain widget for the dashboard
    );
  }
}
