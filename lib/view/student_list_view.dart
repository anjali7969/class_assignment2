import 'package:class_assignment2/model/student_model.dart';
import 'package:flutter/material.dart';

class StudentListView extends StatefulWidget {
  const StudentListView({super.key});

  @override
  StudentViewState createState() => StudentViewState();
}

class StudentViewState extends State<StudentListView> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();

  final List<StudentModel> _students = [];

  void _addStudent(StudentModel student) {
    setState(() {
      _students.add(student);
    });
  }

  void _deleteStudent(int index) {
    setState(() {
      _students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Management',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add a New Student',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey2,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: const TextStyle(
                          color: Colors.pink,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.pink, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        labelStyle: const TextStyle(
                          color: Colors.pink,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.pink, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null) {
                          return 'Please enter a valid age';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: const TextStyle(
                          color: Colors.pink,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.pink, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey2.currentState!.validate()) {
                          final student = StudentModel(
                            name: _nameController.text,
                            age: int.parse(_ageController.text),
                            address: _addressController.text,
                          );
                          _addStudent(student);
                          _nameController.clear();
                          _ageController.clear();
                          _addressController.clear();
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Student List',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 10),
              _students.isEmpty
                  ? const Center(
                      child: Text(
                        'No students added yet',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _students.length,
                      itemBuilder: (context, index) {
                        final student = _students[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    student.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text('Age: ${student.age}'),
                                  Text('Address: ${student.address}'),
                                ],
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteStudent(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
