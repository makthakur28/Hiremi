import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hiremi/model/user_model.dart';
import 'package:hiremi/screens/pageview.dart';
import 'package:hiremi/screens/register.dart';
import 'package:hiremi/service/http_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        User? user = await HttpService.getRandomUser();
        // ignore: use_build_context_synchronously
        if (user != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return PageScreen(user: user);
          }));
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error in login : $e");
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }

      // // Prepare data to be sent
      // final data = {
      //   "email": emailController.text,
      //   "password": passwordController.text,
      // };

      // try {
      //   // Send POST request to login API
      //   final response = await http.post(
      //     Uri.parse('http://13.127.246.196:8000/api/registers/'),
      //     headers: {"Content-Type": "application/json"},
      //     body: jsonEncode(data),
      //   );

      //   if (response.statusCode == 201) {
      //     // Login successful
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Login successful!')),
      //     );
      //     // You can navigate to the home page or dashboard here
      //   } else {
      //     // Handle login error
      //     final responseData = jsonDecode(response.body);
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text(responseData['detail'] ?? 'Login failed')),
      //     );
      //   }
      // } catch (e) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('An error occurred. Please try again later.')),
      //   );
      // } finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 255, 234, 200),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Welcome to Hiremi',
                  style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign In to Continue',
                  style: TextStyle(
                      // fontFamily: 'monospace',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                  
                // Password Field
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                  
                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: _isLoading
                      ? const Center(
                          child:
                              CircularProgressIndicator()) // Show loading indicator while logging in
                      : ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.orange)
                        ),
                          onPressed: _login,
                          child: const Text('Login',style: TextStyle(color: Colors.white),),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationForm(),
                            ));
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.redAccent),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
                  
                // You can add a "Forgot Password" or "Register" link here if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
