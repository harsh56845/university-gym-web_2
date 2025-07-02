import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class GymRegistrationPage extends StatefulWidget {
  const GymRegistrationPage({super.key});

  @override
  State<GymRegistrationPage> createState() => _GymRegistrationPageState();
}

class _GymRegistrationPageState extends State<GymRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  Uint8List? _signatureBytes;
  String? _signatureFileName;

  Future<void> _pickSignatureFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf'],
      withData: true, // Important for web
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _signatureFileName = result.files.single.name;
        _signatureBytes = result.files.single.bytes;
      });
    }
  }

  String sessionFrom = '';
  String sessionTo = '';
  List<String> purposes = [];
  String name = '';
  String classDept = '';
  String id = '';
  String category = '';
  String height = '';
  String weight = '';
  String chest = '';
  String biceps = '';
  String waist = '';
  String thigh = '';
  String calf = '';
  String digitalSignature = '';
  String date = '';

  final List<String> purposeOptions = [
    'Fitness',
    'Body Building',
    'Weight Lifting',
    'Powerlifting',
    'Yoga',
    'Wrestling',
    'General Wellness',
    'Specific Sports Training',
  ];

  final List<String> categoryOptions = [
    'Student',
    'Employee',
    'Retired Employee',
    'Alumni',
    'Privileged Member',
    'Guest Ticket',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  Widget _sectionWrapper({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gym Registration Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "University Gymnasium Club\nFitness, Yoga & Wellness Centre\nRegistration Form",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),

              _sectionWrapper(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Session",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "From (e.g., 2025)",
                            ),
                            onSaved: (val) => sessionFrom = val ?? '',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "To (e.g., 2026)",
                            ),
                            onSaved: (val) => sessionTo = val ?? '',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Purpose of joining:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: purposeOptions.map((item) {
                        return FilterChip(
                          label: Text(item),
                          selected: purposes.contains(item),
                          onSelected: (val) {
                            setState(() {
                              val ? purposes.add(item) : purposes.remove(item);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              _sectionWrapper(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Personal Details",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Full Name"),
                      onSaved: (val) => name = val ?? '',
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Class / Department",
                      ),
                      onSaved: (val) => classDept = val ?? '',
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enrollment / Employee ID",
                      ),
                      onSaved: (val) => id = val ?? '',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Category",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Wrap(
                      spacing: 10,
                      children: categoryOptions.map((cat) {
                        return ChoiceChip(
                          label: Text(cat),
                          selected: category == cat,
                          onSelected: (_) => setState(() => category = cat),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              _sectionWrapper(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Physical Measurements",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Height (feet)",
                            ),
                            onSaved: (val) => height = val ?? '',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Weight (kg)",
                            ),
                            onSaved: (val) => weight = val ?? '',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Chest (inches)",
                            ),
                            onSaved: (val) => chest = val ?? '',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Biceps (inches)",
                            ),
                            onSaved: (val) => biceps = val ?? '',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Waist (inches)",
                            ),
                            onSaved: (val) => waist = val ?? '',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Thigh (inches)",
                            ),
                            onSaved: (val) => thigh = val ?? '',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Calf (inches)",
                      ),
                      onSaved: (val) => calf = val ?? '',
                    ),
                  ],
                ),
              ),

              //HLOL
              _sectionWrapper(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Undertaking & Responsibility",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "I, the undersigned, acknowledge that I am solely responsible for any mishap, injury, or health issue "
                      "that may occur to myself during my activities at the university gymnasium. I agree to abide by all "
                      "rules and regulations and pay for any damage caused by me.",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Upload Digital Signature"),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          // onPressed: () {
                          //   // _pickFile();
                          //   _pickSignatureFile();
                          // },
                          icon: const Icon(Icons.upload),
                          label: const Text("Choose File"),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "No file selected",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     labelText: "Digital Signature",
                    //   ),
                    //   onSaved: (val) => digitalSignature = val ?? '',
                    // ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Date"),
                      onSaved: (val) => date = val ?? '',
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  "Submit Form",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
