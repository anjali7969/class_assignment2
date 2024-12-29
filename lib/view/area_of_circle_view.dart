import 'package:flutter/material.dart';

class AreaOfCircleView extends StatefulWidget {
  const AreaOfCircleView({super.key});

  @override
  AreaOfCircleScreenState createState() => AreaOfCircleScreenState();
}

class AreaOfCircleScreenState extends State<AreaOfCircleView> {
  final _radiusController = TextEditingController();
  double? _circleArea;

  void _calculateCircleArea() {
    final radius = double.tryParse(_radiusController.text);
    if (radius != null) {
      setState(() {
        _circleArea = 3.14159 * radius * radius;
      });
    } else {
      setState(() {
        _circleArea = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Circle Area Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Calculate the Area of a Circle',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _radiusController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Radius',
                  labelStyle: const TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                  ),
                  hintText: 'Enter the radius',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Changed to teal
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                onPressed: _calculateCircleArea,
                child: const Text(
                  'Calculate Area',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (_circleArea != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50, // Lighter teal background
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Circle Area:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _circleArea!.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              if (_circleArea == null && _radiusController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Please enter a valid radius!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
