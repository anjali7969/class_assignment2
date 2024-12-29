import 'package:class_assignment2/view/area_of_circle_view.dart';
import 'package:class_assignment2/view/simple_interest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/area_of_circle_bloc.dart';
import '../bloc/simple_interest_bloc.dart';
import '../bloc/student_list_bloc.dart';
import 'student_list_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: <Widget>[
          // Area of Circle Card
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (_) => AreaBloc(),
                      child: const AreaOfCircleView(),
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.circle, size: 48),
                  Text('Area of Circle'),
                ],
              ),
            ),
          ),
          // Simple Interest Card
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (_) => SimpleInterestBloc(),
                      child: const SimpleInterestView(),
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.monetization_on, size: 48),
                  Text('Simple Interest'),
                ],
              ),
            ),
          ),
          // Student List Card
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (_) => StudentBloc(),
                      child: const StudentListView(),
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.school, size: 48),
                  Text('Student List'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
