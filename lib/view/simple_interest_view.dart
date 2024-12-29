import 'package:flutter/material.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  SimpleInterestScreenState createState() => SimpleInterestScreenState();
}

class SimpleInterestScreenState extends State<SimpleInterestView> {
  final _principalController = TextEditingController();
  final _rateController = TextEditingController();
  final _timeController = TextEditingController();
  double? _simpleInterest;

  void _calculateSimpleInterest() {
    final principal = double.tryParse(_principalController.text);
    final rate = double.tryParse(_rateController.text);
    final time = double.tryParse(_timeController.text);

    if (principal != null && rate != null && time != null) {
      setState(() {
        _simpleInterest = (principal * rate * time) / 100;
      });
    } else {
      setState(() {
        _simpleInterest = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Interest Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Calculate Simple Interest',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _principalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Principal',
                  labelStyle: const TextStyle(
                    color: Colors.pink,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rate (%)',
                  labelStyle: const TextStyle(
                    color: Colors.pink,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Time (years)',
                  labelStyle: const TextStyle(
                    color: Colors.pink,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _calculateSimpleInterest,
                child: const Text(
                  'Calculate Interest',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_simpleInterest != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Simple Interest:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _simpleInterest!.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              if (_simpleInterest == null &&
                  (_principalController.text.isNotEmpty ||
                      _rateController.text.isNotEmpty ||
                      _timeController.text.isNotEmpty))
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Please enter valid values for all fields!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
