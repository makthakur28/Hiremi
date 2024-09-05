import 'package:flutter/material.dart';
import 'package:hiremi/model/user_model.dart';
import 'package:hiremi/screens/login.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  User user;
  ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = ScrollController();
  late User user;
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.full_name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.verified ? 'Verified' : 'Not Verified',
                      style: TextStyle(
                        color: user.verified ? Colors.green : Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(
                    child: Text(
                  'Personal Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
                Icon(Icons.edit)
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.email)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          "Father's Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.father_name)),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          'Phone',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text('Email')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'Whatsapp',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.whatsapp_number)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'DOB',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.date_of_birth)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'Gender',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.gender)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'Birth place',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.birth_place)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(
                    child: Text(
                  'Education',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
                Icon(Icons.edit)
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'Degree ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.degree_name)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          "Branch",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.branch_name)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'College Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.college_name)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'College State',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.college_state)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'Passing Year',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Expanded(child: Text(user.passing_year.toString())),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red)),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
