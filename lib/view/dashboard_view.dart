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
      backgroundColor: const Color.fromARGB(
          255, 241, 227, 227), // Light grey background for the entire screen
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        // backgroundColor: Colors.black, // AppBar background color (black)
        elevation: 0, // No shadow for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: <Widget>[
            // Area of Circle Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for the card
              ),
              elevation: 4, // Subtle shadow to make the card stand out
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
                    Icon(Icons.circle,
                        size: 48, color: Colors.black), // Black icon color
                    SizedBox(height: 8),
                    Text(
                      'Area of Circle',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // Black text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Simple Interest Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for the card
              ),
              elevation: 4, // Subtle shadow to make the card stand out
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
                    Icon(Icons.monetization_on,
                        size: 48, color: Colors.black), // Black icon color
                    SizedBox(height: 8),
                    Text(
                      'Simple Interest',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // Black text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Student List Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for the card
              ),
              elevation: 4, // Subtle shadow to make the card stand out
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
                    Icon(Icons.school,
                        size: 48, color: Colors.black), // Black icon color
                    SizedBox(height: 8),
                    Text(
                      'Student List',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // Black text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
