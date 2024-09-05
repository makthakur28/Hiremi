import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hiremi/model/user_model.dart';
import 'package:hiremi/screens/login.dart';
import 'package:hiremi/screens/pageview.dart';
import 'package:hiremi/service/http_service.dart';

import 'package:intl/intl.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingController for form fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController collegeStateController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController degreeNameController = TextEditingController();
  final TextEditingController passingYearController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _gender; // For gender selection
  bool _isSubmitting = false;

  // Method to handle form submission
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      User user = User(
        full_name: fullNameController.text,
        father_name: fatherNameController.text,
        email: emailController.text,
        date_of_birth: dobController.text,
        gender: _gender!,
        phone_number: phoneNumberController.text,
        whatsapp_number: whatsappNumberController.text,
        college_state: collegeStateController.text,
        birth_place: birthPlaceController.text,
        college_name: collegeNameController.text,
        branch_name: branchNameController.text,
        degree_name: degreeNameController.text,
        passing_year: int.tryParse(passingYearController.text),
        password: passwordController.text,
        verified: false,
      );

      try {
        // user.toMap();
        final response = await HttpService.registerUser(user);

        setState(() {
          _isSubmitting = false;
        });

        if (response?.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Registration Successful!Logging in ...'),
          ));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return PageScreen(user: user);
          }));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Registration Failed!'),
          ));
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    }
  }

  // final TextEditingController dobController = TextEditingController();
  DateTime? selectedDate;

  // Method to show the DatePicker and set the formatted date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Set a reasonable first date
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text =
            DateFormat('yyyy-MM-dd').format(picked); // Set the formatted date
      });
    }
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Registration Form'),
      // ),
      body: Container(
        color: const Color.fromARGB(255, 255, 234, 200),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Register Here',
                  style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign Up to Continue',
                  style: TextStyle(
                      // fontFamily: 'monospace',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: fatherNameController,
                  decoration: const InputDecoration(labelText: 'Father Name'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: dobController,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context), // Call date picker
                    ),
                  ),
                  readOnly: true, // Prevent manual input
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your date of birth';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _gender,
                  items: ['Male', 'Female', 'Other'].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Gender'),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) => _validatePhoneNumber(value),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: whatsappNumberController,
                  decoration: const InputDecoration(labelText: 'WhatsApp Number'),
                  validator: (value) => _validatePhoneNumber(value),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: collegeStateController,
                  decoration: const InputDecoration(labelText: 'College State'),
                ),
                TextFormField(
                  controller: birthPlaceController,
                  decoration: const InputDecoration(labelText: 'Birth Place'),
                ),
                TextFormField(
                  controller: collegeNameController,
                  decoration: const InputDecoration(labelText: 'College Name'),
                ),
                TextFormField(
                  controller: branchNameController,
                  decoration: const InputDecoration(labelText: 'Branch Name'),
                ),
                TextFormField(
                  controller: degreeNameController,
                  decoration: const InputDecoration(labelText: 'Degree Name'),
                ),
                TextFormField(
                  controller: passingYearController,
                  decoration: const InputDecoration(labelText: 'Passing Year'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                _isSubmitting
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        style: const ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size(300, 50)),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 255, 133, 77))),
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          'Login Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}