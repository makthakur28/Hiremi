import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hiremi/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService {
  String url = 'http://13.127.246.196:8000/api/registers/';
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data);
      } else {
        debugPrint('Failed to load data');
      }
    } catch (e) {
      debugPrint('Error in http response : $e');
    }
  }

  static Future<Response?> registerUser(user) async {
    try {
      final url = Uri.parse(
          'http://13.127.246.196:8000/api/registers/'); // Your API endpoint
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: User.fromMap(user.toMap()).toJson());
      return response;
    } catch (e) {
      debugPrint('Error in http response : $e');
    }
    return null;
  }

  static Future<User?> loginUser(email, password) async {
    //   try {
    //     print('inside the service login method');
    //     final url = Uri.parse(
    //         'http://13.127.246.196:8000/api/registers/'); // Your API endpoint
    //     final response = await http.post(url,
    //         headers: {
    //           'Content-Type': 'application/json',
    //         },
    //         body: jsonEncode({'email': email, 'password': password}));
    //     return response;
    //   } catch (e) {
    //     throw Exception('Error in http response : $e');
    //   }

    try {
      final response = await http.get(
        Uri.parse('http://13.127.246.196:8000/api/registers/?format=api'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return User.fromJson(response.body[0]);
    } catch (e) {
      if (kDebugMode) {
        print("Error in the login method : $e");
      }
    }
    return null;
  }

  static Future<User?> getRandomUser() async {
    try {
      final response = await http.get(
          Uri.parse('http://13.127.246.196:8000/api/registers/?format=json'));
      var data = response.body;

      return User.fromJson(json.encode(json.decode(data)[0]));
    } catch (e) {
      if (kDebugMode) {
        print('Error in getting random data : $e');
      }
    }
    return null;
  }
}
