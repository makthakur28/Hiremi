// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class User {
  String full_name;
  String father_name;
  String email;
  String date_of_birth;
  String gender;
  String phone_number;
  String whatsapp_number;
  String college_state;
  String birth_place;
  String college_name;
  String branch_name;
  String degree_name;
  int? passing_year;
  String password;
  bool verified;
  User({
    required this.full_name,
    required this.father_name,
    required this.email,
    required this.date_of_birth,
    required this.gender,
    required this.phone_number,
    required this.whatsapp_number,
    required this.college_state,
    required this.birth_place,
    required this.college_name,
    required this.branch_name,
    required this.degree_name,
    required this.passing_year,
    required this.password,
    required this.verified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'full_name': full_name,
      'father_name': father_name,
      'email': email,
      'date_of_birth': date_of_birth,
      'gender': gender,
      'phone_number': phone_number,
      'whatsapp_number': whatsapp_number,
      'college_state': college_state,
      'birth_place': birth_place,
      'college_name': college_name,
      'branch_name': branch_name,
      'degree_name': degree_name,
      'passing_year': passing_year,
      'password': password,
      'verified': verified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      full_name: map['full_name'] as String,
      father_name: map['father_name'] as String,
      email: map['email'] as String,
      date_of_birth: map['date_of_birth'] as String,
      gender: map['gender'] as String,
      phone_number: map['phone_number'] as String,
      whatsapp_number: map['whatsapp_number'] as String,
      college_state: map['college_state'] as String,
      birth_place: map['birth_place'] as String,
      college_name: map['college_name'] as String,
      branch_name: map['branch_name'] as String,
      degree_name: map['degree_name'] as String,
      passing_year: map['passing_year'] as int,
      password: map['password'] as String,
      verified: map['verified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
